<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'parent_id',
        'user_id',
        'sku',
        'type',
        'name',
        'slug',
        'price',
        'weight',
        'length',
        'width',
        'height',
        'short_description',
        'description',
        'status',
    ];

    public const DRAFT = 0;
	public const ACTIVE = 1;
	public const INACTIVE = 2;

	public const STATUSES = [
		self::DRAFT => 'draft',
		self::ACTIVE => 'active',
		self::INACTIVE => 'inactive',
	];

	public const SIMPLE = 'simple';
	public const CONFIGURABLE = 'configurable';
	public const TYPES = [
		self::SIMPLE => 'Simple',
		self::CONFIGURABLE => 'Configurable',
	];

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function productInventory()
    {
        return $this->hasOne('App\Models\ProductInventory');
    }

    public function categories()
    {
        return $this->belongsToMany('App\Models\Category', 'product_categories');
    }

    public function variants()
    {
        return $this->hasMany('App\Models\Product', 'parent_id')->orderBy('price', 'asc');
    }

    public function parent()
    {
        return $this->belongsTo('App\Models\Product', 'parent_id');
    }

    public function productAttributeValues()
    {
        return $this->hasMany('App\Models\ProductAttributeValue', 'parent_product_id');
    }

    public function productImages()
    {
        return $this->hasMany('App\Models\ProductImage')->orderBy('id', 'desc');
    }

    public function orderItems()
	{
		return $this->hasMany('App\Models\OrderItem');
	}

    public static function statuses()
    {
        return self::STATUSES;
    }

    function status_label()
    {
        $statuses = $this->statuses();

       return isset($this->status) ? $statuses[$this->status] : null;
    }

    public static function types()
	{
		return self::TYPES;
	}

    public function scopeActive($query)
    {
        return $query->where('status', 1)
                ->where('parent_id', NULL);
    }

    public function scopePopular($query, $limit = 10)
	{
		$month = now()->format('m');

		return $query->selectRaw('products.*, COUNT(order_items.id) as total_sold')
			->join('order_items', 'order_items.product_id', '=', 'products.id')
			->join('orders', 'order_items.order_id', '=', 'orders.id')
			->whereRaw(
				'orders.status = :order_satus AND MONTH(orders.order_date) = :month',
				[
					'order_status' => Order::COMPLETED,
					'month' => $month
				]
			)
			->groupBy('products.id')
			->orderByRaw('total_sold DESC')
			->limit($limit);
	}

    function price_label()
    {
        return ($this->variants->count() > 0) ? $this->variants->first()->price : $this->price;
    }

    public function configurable()
	{
		return $this->type == 'configurable';
	}

	public function simple()
	{
		return $this->type == 'simple';
	}
}
