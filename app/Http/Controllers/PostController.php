<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResource;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PostController extends Controller
{
    public function storeimage(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // For images
            'file' => 'required|mimes:pdf,doc,docx,txt|max:2048', // For files (PDF, Word, Text)
        ]);

        // Handle image upload and storage
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->extension();
            $image->move(public_path('uploads'), $imageName);
            // Optionally, you can store the image path in the database or perform other actions
            // For example:
            // Image::create(['path' => 'uploads/'.$imageName]);
        }

        // Handle file upload and storage
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fileName = time() . '.' . $file->extension();
            $file->move(public_path('uploads'), $fileName);
            // Optionally, you can store the file path in the database or perform other actions
        }

        return response()->json(['success' => 'Image and file uploaded successfully']);
    }

    public function index(Request $request)
    {
        $postsQuery = Post::query()->latest();

        if ($request->has('category')) {
            $category = Category::where('name', $request->category)->firstOrFail();
            $postsQuery->where('category_id', $category->id);
        } elseif ($request->has('search')) {
            $searchTerm = '%' . $request->search . '%';
            $postsQuery->where(function ($query) use ($searchTerm) {
                $query->where('title', 'like', $searchTerm)
                    ->orWhere('body', 'like', $searchTerm);
            });
        }

        $posts = $postsQuery->paginate(7)->withQueryString();

        return PostResource::collection($posts);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'file' => 'required|image',
            'body' => 'required|string',
            'category_id' => 'required|exists:categories,id'
        ]);

        $title = $request->title;
        $category_id = $request->category_id;

        // Use the `exists` method instead of `count` to check if any posts exist
        $postId = Post::count() > 0 ? Post::latest()->first()->id + 1 : 1;

        // Generate a unique slug based on the title and post ID
        $slug = Str::slug($title, '-') . '-' . $postId;

        // Get the authenticated user's ID
        $user_id = auth()->id();

        // Store the uploaded image in the public folder and get its path
        $imagePath = 'images/posts/' . $request->file('file')->getClientOriginalName();
        $request->file('file')->move(public_path('images/posts'), $imagePath);

        // Create a new Post instance and save it
        $post = new Post();
        $post->title = $title;
        $post->category_id = $category_id;
        $post->slug = $slug;
        $post->user_id = $user_id;
        $post->body = $request->input('body');
        $post->imagePath = $imagePath;
        $post->save();

        // You might want to return a response indicating success
        return response()->json([
            'status' => 'success',
            'message' => 'Post created successfully',
            'post' => $post,
        ]);
    }

    public function update(Request $request, Post $post)
    {
        if (auth()->user()->id !== $post->user->id) {
            return abort(403);
        }

        $request->validate([
            'title' => 'required|string',
            'file' => 'nullable|image',
            'body' => 'required|string',
            'category_id' => 'required|exists:categories,id'
        ]);

        $title = $request->title;
        $category_id = $request->category_id;

        // Get the authenticated user's ID
        $user_id = auth()->id();

        // Update the post fields with the new data
        $post->title = $title;
        $post->category_id = $category_id;
        $post->user_id = $user_id;
        $post->body = $request->input('body');

        // If a new image is uploaded, update the image path
        if ($request->hasFile('file')) {
            // Store the uploaded image in the public folder and get its path
            $imagePath = 'images/posts/' . $request->file('file')->getClientOriginalName();
            $request->file('file')->move(public_path('images/posts'), $imagePath);
            $post->imagePath = $imagePath;
        }

        // Save the updated post
        $post->save();

        // You might want to return a response indicating success
        return response()->json([
            'status' => 'success',
            'message' => 'Post updated successfully',
            'post' => $post,
        ]);
    }

    public function show(Post $post)
    {
        // if( auth()->user()->id !== $post->user->id)
        // {
        //     return abort(403);
        // }

        return new PostResource($post);
    }

    public function destroy(Post $post)
    {
        if (auth()->user()->id !== $post->user->id) {
            return abort(403);
        }

        return $post->delete();
    }
    public function post_category($category)
    {
        $posts = DB::table("posts")
            ->leftJoin('categories', 'posts.category_id', '=', 'categories.id')
            ->where('categories.name', '=', $category)
            ->get();

        return $posts;
    }

    public function post_popular()
    {
        return DB::table('posts')
            ->where('popularpost', '=', 'Y')
            ->get();
    }

    public function post_tending()
    {
        return DB::table('posts')
            ->where('tending', '=', 'Y')
            ->get();
    }
}
