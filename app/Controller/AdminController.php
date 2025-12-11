<?php 

namespace App\Controller;

use App\Model\{User, Landing};
use App\Down\CompanyDown;

class AdminController extends BaseController
{
	public function dashboard($request) {
		$down = new CompanyDown();
		$rsp = $down->dashboard($request);
		return View::render('admin/home/dashboard.twig',compact('rsp'));
	}

	public function users($request) {
		$rsp = array();
		return View::render('admin/users/index.twig',compact('rsp'));
	}

	public function company($request) {
		$rsp = array();
		return View::render('admin/companies/detail.twig',compact('rsp'));
	}

	public function general($request) {
		$rsp = array();
		return View::render('admin/companies/general.twig',compact('rsp'));
	}

	public function scheme($request) {
		$landing = new Landing();
		$rsp = $landing->scheme($request);
		return View::render('admin/landing/scheme.twig',compact('rsp'));
	}

	public function login($request) {
		$rsp = array();
		return View::render('admin/login/login.twig',compact('rsp'));
	}

	public function postlogin($request) {
		$user = new User();
        return $user->postlogin($request);
	}

	public function signout($request) {
		$user = new User();
        return $user->signout($request);
	}

	public function indexSettings($request) {
		$down = new CompanyDown();
		$rsp = $down->indexSettings($request);
		return View::render('admin/companies/settings.twig',compact('rsp'));
	}

	public function saveSettings($request) {
		$down = new CompanyDown();
        return $down->saveSettings($request);
	}

}

?>