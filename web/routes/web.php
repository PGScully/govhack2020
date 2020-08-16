<?php

use Illuminate\Support\Facades\Route;
use App\Location;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/locations', 'LocationController@index');
Route::get('/locations/{location}', 'LocationController@show');
Route::get('/mac/{house}', function($house){
    return Location::findOrFail($house);
});
Route::get('/me', function(){
    return Auth::id();
});