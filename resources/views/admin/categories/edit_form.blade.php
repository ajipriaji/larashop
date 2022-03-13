@extends('admin.layout')

@section('content')
    
@php
    $formTitle = !empty($category) ? 'Update' : 'New'    
@endphp

    <div class="row">
        <div class="col-lg-6">
            <div class="card card-default">
                <div class="card-header card-header-border-bottom">
                    <h2>{{ $formTitle }} Category</h2>
                </div>
                <div class="card-body">
                    @include('admin.partials.flash')
                    <form action="{{ url('admin/categories/'.$category->id) }}" method="POST">
                    @method('put')
                    @csrf
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" type="text" name="name" placeholder="Category Name" value="{{old('name', $category->name)}}">
                        </div>
                        
                        <div class="form-footer pt-5 border-top">
                            <button type="submit" class="btn btn-primary btn-default">Save</button>
                            <a href="{{ url('admin/categories') }}" class="btn btn-secondary">Back</a>
                        </div>
                    </form>
                </div>
            </div>  
        </div>
    </div>
@endsection