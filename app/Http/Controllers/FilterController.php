<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\RealEstate;

class FilterController extends Controller
{
    public function filter($filterId) {
       
      if($filterId != "0") {
        $filterEstate = RealEstate::where('category_id', $filterId)->with('category')->orderBy('id', 'desc')->get();
      }
      
      return response()->json($filterEstate); 
    }
}
