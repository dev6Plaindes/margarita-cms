<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Model\{Company, Category, Menu, MenuProduct, Teacher, Topic_p};

class Portafolio extends Model {   

    use SoftDeletes;

	protected $table = 'portafolios';

    public function menus() {
        return $this->belongsToMany(Menu::class, 'menus_portafolios', 'portafolio_id', 'menu_id');
    }

    public function category() {
		return $this->belongsTo(Category::class, 'category_id', 'id'); 
	}
    
    public function teacher() {
		return $this->belongsTo(Teacher::class, 'teacher_id', 'id'); 
	}

    public function characteristics() {
        return $this->hasMany(Characteristic::class, 'product_id', 'id');
    }

    public function topics_portafolios() {
        return $this->hasMany(Topic_p::class, 'portafolio_id', 'id');
    }

}