<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Comment;
use App\Models\Statistic;


class CommentController extends Controller
{
    public function addComment(Request $request, $id) {
        $comment = new Comment();
        $comment->comment = $request->commentArea;
        $comment->real_estates_id = $id;
        $comment->user_id = Auth::id();
        
        $result = $comment->save();

        $lastId = Comment::with('user')->latest()->first();

        if($result) {
            $statistic = new Statistic();
            $statistic->activity = "User with id-".Auth::id()." insert new comment for real_estate id-".$id;
            $statistic->save();
        }

        return response()->json(["message" => "Succsesful insert comment", "result" => $lastId]);
    }
}
