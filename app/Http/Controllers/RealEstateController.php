<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Models\RealEstate;
use App\Models\Statistic;
use App\Models\Comment;
use App\Models\Category;

class RealEstateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $estates = RealEstate::orderBy('id', 'desc')->paginate(6);
        $categories = Category::all();
        return view('real_estate.index', compact('estates', 'categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view("real_estate.create", compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $images = [];
        $microtime = microtime(true);
        
        if($request->hasFile('images')) {
            foreach($request->file('images') as $image) {
                // $image->store('images', 'public');
                $imageName = $microtime.'-'.$image->getClientOriginalName();
                $image->storeAs('public/images', $imageName);
                $images[] = $imageName;
            }
        }
        $jsonImages = json_encode($images);

        $realEstate = new RealEstate();
    
        $realEstate->title = $request->title;
        if(count($images) > 0) {
            $realEstate->images = $jsonImages;
        }
        else {
            $realEstate->images = null;
        }
        $realEstate->category_id = $request->category;
        $realEstate->country = $request->country;
        $realEstate->city = $request->city;
        $realEstate->description = $request->description;
        $realEstate->price = $request->price;
        $realEstate->user_id = Auth::id();
        
        if($realEstate->save()) {
         $statistic = new Statistic();
         $statistic->activity = "User with id-".Auth::id()." insert new datas";
         $statistic->save();

         return response()->json(['message'=>'New record inserted in database']);
        }
        else {
         return response()->json(['message'=>'Error!']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       $estate = RealEstate::where('id', $id)->first();
       $comments = Comment::where('real_estates_id', $id)->get();
    
       return view('real_estate.show', compact('estate','comments'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       $estate = RealEstate::where('id', $id)->first();
       $categories = Category::all();
       return view('real_estate.edit', compact('estate', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
      
      $realEstate = RealEstate::find($id);

      if($request->hasFile('images')) {
         $microtime = microtime(true);
         $images = [];
         foreach($request->file('images') as $image) {
            // $image->store('images', 'public');
            $imageName = $microtime.'-'.$image->getClientOriginalName();
            $image->storeAs('public/images', $imageName);
            $images[] = $imageName;
         }

         $jsonImages = json_encode($images);

            if($realEstate->images != null) {
            $oldImages = json_decode($realEstate->images, true);

            foreach($oldImages as $image) {
                $imagePath = public_path('storage/images/' . $image);
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                }
              }
            }
       }
       else {
          $jsonImages = $realEstate->images;
       }

       $realEstate->title = $request->title;
       $realEstate->images = $jsonImages;
       $realEstate->country = $request->country;
       $realEstate->city = $request->city;
       $realEstate->description = $request->description;
       $realEstate->price = $request->price;
       $realEstate->category_id = $request->category;
       $realEstate->user_id = Auth::id();

       $result = $realEstate->save();

       if($result) {
        $statistic = new Statistic();
        $statistic->activity = "User with id-".Auth::id()." edited datas for real_estate id-".$id;
        $statistic->save();

        return response()->json(['message' => 'You edited data']);
       }
       else{
        return response()->json(['message' => 'Error!']);
       }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $estate = RealEstate::find($id);
    
        if($estate->images != null) {
            $jsonImages = json_decode($estate->images, true);
            foreach($jsonImages as $image) {
                //$path = 'public/images/' . $image;
                $imagePath = public_path('storage/images/' . $image);
                //Storage::disk('public')->delete($path);
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                }
            }
        }

        $result = $estate->delete();
        
        if($result) {
            $statistic = new Statistic();
            $statistic->activity = "User with id-".Auth::id()." delete datas";
            $statistic->save();

            return response()->json(['message'=>'Succsefully deleted']);
        }
        else {
            return response()->json(['message'=>'Not deleted']);
        }
    }

    public function user() {
        return view('users.user');
    }
}
