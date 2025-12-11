<?php 

namespace App\Model;

use App\Utilitarian\{FG};
use App\Model\{Section, ContentColor, ContentImage, ContentType};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class Content extends Model {

    use SoftDeletes;

	protected $table = 'contents';

    const BANNERS_TYPE = 1;
    const CARACTERISTICAS_TYPE = 2;
    const CAPACITADOS_TYPE = 3;

    public static function getContentById($id) {
        return Content::with(['colors', 'images', 'type', 'section'])->where('id', $id)->first();
    }

    public static function getContentsByCompanyId($company_id) {
        return Content::with(['colors', 'images'])->where('company_id', $company_id)->get();
    }

    public static function getChildrenContentsById($id) {
        return Content::with(['colors', 'images'])->get();
    }
    # Relations
    /*public function sections() {
        return $this->belongsToMany(Section::class, 'sections_contents', 'content_id', 'section_id');
    }*/

    public function colors() {
        return $this->hasMany(ContentColor::class);
    }

    public function images() {
        return $this->hasMany(ContentImage::class);
    }

    public function files() {
        return $this->hasMany(ContentFile::class);
    }

    public function type() {
		return $this->belongsTo(ContentType::class, 'type_id', 'id'); 
	}

    public function section() {
		return $this->belongsTo(Section::class, 'section_id', 'id'); 
	}

    public function contentsDefault($menus_ids){
        $galery = Capsule::Table("contents_images")
                ->join("contents",function($join){
                    $join->on('contents.id','=','contents_images.content_id')
                    ->where('contents.deleted_at',NULL);
                })
                ->join("menus_sections",function($join){
                    $join->on('menus_sections.section_id','=','contents.section_id')
                    ->where('menus_sections.deleted_at',NULL);
                })
                ->select('contents_images.id as image_id', 'contents_images.image as image')
                ->where("contents_images.deleted_at",NULL)
                ->whereIn("menus_sections.menu_id",$menus_ids)
                ->limit(6)
                ->orderBy("contents.id","desc")
                ->get();
        return $galery;
    }

    public function contentsGalery($company_id){
        $galery = Capsule::Table("contents_images")
                ->select('contents_images.id as image_id', 'contents_images.image as image')
                ->where("contents_images.deleted_at",NULL)
                ->where("contents_images.company_id",$company_id)
                ->where("contents_images.gallery",1)
                ->orderBy("contents_images.order")
                ->get();
        return $galery;
    }
}