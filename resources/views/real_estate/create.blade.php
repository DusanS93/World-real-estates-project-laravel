@extends('layouts.app')

@section('content')
<h3 class="headingOfForms">Add new estate</h3>
<form id="createForm" enctype="multipart/form-data">
    @csrf
    <input type="text" id="title" name="title" placeholder="Title"><br><br>
    <input type="file" name="images[]" id="fileUpload" multiple><br><br>
    <input type="text" id="country" name="country" placeholder="Country"><br><br>
    <input type="text" id="city" name="city" placeholder="City"><br><br>
    <input type="text" id="description" name="description" placeholder="Description"><br><br>
    <input type="number" id="price" name="price" placeholder="Enter price of maximum 6 digits"><br><br>
    <h4>Choose category</h4>
    <select name="category" id="category">
        <option value="0">--Choose category--</option>
        @foreach($categories as $category)
            <option value="{{ $category->id }}">{{ $category->category }}</option>
        @endforeach
    </select><br><br>
    <button type="submit" id="addButton">Add real estate</button>
</form>

<div id="createMessage"></div>
@endsection