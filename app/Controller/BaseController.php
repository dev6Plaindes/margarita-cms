<?php

namespace App\Controller;

use Laminas\Diactoros\Response\HtmlResponse;
use App\Model\{Menu, TemplateView, Content};
use App\Service\AuthSSOService;
use App\Utilitarian\Twig;
use App\Utilitarian\FG;

class BaseController
{
	public function renderHTML($filename, $data, $request)
	{
		// add params []
		//$templateObj = new Template();
		//$template = $templateObj->getTemplateByCompanyHost($_SERVER['HTTP_HOST']);

		$fecha_hora = FG::getFechaHora_text();
		$ano_actual = FG::getYear();

		$company = $request->getAttribute('att_company');
		if (@$company['admin'] == 1) {
			header("Location: /admin");
			exit;
		}
		$menu = new Menu();
		$data["_menu"] = $menu->getBuilMenuByCompanyId($company["id"]);
		$data["_company"] = $company;
		$data["_date"] = $fecha_hora;
		$data["_ano_actual"] = $ano_actual;

		$galery_index = "";
		foreach ($data["_menu"] as $value) {
			if ($value->template_view->index == TemplateView::GALLERY) {
				$galery_index = $value->slug;
				break;
			}
		}
		if ($galery_index) {
			$content_galery = new Content();
			$data["_galery"]["slug"] = $galery_index;
			$data["_galery"]["data"] = $content_galery->contentsGalery($company["id"]);
		}

		$authssoService = new AuthSSOService();
		$authssoService->onInit($company);
		// echo (json_encode($data));exit;
		return new HtmlResponse(Twig::render("home/" . $company["template_codigo"] . "/" . $filename, $data));
	}
}

class View
{
	public static function render($filename, $data)
	{
		// add params []
		$params = [
			'COMPANY' => isset($GLOBALS['COMPANY']) && !is_null($GLOBALS['COMPANY']) ? $GLOBALS['COMPANY'] : NULL,
			'DEFAULT_SETTINGS' => FG::getSettingsCompanyDefault()
		];
		return new HtmlResponse(Twig::render($filename, $data, $params));
	}
}

class Response
{
	public static function all($data)
	{

		$fecha_hora = FG::getFechaHora_text();
		$ano_actual = FG::getYear();

		$company = FG::getCompany();
		$menu = new Menu();
		$data["_menu"] = $menu->getBuilMenuByCompanyId($company["id"]);
		$data["_company"] = $company;
		$data["_date"] = $fecha_hora;
		$data["_ano_actual"] = $ano_actual;

		$galery_index = "";
		foreach ($data["_menu"] as $value) {
			if ($value->template_view->index == TemplateView::GALLERY) {
				$galery_index = $value->slug;
				break;
			}
		}
		if ($galery_index) {
			$content_galery = new Content();
			$data["_galery"]["slug"] = $galery_index;
			$data["_galery"]["data"] = $content_galery->contentsGalery($company["id"]);
		}
		return $data;
	}
}
