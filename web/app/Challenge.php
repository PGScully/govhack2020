<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Challenge extends Model
{
    protected $fillable = [
        'title', 'description', 'location_id'
    ];
    public function location(){
        return $this->belongsTo('App\Location');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
}
