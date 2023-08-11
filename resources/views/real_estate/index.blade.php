@extends('layouts.app')

@section('content')
 <section class="banner">
    <img src="{{ url('/images/banner.jpg') }}" alt="banner">
    <h1>WORLD REAL ESTATES</h1>
 </section>

 <main class="main-content">
    <div class="main-text">
        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sunt, necessitatibus asperiores, ratione aliquam quae magni iure nemo numquam eligendi quis aspernatur sapiente veritatis repellat in rerum tempora labore facilis. Officiis.</p>
    </div>

    <form id="filterForm">
        @csrf
        <select id="categories-filter" name="categories-filter">
            <option value="0">- Filter by category -</option>
            @foreach($categories as $category)
              <option value="{{ $category->id }}">{{ $category->category }}</option>
            @endforeach
        </select>
        <button type="submit" id="filter">Apply filter</button>
    </form>

    <div class="main-articles">
        @foreach($estates as $estate)
            <div class="article">
                <a href="/real-estate/{{ $estate->id }}">
                    <h2>{{ $estate->title }}</h2>
                    <div class="article-wallpaper">
                    @if($estate->images != null)
                    @php
                    $arrayImages = json_decode($estate->images, true);
                    @endphp
                    <img src="{{ asset('storage/images/'.$arrayImages[0]) }}" alt="image">
                    @else
                    <img src="{{ asset('storage/images/no-image.jpg') }}" alt="image">
                    @endif
                    </div>
                </a>
                <p>Category: {{ $estate->category->category }}</p>
                <p>Country: {{ $estate->country }}</p>
                <p>City: {{ $estate->city }}</p>
                <p class="price">Price: {{ $estate->price }}&euro;</p>
            </div>
        @endforeach

    </div>

   <div class="paginate">{{ $estates->links() }}</div>

    <div class="main-text">
        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sunt, necessitatibus asperiores, ratione aliquam quae magni iure nemo numquam eligendi quis aspernatur sapiente veritatis repellat in rerum tempora labore facilis. Officiis.</p>
    </div>
 </main>
@endsection
