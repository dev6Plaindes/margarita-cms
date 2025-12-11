<?php 

namespace App\Model;

use App\Utilitarian\{FG};
use App\Model\{Menu, Content, ContentType};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class Section extends Model {

    use SoftDeletes;

	protected $table = 'sections';

    public static function getSectionById($id) {
        return Section::with(['menus', 'contents'])->where('id', $id)->first();
    }

    public static function getSectionsByCompanyId($company_id) {
        return Section::with(['menus', 'contents'])->where('company_id', $company_id)->get();
    }

    public function menus() {
        return $this->belongsToMany(Menu::class, 'menus_sections', 'section_id', 'menu_id');
    }

    public function contents() {
        return $this->hasMany(Content::class, 'section_id', 'id');
    }

    public function contents_types() {
        return $this->belongsToMany(ContentType::class, 'sections_contents_types', 'section_id', 'type_id');
    }
}