<?php

namespace Home\Controller;
use Think\Controller;

class IndexController extends Controller {

	public  function register(){
		$token=I('token');
		if(!$token){
			$a="haha_";
			//$result=  json_decode("{\"status\":1,\"info\":{\"name\":\"张三\",\"grades\":{\"english\":50,\"math\":80,\"chinese\":100},\"interest\":[{\"name\":\"篮球\"},{\"name\":\"象棋\"}]},\"msg\":\"成功\"}");
// 			foreach ($result as $key=>$value){
// 				echo $key." ".$value;
				
// 			}
// 			var_dump($result);
			/**$this->ajaxReturn(json_result('成功',array('name'=>'张三',
				'grades'=>array('english'=>50,
				'math'=>80,
				'chinese'=>100
				),
				'interest'=>array(
				array('name'=>'篮球'),
				array('name'=>'象棋'))
			),1));*/
			//$this->ajaxReturn(json_result("连接已失效"));
		}
	}
	public function searchUser() {
		$token = I ( 'token' );
		if ($token) {
			$user_id = false;
			$data = M ( "device_token" );
			$query ['token'] = $token;
			$result = $data->where ( $query )->find ();
			if (! $result) { // 如果不存在
				$Form = D ( 'user' ); // 新增一个用户
				$user = array (
						'' 
				);
				$user_id = $Form->add ( $user );
				if ($user_id) {
					// 新增一个设备id
					$token_form = D ( 'device_token' );
					$token_info = array (
							'user_id' => $user_id,
							'token' => $token,
							'addtime' => getMillisecond () 
					);
					$token_form->add ( $token_info );
				}
			}else {
				$user_id=$result['user_id'];
			}
			if ($user_id) { // 如果该设备号已经存在
				$user_from = D ( 'user' );
				$result = $user_from->find ( $user_id );
				echo json_encode ( $result );
			}
		}
	}
	public function index() {
		$sql = "select * from  " . UPLOAD_FILE_TABLE;
		if (array_key_exists ( 'user_id', $_GET )) {
			$sql = $sql . " where user_id=" . $_GET ['user_id'];
			$file_list = \db::get_all ( $sql );
			$colnames = $file_list [0];
			// $this->assign ('console', json_encode($colnames));
			$this->assign ( 'file_list', $file_list );
			$this->display ( "Index/index" );
		}
		echo "----------------";
	}
}
