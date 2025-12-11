<?php 
namespace App\Controller;

use App\Down\{TemplateDown,MenuDown,TestDown};

class HomeController extends BaseController
{
	public function contentByMenuSlug($request) {
		$template = new TemplateDown();
		// return View::render('/mail/comunidad/contact2.twig', []);
		$rsp = $template->getContentDynamicSlug($request);
		//var_dump(json_encode($rsp["data"]));exit;
		return $this->renderHTML($rsp["data"]["menu"]['template_view']->view_twig, $rsp["data"], $request);
	}

	public function productDetailBySlug($request) {
		$template = new TemplateDown();
		$rsp = $template->productDetailBySlug($request);
		//var_dump(json_encode($rsp["data"]));exit;
		return $this->renderHTML('/product/detail.twig', $rsp["data"], $request);
	}

	public function portafolioDetailBySlug($request) {
		$template = new TemplateDown();
		$rsp = $template->portafolioDetailBySlug($request);
		//var_dump(json_encode($rsp['data']));exit;
		if ($rsp["data"]['Portafolio']->type_id == 2) {
			return $this->renderHTML('/podcast.twig', $rsp["data"], $request);
		}
		return $this->renderHTML('/portafolio/detail.twig', $rsp["data"], $request);
	}

	public function register($request) {
		$down = new TemplateDown();
		return $down->register($request);
	}

	public function users($request) {
		$down = new TestDown();
		return $down->users($request);
	}

	public function contents($request) {
        $dow = new TemplateDown();
		return Response::all($dow->getContentDynamicSlug($request));
    }

	public function products($request) {
        $dow = new TemplateDown();
		return $dow->products($request);
    }

	public function company($request) {
		return Response::all([]);
    }

}

?>