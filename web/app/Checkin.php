<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Checkin extends Model
{
    protected $fillable =[
        'location_id', 'user_id'
    ];
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function location(){
        return $this->belongsTo('App\Location');
    }
}
