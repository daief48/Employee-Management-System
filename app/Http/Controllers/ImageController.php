<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ImageController extends Controller
{
    public function storeimage(Request $request)
{
    // Validate the uploaded file
    $request->validate([
        'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust max file size if needed
    ]);

    // Retrieve the uploaded file
    $image = $request->file('image');

    // Generate a unique name for the file
    $imageName = sha1(microtime()) . '.' . $image->getClientOriginalExtension();

    // Move the uploaded file to the public/images directory
    $image->move(public_path('images'), $imageName);

    // Return the image name
    return $image;
}


}
