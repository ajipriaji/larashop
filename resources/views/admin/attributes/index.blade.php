@extends('admin.layout')

@section('content')
    <div class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="card card-default">
                    <div class="card-header card-header-border-bottom">
                        <h2>Attributes</h2>
                    </div>
                    <div class="card-body">
                        @include('admin.partials.flash')
                        <table class="table table-bordered table-striped">
                            <thead>
                                <th>#</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @forelse ($attributes as $attribute)
                                    <tr>    
                                        <td>{{ $attribute->id }}</td>
                                        <td>{{ $attribute->code }}</td>
                                        <td>{{ $attribute->name }}</td>
                                        <td>{{ $attribute->type }}</td>
                                        <td>
                                            @can('edit_attributes')
                                                <a href="{{ url('admin/attributes/'. $attribute->id .'/edit') }}" class="btn btn-warning btn-sm">Edit</a>
                                            @endcan

                                            @can('add_attributes')
                                                @if ($attribute->type == 'select')
                                                <a href="{{ url('admin/attributes/'. $attribute->id .'/options') }}" class="btn btn-success btn-sm">Options</a>
                                                @endif
                                            @endcan

                                            @can('delete_attributes')
                                                <form action="{{ url('admin/attributes/'. $attribute->id) }}" method="POST" style="display:inline-block" class="delete">
                                                    @method('delete')
                                                        @csrf
                                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                                </form>
                                            @endcan
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5">No records found</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                        {{ $attributes->links() }}
                    </div>
                    @can('add_attributes')
                        <div class="card-footer text-right">
                            <a href="{{ url('admin/attributes/create') }}" class="btn btn-primary">Add New</a>
                        </div>
                    @endcan
                </div>
            </div>
        </div>
    </div>
@endsection