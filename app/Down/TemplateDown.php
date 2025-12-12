<?php

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Menu, Product, Portafolio, MenuProduct, Characteristic, Topic, Inscription, TemplateView, Company};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class TemplateDown
{

    public function getContentDynamicSlug($request)
    {
        $rsp = FG::responseDefault();
        try {
            //  Establecer plantilla twig, menu_childrens y contenidos
            $company = $request->getAttribute('att_company');
            $slug = $request->getAttribute('slug');
            if ($slug) {
                $menu_parent = Menu::with(['childrens', 'template_view'])->where('company_id', $company['id'])->where('slug', $slug)->first();
            } else {
                $menu_parent = Menu::with(['childrens', 'template_view' => function ($query) {
                    $query->where('index', '=', 1);
                }])->where('company_id', $company['id'])->first();
            }

            if (!$menu_parent) {
                $rsp['data'] = $this->getTemplateCustomSlug($slug, $company);
            } else {
                //var_dump(json_encode($menu_parent));
                //exit;
                switch (@$menu_parent->template_view->index) {
                    case TemplateView::HOME_INDEX:
                        $content = $this->getContentByMenuSlug($menu_parent);
                        $products = Product::with(['category', 'characteristics' => function ($query) {
                            $query->with(['design_icon']);
                        }])->where('company_id', $company['id'])->where('status', 1)->orderBy('created_at', 'DESC')->limit(10)->get();
                        $rsp["data"]["contents"] = $content["data"];
                        $rsp["data"]["products"] = $products;
                        break;
                    case TemplateView::PRODUCT_INDEX:
                        $content = $this->getContentByMenuSlug($menu_parent);
                        $menu_products = $this->productsByMenuSlug($menu_parent, $company);
                        $rsp["data"]["menu_products"] = $menu_products["data"];
                        $rsp["data"]["contents"] = $content["data"];
                        break;
                    case TemplateView::CONTACT:
                        $content = $this->getContentByMenuSlug($menu_parent);
                        $products = Product::with(['category', 'characteristics' => function ($query) {
                            $query->with(['design_icon']);
                        }])->where('company_id', $company['id'])->where('status', 1)->orderBy('created_at', 'DESC')->limit(10)->get();
                        $rsp["data"]["contents"] = $content["data"];
                        $rsp["data"]["products"] = $products;
                        break;
                    case TemplateView::PORTAFOLIOS:

                        $categoria_id = 0;
                        if (isset($_GET["c"]) || !is_null($_GET["c"])) {
                            $categoria_id = $_GET["c"];
                        }
                        $type_id = 1;
                        $menu_products = $this->portafoliosByMenuSlug($menu_parent, $company, $type_id);
                        $categorias_products = $this->categoriasByMenuSlug($menu_products["data"]);

                        if ($categoria_id > 0) {
                            $menu_products = $this->portafoliosByMenuSlugByCategoria($menu_products["data"], $categoria_id);
                        }

                        $content = $this->getContentByMenuSlug($menu_parent);
                        $rsp["data"]["menu_products"] = $menu_products["data"];
                        $rsp["data"]["categorias"] = $categorias_products["data"];
                        $rsp["data"]["contents"] = $content["data"];

                        break;
                    case TemplateView::PORTAFOLIOS_AUDIO:

                        $categoria_id = 0;
                        if (isset($_GET["c"]) || !is_null($_GET["c"])) {
                            $categoria_id = $_GET["c"];
                        }
                        $type_id = 2;
                        $menu_products = $this->portafoliosByMenuSlug($menu_parent, $company, $type_id);
                        $categorias_products = $this->categoriasByMenuSlug($menu_products["data"]);

                        if ($categoria_id > 0) {
                            $menu_products = $this->portafoliosByMenuSlugByCategoria($menu_products["data"], $categoria_id);
                        }

                        $content = $this->getContentByMenuSlug($menu_parent);
                        $rsp["data"]["menu_products"] = $menu_products["data"];
                        $rsp["data"]["categorias"] = $categorias_products["data"];
                        $rsp["data"]["contents"] = $content["data"];

                        break;
                    case TemplateView::BLOG:

                        $portafolio_id = 0;
                        if (isset($_GET["p"]) || !is_null($_GET["p"])) {
                            $portafolio_id = $_GET["p"];
                        }

                        $temas_portafolio = $this->temasByPortafolios($portafolio_id, $company);
                        // echo(json_encode($temas_portafolio));exit;
                        $content = $this->getContentByMenuSlug($menu_parent);
                        $rsp["data"]["temas"] = $temas_portafolio["data"];
                        // $rsp["data"]["categorias"] = $categorias_products["data"];                        
                        $rsp["data"]["contents"] = $content["data"];
                        break;
                    default:
                        $content = $this->getContentByMenuSlug($menu_parent);
                        $rsp["data"]["contents"] = $content["data"];
                        break;
                }

                $rsp["data"]["menu"] = $menu_parent;
            }

            //RESPUESTA
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            //echo(json_encode($rsp));exit;
        }

        return $rsp;
    }

    public function getContentByMenuSlug($menu)
    {
        $rsp = FG::responseDefault();
        try {

            $contents_sql = Capsule::Table('menus')
                ->join('menus_sections', 'menus.id', '=', 'menus_sections.menu_id')
                ->join('sections', 'menus_sections.section_id', '=', 'sections.id')
                // ->join('contents','contents.section_id','=','sections.id')
                // ->join('contents_types','contents.type_id','=','contents_types.id')
                ->leftJoin('contents', function ($join) {
                    $join->on('contents.section_id', '=', 'sections.id')
                        ->where('contents.status', '=', 1);
                })
                ->leftJoin('contents_types', 'contents.type_id', '=', 'contents_types.id')
                ->leftJoin('contents_images',  function ($join) {
                    $join->on('contents.id', '=', 'contents_images.content_id')
                        ->where('contents_images.deleted_at', NULL);
                })
                ->leftJoin('contents_colors', function ($join) {
                    $join->on('contents.id', '=', 'contents_colors.content_id')
                        ->where('contents_colors.deleted_at', NULL);
                })
                ->leftJoin('contents_files', function ($join) {
                    $join->on('contents.id', '=', 'contents_files.content_id')
                        ->where('contents_files.deleted_at', NULL);
                })
                ->select(
                    'contents.id as content_id',
                    'contents.type_id as type_id',
                    'contents_types.alias as content_alias',
                    'sections.alias as section_alias',
                    'sections.id as section_id',
                    'sections.name as section_name',
                    'sections.description as section_description',
                    'sections.caption as section_caption',
                    'contents.name as content_name',
                    'contents.price as content_price',
                    'contents.boolean as content_boolean',
                    'contents.type_name as content_type_name',
                    'contents.caption as caption',
                    'contents.updated_at as fecha_update',
                    'contents.description as description',
                    'contents_images.id as image_id',
                    'contents_images.image as image',
                    'contents_colors.color as color',
                    'contents_colors.id as color_id',
                    'menus.id as menu_id',
                    'sections.external as section_external',
                    'contents_files.id as file_id',
                    'contents_files.url as file_url',
                    'contents_files.format as file_format',
                    'contents.url as content_url',
                    'contents.url_biblioteca as content_url_biblioteca',
                    'sections.url_api',
                    'sections.body_api'
                )
                ->where('menus.deleted_at')
                ->where('sections.deleted_at')
                ->where('contents.deleted_at')
                ->where('sections.status', 1)
                //->where('contents.status',1)
                ->where('menus.id', '=', $menu->id)
                ->orderBy('menus_sections.order', 'ASC')
                ->orderBy('contents.order', 'ASC')
                ->get();
            $contents_sql = $contents_sql->toArray();
            // echo (json_encode($contents_sql));exit;

            $contents = array();
            $imagens = array();
            $imagens_aux = array();
            $colors = array();
            $colors_aux = array();
            $contents_ids = array();
            $files = array();
            $files_aux = array();

            foreach ($contents_sql as $key => $value) {
                $content = array(
                    "id" => $value->content_id,
                    "type_id" => $value->type_id,
                    "content_alias" => $value->content_alias,
                    "section_id" => $value->section_id,
                    "section_alias" => $value->section_alias,
                    "section_name" => $value->section_name,
                    "section_description" => $value->section_description,
                    "section_caption" => $value->section_caption,
                    "content_name" => $value->content_name,
                    "content_price" => $value->content_price,
                    "content_boolean" => $value->content_boolean,
                    "content_type_name" => $value->content_type_name,
                    "content_caption" => $value->caption,
                    "content_description" => $value->description,
                    "content_fecha_update" => $value->fecha_update,
                    "section_external" => $value->section_external,
                    "section_url_api" => $value->url_api,
                    "section_body_api" => $value->body_api ? json_decode($value->body_api) : [],
                    "content_url" => $value->content_url,
                    "content_url_biblioteca" => $value->content_url_biblioteca,
                    'uniqid' => uniqid()
                );
                if ($value->image_id) {
                    if (!in_array($value->image_id, $imagens_aux)) {
                        $imagens[] = array(
                            "id" => $value->image_id,
                            "content_id" => $value->content_id,
                            "patch" => $value->image
                        );
                        $imagens_aux[] =  $value->image_id;
                    }
                }

                if ($value->color_id) {
                    if (!in_array($value->color_id, $colors_aux)) {
                        $colors[] = array(
                            "id" => $value->color_id,
                            "content_id" => $value->content_id,
                            "color" => $value->color
                        );
                        $colors_aux[] =  $value->color_id;
                    }
                }

                if ($value->file_id) {
                    if (!in_array($value->file_id, $files_aux)) {
                        $files[] = array(
                            "id" => $value->file_id,
                            "content_id" => $value->content_id,
                            "url" => $value->file_url,
                            "format" => $value->file_format
                        );
                        $files_aux[] =  $value->file_id;
                    }
                }

                $aux = false;
                unset($contents_sql[$key]);
                foreach ($contents as $key_c => $value_c) {
                    if ($value->content_id == $value_c["id"] && intval($value->content_id) > 0) {
                        $aux = true;
                    } else if ($value->section_external) {
                        $aux  = false;
                    }
                }
                if (!$aux) {
                    $contents[] = $content;
                }
            }
            // echo (json_encode($contents));exit;
            $sections = array();
            $sections_aux = array();
            foreach ($contents as $key => $value) {
                if (!in_array($value["section_id"], $sections_aux)) {
                    $sections[] = array(
                        "id" => $value["section_id"],
                        "alias" => $value["section_alias"],
                        "name" => $value["section_name"],
                        "description" => $value["section_description"],
                        "caption" => $value["section_caption"],
                        "external" => $value["section_external"],
                        "url_api" => $value["section_url_api"],
                        "body_api" => $value["section_body_api"],
                        'uniqid' => uniqid()
                    );
                    $sections_aux[] =  $value["section_id"];
                }

                foreach ($imagens as $i => $value_i) {
                    if ($value["id"] == $value_i["content_id"]) {
                        $contents[$key]["imagens"][] = $value_i;
                    }
                }
                foreach ($colors as $i => $value_i) {
                    if ($value["id"] == $value_i["content_id"]) {
                        $contents[$key]["colors"][] = $value_i;
                    }
                }
                foreach ($files as $i => $value_i) {
                    if ($value["id"] == $value_i["content_id"]) {
                        $contents[$key]["files"][] = $value_i;
                    }
                }
                $contents_ids[] = $value["id"];
            }
            // echo json_encode($contents); exit;
            //ADD SECTION BLOCK
            foreach ($sections as $s => $v) {
                foreach ($contents as $key => $value) {
                    if ($v["id"] == $value["section_id"] && intval($value["id"]) > 0) {
                        $sections[$s]["contents"][] = $value;
                    }
                }
            }
            // echo json_encode($sections); exit;
            $rsp['success'] = true;
            $rsp['data'] = $sections;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function productsByMenuSlug($menu_parent, $company)
    {
        $rsp = FG::responseDefault();
        try {

            $childrens = array();
            foreach ($menu_parent->childrens as $value) {
                $childrens[] = $value->slug;
            }

            if (!$childrens) {
                $childrens = array($menu_parent->slug);
            }

            $menus = Menu::with(['products' => function ($q) {
                $q->with(['category', 'teacher', 'characteristics' => function ($query) {
                    $query->with(['design_icon']);
                }])->get();
            }])->where('company_id', $company['id'])->whereIN('slug', $childrens)->get();

            //CONTEN

            $rsp['data'] = $menus;
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            //echo(json_encode($rsp));exit;
        }
        return $rsp;
    }

    public function portafoliosByMenuSlug($menu_parent, $company, $type_id)
    {
        $rsp = FG::responseDefault();
        try {

            $childrens = array();
            foreach ($menu_parent->childrens as $value) {
                $childrens[] = $value->slug;
            }

            if (!$childrens) {
                $childrens = array($menu_parent->slug);
            }

            switch ($type_id) {
                case '2':
                    $menus = Menu::with(['portafolios' => function ($q) {
                        $q->with(['category', 'teacher'])->get();
                        return $q->where('type_id', 2);
                    }])->where('company_id', $company['id'])->whereIN('slug', $childrens)->get();
                    break;
                default:
                    $menus = Menu::with(['portafolios' => function ($q) {
                        $q->with(['category', 'teacher'])->get();
                        return $q->where('type_id', 1);
                    }])->where('company_id', $company['id'])->whereIN('slug', $childrens)->get();
            }


            $rsp['data'] = $menus;
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            //echo(json_encode($rsp));exit;
        }
        return $rsp;
    }

    public function portafoliosByMenuSlugByCategoria($menu_products, $categoria_id = 0)
    {
        $rsp = FG::responseDefault();
        try {

            $portafolios_ = $menu_products[0];

            //echo(json_encode($portafolios));exit;

            $data_filtrada = [];
            for ($i = 0; $i < count($portafolios_["portafolios"]); $i++) {

                if ($portafolios_["portafolios"][$i]->category->id == $categoria_id) {
                    array_push($data_filtrada, $portafolios_["portafolios"][$i]);
                }
            }
            //echo(json_encode($data_filtrada));exit;

            unset($portafolios_["portafolios"]);

            $portafolios_["portafolios"] = $data_filtrada;


            $rsp['data'] = [$portafolios_];
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            //echo(json_encode($rsp));exit;
        }
        return $rsp;
    }

    public function temasByPortafolios($id, $company)
    {
        $rsp = FG::responseDefault();
        try {

            if (!is_numeric($id)) {
                throw new \Exception('El parametro debe ser númerico');
            }

            if ($id > 0) {

                $product = Portafolio::with([
                    'menus',
                    'topics_portafolios' => function ($q) {
                        $q->with([
                            'subtopics_portafolios' => function ($query) {
                                $query->with(['design_icon'])->orderBy('order', 'asc');
                            }
                        ])->orderBy('order', 'asc');
                    }
                ])->where('company_id', $company['id'])->where('id', $id)->first();

                $topics = $product->topics_p;
            } else {
                $topics = [];
            }

            $rsp['data'] = $topics;
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            //echo(json_encode($rsp));exit;
        }
        return $rsp;
    }

    public function categoriasByMenuSlug($data_menu)
    {
        $rsp = FG::responseDefault();
        try {

            $portafolios = $data_menu[0]->portafolios;
            $categorias = [];
            for ($i = 0; $i < count($portafolios); $i++) {
                array_push($categorias, $portafolios[$i]->category);
            }
            $categorias = array_unique($categorias);

            $categorias_data = [];
            foreach ($categorias as $key => $value) {

                $data = [
                    "id" => $value->id,
                    "nombre_categoria" => $value->name,
                    "color" => $value->color
                ];
                array_push($categorias_data, $data);
            }

            $rsp['data'] =  $categorias_data;
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            //echo(json_encode($rsp));exit;
        }
        return $rsp;
    }

    public function productDetailBySlug($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            $slug = $request->getAttribute('slug');
            $product = Product::with(['category', 'teacher', 'images'])->where('status', 1)->where('slug', $slug)->first();
            $products = Product::with(['category', 'teacher'])->where('status', 1)->where('company_id', $company['id'])->orderBy('created_at', 'DESC')->limit(3)->get();
            $characteristics = Characteristic::with(['design_icon'])->where('product_id', $product->id)->get();
            $topics = Topic::with(['subtopics' => function ($query) {
                $query->with(['design_icon'])->orderBy('order', 'asc');
            }])->where('product_id', $product->id)->orderBy('order', 'asc')->get();
            $menu_parent = Menu::with(['childrens', 'template_view' => function ($query) {
                $query->where('index', '=', 1);
            }])->where('company_id', $company['id'])->first();
            $content = $this->getContentByMenuSlug($menu_parent);
            $contents = $content['data'];
            $rsp['data'] = compact('product', 'products', 'characteristics', 'topics', 'contents');
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function portafolioDetailBySlug($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            $slug = $request->getAttribute('slug');
            $Portafolio = Portafolio::with(['category', 'teacher'])->where('status', 1)->where('slug', $slug)->first();
            $Portafolios = Portafolio::with(['category', 'teacher'])->where('status', 1)->where('company_id', $company['id'])->where('type_id', $Portafolio->type_id)->whereNotIn('id', [$Portafolio->id])->orderBy('created_at', 'DESC')->get();
            $characteristics = Characteristic::with(['design_icon'])->where('product_id', $Portafolio->id)->get();
            $topics = Topic::with(['subtopics' => function ($query) {
                $query->with(['design_icon'])->orderBy('order', 'asc');
            }])->where('product_id', $Portafolio->id)->orderBy('order', 'asc')->get();
            $menu_parent = Menu::with(['childrens', 'template_view' => function ($query) {
                $query->where('index', '=', 1);
            }])->where('company_id', $company['id'])->first();
            $content = $this->getContentByMenuSlug($menu_parent);
            $rsp['data'] = compact('Portafolio', 'Portafolios', 'characteristics', 'topics', 'content');
            $rsp['success'] = true;
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function register($request)
    {
        $rsp = FG::responseDefault();
        try {
            $params = $request->getParsedBody();
            $company = $request->getAttribute('att_company');
            $slug = $request->getAttribute('slug');

            if (!$slug) {
                throw new \Exception('No se encontró el curso a matricular');
            }
            $product = Product::where('company_id', $company['id'])->where('slug', $slug)->first();
            if (!$product) {
                throw new \Exception('No se encontró el curso');
            }
            if (!$params['name']) {
                throw new \Exception('El campo nombres es obligatorio');
            }
            if (!$params['email']) {
                throw new \Exception('El campo correo eléctronico es obligatorio');
            }

            $inscription = new Inscription();
            $inscription->product_id = $product->id;
            $inscription->email = $params['email'];
            $inscription->code = strtoupper(FG::rand_string(3) . uniqid(time()));
            $inscription->name = $params['name'];
            $inscription->phone = $params['phone'];
            $inscription->price = $product->price;
            $inscription->level = $params['level'];
            $inscription->status = Inscription::PENDIENTE;
            $inscription->ip = FG::getRealIP();
            $inscription->company_id = $company['id'];
            $inscription->save();

            $code = $inscription->code;

            $rsp['data'] = compact('slug', 'code');
            $rsp['success'] = true;
            $rsp['message'] = 'Se registro correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function getTemplateCustomSlug($slug, $company)
    {
        $template_view = Capsule::table('templates_views')
            ->join('templates', 'templates.id', '=', 'templates_views.template_id')
            ->join('companies', 'companies.template_id', '=', 'templates.id')
            ->where('companies.id', '=', $company['id'])
            ->where('templates_views.slug', '=', $slug)
            ->select('templates_views.*')
            ->first();
        if (!$template_view) {
            header("Location: /");
            exit();
        }
        return ['menu' => ['template_view' => $template_view]];
    }

    public function products($request)
    {
        $rsp = FG::responseDefault();
        try {
            $products = [];
            $categories = [];
            $company = $request->getAttribute('att_company');
            if (isset($company['id'])) {
                $keys_products = array();
                $keys_categories = array();
                $products = Capsule::table('products AS P')
                    ->join('categories AS C', 'P.category_id', '=', 'C.id')
                    ->where('P.deleted_at')
                    ->where('P.status', 1)
                    ->where('P.company_id', '=', $company['id'])
                    ->select('P.*', 'C.name AS category_name')
                    ->get();

                $domain = FG::getDomain();
                foreach ($products as $k => $o) {
                    $o->file = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://" . $domain . $o->file;
                    $keys_products[$o->category_id][] = $o;
                    $keys_categories[$o->category_id] = [
                        'id' => $o->category_id,
                        'name' => $o->category_name,
                        'products' => []
                    ];
                }
                $categories = array_values($keys_categories);
                foreach ($categories as $k => $o) {
                    if (isset($keys_products[$o['id']])) {
                        $categories[$k]['products'] = $keys_products[$o['id']];
                    }
                }
            }

            $rsp['data'] = compact('products', 'categories');
            $rsp['success'] = true;
            $rsp['message'] = 'products';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }
}
