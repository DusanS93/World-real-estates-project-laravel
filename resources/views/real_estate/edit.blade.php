@extends('layouts.app')

@section('content')
<h3 class="headingOfForms">Edit estate</h3>
<form id="editForm" enctype="multipart/form-data">
    @csrf
    @method("PUT")
    
    <input type="hidden" name="id" value="{{ $estate->id }}">
    <input type="text" id="title" name="title" value="{{ $estate->title }}"><br><br>

    <label for="images">You can select new images:</label><br>
    <input type="file" name="images[]" id="editImageUpload" multiple><br><br>

    @php
       $arrayImages = json_decode($estate->images, true);
    @endphp

    <div class="editImages">
      <p>Current images:</p>
      @if($arrayImages != null)
        @foreach($arrayImages as $image)
            <img class="showImages" src="{{ asset('storage/images/'.$image) }}" alt="image">
        @endforeach
      @else
            <p>No images...</p>
      @endif
    </div>

    <input type="text" id="country" name="country" value="{{ $estate->country }}"><br><br>
    <input type="text" id="city" name="city" value="{{ $estate->city }}"><br><br>
    <input type="text" id="description" name="description" value="{{ $estate->description }}"><br><br>
    <input type="number" id="price" name="price" value="{{ $estate->price }}"><br><br>
    <h4>Choose category</h4>
    <select name="category" id="category">
        <option value="{{ $estate->category->id }}">{{ $estate->category->category }} </option>
        @foreach($categories as $category)
            @if($category->category == $estate->category->category) 
                continue;
            @else
                <option value="{{ $category->id }}">{{ $category->category }}</option>
            @endif
        @endforeach
    </select><br><br>
    <button type="button" id="editData">Edit real estate</button>
</form>

<div id="editMessage"></div>

@endsection