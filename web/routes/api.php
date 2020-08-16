<?php
use Illuminate\Http\Request;
Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
  
    Route::group([
      'middleware' => 'auth:api'
    ], function() {
        Route::get('logout', 'AuthController@logout');
        Route::get('user', 'AuthController@user');
    });
});
Route::group([
    'prefix' => 'locations'
],
function(){
    Route::get('all', 'LocationController@indexapi');
    Route::get('specific/{location}', 'LocationController@showapi');

    Route::group(['middleware' =>'auth:api'
],function(){
    Route::get('mylocations', 'LocationController@mineapi');
    Route::post('addnew', 'LocationController@store');
    });
});

Route::group([
    'prefix' => 'challenges'
],
function(){
    Route::get('all', 'ChallengeController@indexapi');
    Route::get('specific', 'ChallengeController@showapi');

    Route::group(['middleware' => 'auth:api'], function(){
        Route::get('mychallenges', 'ChallengeController@mineapi');
        Route::post('newchallenge', 'ChallengeController@store');
    });
}
);