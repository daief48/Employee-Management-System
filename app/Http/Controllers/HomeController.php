<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    //
    public function index()
    {
        return PostResource::collection(Post::latest()->take(4)->get());
    }

    public function feature_post()
    {
        return DB::table('posts')
        ->where('featurenews','=','Y')
        ->get();
    }
}
