<?php

use App\Http\Controllers\EditorController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/{any}', function () {
    return view('welcome');
})->where('any', '.*');
// Route for handling image uploads
// Route::post('imageUpload', [EditorController::class,'uploadImage'])->name('imageUpload');
Route::middleware('auth:sanctum')->post('imageUpload', [EditorController::class, 'uploadImage'])->name('imageUpload');
Route::view('CreatePost','CreatePost');