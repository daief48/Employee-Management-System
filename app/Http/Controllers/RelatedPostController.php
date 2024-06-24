<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;

class RelatedPostController extends Controller
{
    //
    public function index(Post $post)
{
    // Retrieve the category of the specified post
    $category = $post->category->id;

    $data = Post::where('category_id','=',$category)->latest()->get();

    return $data;
}

}
