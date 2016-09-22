<?php
namespace Home\Controller;
use Home\Controller\HomeController;
class BrowseController extends HomeController {
	public function index(){
        $this->display();
    }
    public function loadmore(){
        $this->display();
    }
}