<?php
namespace App\Controller\Home;

use Common\Controller\AppController;

use Common\Plugin\User;
use Common\Plugin\Sql;

use Common\Org\Database;


class UserController extends AppController{
	
	public function __autoload() {
		
		$this->user = new User();
		$this->sql = new Sql();
	}
	
	public function index(){
		
	}	


	/*用户登录*/
	public function login(){
		
		if($_POST){
			/*验证输入的信息是否合法*/
			$data = $this->user->login();
			if(is_array($data)){
				$tips = array(
					'status' => '1',
					'msg'    => 'OK',
					'info'   => $data,
				);
			}else{
				$tips = array(
					'status' => '0',
					'msg'    => $data,
					'info'   => array(),
				);
			}
		}else{
			$tips = array(
				'status' => '0',
				'msg' => '数据异常！',
				'info' => array(),
			);

		}
		/*用户登入id*/
		session('member_follow',null);
		$this->ajaxReturn($tips);
	}


	/*用户注册*/
	public  function  register(){
		if($_POST){
			/*验证输入的信息是否合法*/
			$posts = $_POST;
			
			if(!preg_match('/^[a-z\d]{6,15}$/i',$posts['password'])) $this->ajaxReturn(array('status'=>'0','msg'=>'密码设置长度6~15位'),'json');
			
			$result = $this->user->register();
			
			if(is_numeric($result)){
				$info = Database::get_info('member',array('mobile'=>$result));
				/*注册成功后推送消息 产生消息列表*/
				$info['first_login'] = '1';
				$map = array(
					'is_del' => '0',
					'is_hid' => '0',
					'is_recommend' => '1'
				);
				$fids = Database::get_result('member',$map,'id','','10');
				Database::execute_sql($this->sql->add_follow_list($fids,$info['id']));
				$tips = array(
					'status' => '1',
					'msg' => 'OK',
					'info' => $info,
				);
			}else{
				$tips = array(
					'status' => '0',
					'msg' => $result,
					'info' => array(),
				);
			}
		}else{
			$tips = array(
				'status' => '0',
				'msg' => '数据异常！',
				'info' => array(),
			);

		}
		$this->ajaxReturn($tips);
		
	}
	
	/*发送验证码*/
	public function send_code(){
		$post = $_POST;
		if($_POST['mobile']){
			$info = Database::get_info('member',array('mobile'=>$post['mobile']));
			if(!$info){
				session('mobile',$post['mobile']);
				$code_info = $this->user->send_code();
				if($code_info['SubmitResult']['code']=='2'){
					$tips = array(
						'status' => '1',
						'msg' => '发送成功' ,
						'info' => array(),
					);
				}else{
					$tips = array(
						'status' => '0',
						'msg' => '发送失败' ,
						'info' => array(),
					);
				}
				
			}else{
				$tips = array(
					'status' => '0',
					'msg' => '手机号码已存在' ,
					'info' =>  array(),
				);
			}
			
		}else{
			$tips = array(
				'status' => '0',
				'msg' => '数据异常！' ,
				'info' => array(),
			);
		}
		
		$this->ajaxReturn($tips);
	}
	
	/*找回密码 发送验证码*/
	public function send_code_1(){
		if($_POST['mobile']){
			$info = Database::get_info('member',array('mobile'=>$_POST['mobile']));
			if(!$info){
				$tips = array(
					'status' => '0',
					'msg' => '手机号码不存在' ,
					'info' =>  array(),
				);
			}else{
				session('mobile',$_POST['mobile']);
				$code_info = $this->user->send_code();
				if($code_info['SubmitResult']['code']=='2'){
					$tips = array(
						'status' => '1',
						'msg' => '发送成功' ,
						'info' => array(),
					);
				}else{
					$tips = array(
						'status' => '0',
						'msg' => '发送失败' ,
						'info' => array(),
					);
				}
			}
		}else{
			$tips = array(
				'status' => '0',
				'msg' => '数据异常！' ,
				'info' => array(),
			);
		}
		
		$this->ajaxReturn($tips);
	}
	
	 
	/*找回密码 第一步*/
	public function find_password_1(){
		if($_POST){
			$result = $this->user->find_password();
			if(is_numeric($result)){
				$tips = array(
					'status' => '1',
					'msg' => 'OK' ,
					'info' => array(),
				);
			}else{
				$tips = array(
					'status' => '0',
					'msg' => $result ,
					'info' => array(),
				);
			}
		}else{
			$tips = array(
				'status' => '0',
				'msg' => '数据异常！' ,
				'info' => array(),
			);
		}
		$this->ajaxReturn($tips);
		
	}
	
	/*找回密码 第二步*/
	
	public function find_password_2(){
		if($_POST){
			$posts = $_POST;
			
			if(!preg_match('/^[a-z\d]{6,15}$/i',$posts['password'])) $this->ajaxReturn(array('status'=>'0','msg'=>'密码设置长度6~15位'),'json');
			
			$result = $this->user->find_password_2();
			if(is_numeric($result)){
				$tips = array(
					'status' => '1',
					'msg' => '修改成功' ,
					'info' => array(),
				);
			}else{
				$tips = array(
					'status' => '0',
					'msg' => $result ,
					'info' => array(),
				);
			}
		}else{
			$tips = array(
				'status' => '0',
				'msg' => '数据异常！' ,
				'info' => array(),
			);
		}
		$this->ajaxReturn($tips);
	}

	


	
}
	