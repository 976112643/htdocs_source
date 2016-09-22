<?php

namespace Home\Controller;
use Think\Controller;

class StartAppController extends Controller {
	
	public function index() {
	
		if (array_key_exists ( 'user_id', $_GET )) {
			$sql = $sql . " where user_id=" . $_GET ['user_id'];
			$file_list = \db::get_all ( $sql );
			$colnames = $file_list [0];
			// $this->assign ('console', json_encode($colnames));
			$this->assign ( 'file_list', $file_list );
			$this->display ( "Index/index" );
		}else{
			$this->display();
		}

	}
}
