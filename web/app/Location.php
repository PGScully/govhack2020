<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected $fillable = [
        'title', 'description', 'lat', 'long', 'user_id', 'type'
    ];
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function challenge(){
        return $this->hasMany('App\Challenge');
    }
    public function checkin(){
        return $this->hasMany('App\Checkin');
    }
}
