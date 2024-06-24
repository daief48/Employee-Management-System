<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardPostController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RelatedPostController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;
use Laravel\Fortify\Http\Controllers\RegisteredUserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
/////////////////////////// Private Routes ///////////////////////////////

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::middleware('auth:sanctum')->post('/logout', [AuthenticatedSessionController::class, 'destroy']);
/////////////////////////// Public Routes ///////////////////////////////
Route::post('/register', [RegisteredUserController::class, 'store']);
Route::post('/login', [AuthenticatedSessionController::class, 'store']);

// categories
Route::middleware('auth:sanctum')->post('categories/create', [CategoryController::class, 'store']);
Route::middleware('auth:sanctum')->get('categories/{category}', [CategoryController::class, 'show']);
Route::middleware('auth:sanctum')->put('categories/{category}', [CategoryController::class, 'update']);
Route::middleware('auth:sanctum')->delete('categories/{category}', [CategoryController::class, 'destroy']);

Route::get("categories",[CategoryController::class, 'index']);

////////////////////////// Post ////////////////////////////////
Route::middleware('auth:sanctum')->post('posts', [PostController::class, 'store']);
Route::middleware('auth:sanctum')->put('posts/{post:slug}', [PostController::class, 'update']);

Route::middleware('auth:sanctum')->delete('posts/{post:slug}', [PostController::class, 'destroy']);
Route::post('/upload', [ImageController::class, 'storeimage']);

Route::get('home-posts',[HomeController::class,'index']);
Route::get('feature-posts',[HomeController::class,'feature_post']);

Route::get('posts/{post:slug}',[PostController::class,'show']);
Route::get('posts',[PostController::class,'index']);
Route::get('related-posts/{post:slug}',[RelatedPostController::class,'index']);
Route::get('dashboard-posts',[DashboardPostController::class,'index']);
Route::get('posts-category/{category}',[PostController::class,'post_category']);
Route::get('posts-popular/',[PostController::class,'post_popular']);
Route::get('posts-tending/',[PostController::class,'post_tending']);