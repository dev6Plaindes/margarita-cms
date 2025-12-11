<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Model\{Menu, Company, Product, TemplateView, Portafolio};

class Menu extends Model {

    use SoftDeletes;
    
	protected $table = 'menus';

    public static function getBuilMenuByCompanyId($company_id) {
        // $data = Menu::with(['template_view'])->where('company_id', $company_id)->orderBy('order', 'asc')->get()->toJson();
        // return self::buildTreeView(json_decode($data));
        $data = Menu::with(['template_view'])->where('company_id', $company_id)->orderBy('order', 'asc')->get()->toArray();        
        return self::buildTreeView($data);
    }
    
    public static function buildTreeView($menus) {
        function recursiveDocuments($items,  $value)
        {
            $children = array();
            for ($i = 0; $i < count($items); $i++) {
                $item = $items[$i];
                    $item['children'] = array();
                if ($value['id'] == $item['parent_id']) {
                    $result =  recursiveDocuments($items, $item);
                    array_push($children, $result);
                }
            }
            $value['children'] =  $children;
            return  $value;
        }

        $structure = array();

        for ($i = 0; $i < count($menus); $i++) {
            $item = $menus[$i];
            $item['children'] = array();
    
            if (!$item['parent_id']) {
                $result =  recursiveDocuments($menus, $item);
                array_push($structure, $result);
            }
        }
        return json_decode(json_encode($structure));
    }

    public static function buildTreeView_old($data) {
        function buildTree(array &$elements, $parentId = 0) {
            $branch = array();
           
            foreach ($elements as $element) {
                $element->children = array();
                if ($element->parent_id == $parentId) {
                    $children = buildTree($elements, $element->id);
                    if ($children) {
                        $element->children = $children;
                    }
                    array_push($branch, $element); // $branch[$element['id']] = $element;
                    unset($elements[$element->id]);
                }
            }
            return $branch;
        }
        return buildTree($data);
    }  
    # Relations
    public function sections() {
        return $this->belongsToMany(Section::class,  'menus_sections', 'menu_id', 'section_id');
    }
    
    public function products() {
        return $this->belongsToMany(Product::class,  'menus_products', 'menu_id', 'product_id');
    }

    public function portafolios() {
        return $this->belongsToMany(Portafolio::class,  'menus_portafolios', 'menu_id', 'portafolio_id');
    }

    public function template_view() {
		return $this->belongsTo(TemplateView::class, 'template_view_id', 'id'); 
	}

    public function childrens() {
		return $this->hasMany(Menu::class, 'parent_id', 'id'); 
	}
}

