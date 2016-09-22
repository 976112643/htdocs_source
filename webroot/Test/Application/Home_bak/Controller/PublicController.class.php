<?php
namespace Home\Controller;
use Home\Controller\HomeController;
class PublicController extends HomeController {
	public function index(){
        $this->display();
    }
}