<?php

namespace App\Controller;

use App\Model\{Company};
use App\Down\CompanyDown;

class CompanyController extends BaseController
{
	public function company($request) {
		$company = new Company();
        $rsp = $company->getCompanyCurrent($request);
		return View::render('admin/companies/company.twig', compact('rsp'));
	}

    public function interface($request) {
		$company = new Company();
        $rsp = $company->getCompanyCurrent($request);
		return View::render('admin/companies/interface.twig', compact('rsp')); 
	}
	
	public function saveData($request) {
		$company = new Company();
        return $company->saveData($request);
	}

	public function saveInterface($request) {
		$company = new Company();
        return $company->saveInterface($request);
	}
	
	public function payment($request) {
		$company = new Company();
        $rsp = $company->payment($request);
		return View::render('admin/companies/payment.twig', compact('rsp'));
	}

	public function savePayment($request) {
		$company = new Company();
        return $company->savePayment($request);
	}

	public function duplicateContent($request) {
		$dow = new CompanyDown();
        return $dow->duplicateContent($request);
	}
}

?>