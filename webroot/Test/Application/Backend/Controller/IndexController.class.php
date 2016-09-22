<?php

namespace Backend\Controller;

use Common\Controller\CommonController;

class IndexController extends CommonController {
	protected function __autoload() {
		if(session('member_id')){
			$menu_result = getMenuList();
			foreach ($menu_result as $key => $value) {
				if($value['level'] == 1){
					$url = $value['url'];
					break;
				}
			}
			header('location:'.U($url));
		}
	}
	public function index() {
		$this->display();
	}
}