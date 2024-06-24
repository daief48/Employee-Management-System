<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use stdClass;

class EditorController extends Controller
{
    //
    public function uploadImage(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'image_param' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust max file size if needed
        ]);

        // Retrieve the uploaded file
        $image = $request->file('image_param');

        // Generate a unique name for the file
        $imageName = sha1(microtime()) . '.' . $image->getClientOriginalExtension();

        // Move the uploaded file to the public/images directory
        $image->move(public_path('images'), $imageName);

        // Generate the response object
        $response = new stdClass;
        $response->link = '/images/' . $imageName;

        // Return the response as JSON
        return response()->json($response);
    }
}
