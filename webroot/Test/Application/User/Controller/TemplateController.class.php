<?php
namespace User\Controller;
use Home\Controller\HomeController;
class TemplateController extends HomeController {
	public function index(){
        $this->display();
    }
}