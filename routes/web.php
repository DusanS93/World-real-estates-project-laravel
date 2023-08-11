<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RealEstateController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\FilterController;
use App\Http\Controllers\CommentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [RealEstateController::class, 'index']);

/* User dashboard */
Route::get('/real-estate/dashboard', [RealEstateController::class, 'user']);

/* Real estate routes */
Route::get('/real-estate', [RealEstateController::class, 'index']);

Route::middleware(['auth'])->group(function() {
    Route::get('/real-estate/create', [RealEstateController::class, 'create']);
    Route::post('/real-estate/create', [RealEstateController::class, 'store']);
    Route::get('/real-estate/{id}/edit', [RealEstateController::class, 'edit']);
    Route::put('/real-estate/{id}/edit', [RealEstateController::class, 'update']);
    Route::delete('/real-estate/{id}', [RealEstateController::class, 'destroy']);

    /* Comments routes */
    Route::post('/real-estate/{id}/comment', [CommentController::class, 'addComment']);
});

Route::get('/real-estate/{id}', [RealEstateController::class, 'show']);

/* Filter */
Route::get('/real-estate/filter/{filterId}', [FilterController::class, 'filter']);

/* Auth routes */
Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');
