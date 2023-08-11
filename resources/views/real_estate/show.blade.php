@extends('layouts.app')

@section('content')
 <!-- <section class="banner">
    <img src="{{ url('/images/banner.jpg') }}" alt="banner">
    <h1>This place is reserved for banner</h1>
 </section> -->

 <main class="main-content">
    <div class="main-text">
        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sunt, necessitatibus asperiores, ratione aliquam quae magni iure nemo numquam eligendi quis aspernatur sapiente veritatis repellat in rerum tempora labore facilis. Officiis.</p>
    </div>

<div class="main-articles">
    <div class="one-article">
            <h2>{{ $estate->title }}</h2>
            <div class="article-wallpaper">
                @if($estate->images != null)
                    @php
                    $arrayImages = json_decode($estate->images, true);
                    @endphp
                        @foreach($arrayImages as $image)
                        <div class="wallpaper-show">
                            <a target="_blank" href="{{ asset('storage/images/'.$image) }}">
                            <img src="{{ asset('storage/images/'.$image) }}" alt="image">
                            </a>
                        </div>
                        @endforeach
                @else
                    <img src="{{ asset('storage/images/no-image.jpg') }}" alt="image">
                @endif
            </div>
            
            <p>Category: {{ $estate->category->category }}</p>
            <p>Country: {{ $estate->country }}</p>
            <p>City: {{ $estate->city }}</p>
            <p class="price">Price: {{ $estate->price }}&euro;</p>
            <p>Description: {{ $estate->description }}</p>
            <p>Contact the seller: {{ $estate->user->email }}</p>
            <div class="commentsDiv">
                <p>COMMENTS</p>
                @if(count($comments) > 0)
                    @foreach($comments as $oneComment)
                    <p>{{ $oneComment->comment }} - {{ $oneComment->user->name }} | {{ $oneComment->created_at }}</p>
                    @endforeach
                @else
                    <p id="noComment">No comments...</p>
                @endif
            </div>
            
            @if(Auth::check() && Auth::id() == $estate->user_id || Auth::check() && Auth::user()->role->role_name == "Admin")
                <div>
                    <button id="editBtn" class="editButtons"><a href="/real-estate/{{ $estate->id }}/edit">Edit</a></button>
                </div>

                <div>
                    <form id="deleteForm" method="POST">
                        @csrf
                        @method('DELETE')
                        <input type="hidden" name="id" value="{{ $estate->id }}">
                        <button type="button" id="deleteBtn" class="editButtons">Delete</button>
                    </form>
                </div>
            @endif

            @if(Auth::check() && Auth::id() != $estate->user_id || Auth::check() && Auth::user()->role->role_name == "Admin")
                <div id="comments">
                    <p>Enter comment</p>
                    <form id="commentForm" method="POST">
                        @csrf
                        <input type="hidden" name="commentId" id="commentId" value="{{ $estate->id }}">
                        <textarea id="commentArea" name="commentArea"></textarea>
                        <button id="commentBtn">Enter</button>
                    </form>
                </div>
            @endif

     </div>
    </div>

    <div class="main-text">
        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sunt, necessitatibus asperiores, ratione aliquam quae magni iure nemo numquam eligendi quis aspernatur sapiente veritatis repellat in rerum tempora labore facilis. Officiis.</p>
    </div>
 </main>
@endsection
