<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Model\{Company, Category, Menu, MenuProduct, Teacher, Topic, ProductImage};

class Product extends Model {   

    use SoftDeletes;

	protected $table = 'products';

    public function menus() {
        return $this->belongsToMany(Menu::class, 'menus_products', 'product_id', 'menu_id');
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

    public function topics() {
        return $this->hasMany(Topic::class, 'product_id', 'id');
    }

    public function images() {
        return $this->hasMany(ProductImage::class);
    }
}