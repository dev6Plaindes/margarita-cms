<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Product, Category, Menu, Teacher, MenuProduct, Characteristic, DesignIcon, Topic, SubTopic, TemplateView, ProductImage};
use Illuminate\Database\Capsule\Manager as Capsule;

class ProductDown {

    public function index($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $products = Product::where('company_id', $company_id)->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('products', 'company_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function create($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $product = new Product();
            $categories = Category::where('company_id', $company_id)->get();
            $menus = Menu::where('company_id', $company_id)->get();
            $teachers = Teacher::where('company_id', $company_id)->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('product', 'categories', 'menus', 'company_id', 'teachers');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function edit($request) {
		$rsp = FG::responseDefault();
        try {
            $id = $request->getAttribute('id');
            if (!is_numeric($id)) {
                throw new \Exception('El parametro debe ser númerico');
            }
            $company_id = $_SESSION['COMPANY_ID'];
            $product = Product::with([
                'menus', 
                'characteristics'=> function($q) {
                    $q->with(['design_icon']);
                },
                'topics' => function($q) {
                    $q->with([
                        'subtopics'=> function ($query) { 
                            $query->with(['design_icon'])->orderBy('order', 'asc'); 
                        }
                    ])->orderBy('order', 'asc');
                },
                'images'
            ])->where('company_id', $company_id)->where('id', $id)->first();
            $categories = Category::where('company_id', $company_id)->get();
            $menus = Capsule::table('menus')
                                ->join('templates_views', 'menus.template_view_id', '=', 'templates_views.id')
                                ->where('templates_views.index', TemplateView::PRODUCT_INDEX)
                                ->where('menus.company_id', $company_id)
                                ->select('menus.*')->get();
            if (count($menus) > 0) {
                $parent_ids = array();
                foreach ($menus as $k => $menu) {
                    if ($menu->parent_id > 0) {
                        array_push($parent_ids, $menu->parent_id);
                    }
                }
                $auxs = array();
                foreach ($menus as $k => $menu) {
                    if (!in_array($menu->id, $parent_ids)) {
                        array_push($auxs, $menu);
                    }
                }
                $menus = $auxs;
            }
            // $menus = Menu::where('company_id', $company_id)->get();
            $teachers = Teacher::where('company_id', $company_id)->get();
            $designs_icons = DesignIcon::where('company_id', $company_id)->get();
            $characteristics = $product->characteristics;
            $images = $product->images;
            $topics = $product->topics;
            $rsp['success'] = true;
            $rsp['data'] = compact('product', 'categories', 'menus', 'company_id', 'teachers', 'characteristics', 'designs_icons', 'topics', 'images');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveData($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $product                = is_numeric($id) ? Product::where('id', $id)->first() : new Product();
            $product->name          = $name;
            $product->caption       = $caption;
            $product->price         = $price;
            $product->category_id   = $category_id;
            $product->url           = $url;
            $product->description   = $description;
            $product->status        = (int)$status;
            $product->company_id    = $company_id;
            $product->type_id       = 1;
            $product->slug          = FG::slugify($name);
            $product->teacher_id    = $teacher_id;
            $product->overview      = $overview;

            if (is_numeric($id)) {
                $all = Product::where('slug', $product->slug)->where('company_id', $company_id)->where('id', '!=', $id)->get();
            } else {
                $all = Product::where('slug', $product->slug)->where('company_id', $company_id)->get();
            }
            if (count($all) > 0) {
                throw new \Exception('Ya existe un producto con el mismo nombre');
            }

            $product->save();

            if (count($menus) > 0) {
                if (is_numeric($id)) {
                    MenuProduct::where('product_id', $id)->delete();
                }
                $data = array();
                foreach ($menus as $k => $o) {
                    array_push($data, ['menu_id'=>$o, 'product_id'=>$product->id]);
                }
                MenuProduct::insert($data);
            }

            $baseurl = "upload/files/";
            $basepath = __DIR__."/../../public/";
            $fullpath = $basepath.$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }

            if (isset($file_delete)) {
                $product->file = null;
                $product->save();
            }

            $uploads = $request->getUploadedFiles();
            $file = $uploads['image'];
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                unlink($basepath.$product->image);
                $product->image = "/$path";
                $product->save();
            }

            $fileUpload = $uploads['file'];
            if ($fileUpload->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($fileUpload->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $fileUpload->moveTo($path);
                unlink($basepath.$product->file);
                $product->file = "/$path";
                $product->save();
            }

            $rsp['success'] = true;
            $rsp['data'] = compact('product');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function remove($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $product = Product::where('id', $id)->first();
            if (!$product) {
                throw new \Exception('No se logró encontrar la sección a eliminar');
            }
            $product->deleted_at = FG::getDateHour();
            $product->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveCharacteristic($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $characteristic                 = @$id > 0 ? Characteristic::where('id', $id)->first() : new Characteristic();
            $characteristic->name           = $name;
            $characteristic->description    = $description;
            $characteristic->design_icon_id = $design_icon_id;
            $characteristic->product_id     = $product_id;
            $characteristic->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function removeCharacteristic($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $characteristic = Characteristic::where('id', $id)->first();
            if (!$characteristic) {
                throw new \Exception('No se logró encontrar la caracteristica a eliminar');
            }
            $characteristic->deleted_at = FG::getDateHour();
            $characteristic->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function storeImage($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $baseurl = "upload/images/";
            $basepath = __DIR__."/../../public/";
            $fullpath = $basepath.$baseurl;
            $upload = $request->getUploadedFiles();
            $file = $upload['file'];
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                $productImage             = new ProductImage();
                $productImage->image      = "/$path";
                $productImage->product_id = $product_id;
                $productImage->order      = count(ProductImage::where('company_id', $company_id)->get()) + 1;
                $productImage->company_id = $company_id;
                $productImage->save();
            } else {
                throw new \Exception('No se logró encontrar la imagen');
            }

            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function removeImage($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $productImage = ProductImage::where('id', $id)->first();
            if (!$productImage) {
                throw new \Exception('No se logró encontrar la caracteristica a eliminar');
            }
            $productImage->deleted_at = FG::getDateHour();
            $productImage->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}