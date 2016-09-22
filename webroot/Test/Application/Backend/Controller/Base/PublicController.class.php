<?php
namespace Backend\Controller\Base;
use Think\Controller;
class PublicController extends Controller {
	public $table = 'admin';
	public function login() {
		if (IS_POST) {
			$username = I ( 'username' );
			$password = I ( 'password' );
			if ($username == '') {
				$this->error ( '请输入用户名' );
			}
			if ($password == '') {
				$this->error ( '请输入密码' );
			}
			$code = I ( 'code' );
			$code_check = $this->check_verify ( $code );
			if ($code_check != 1) {
				$this->error ( '验证码不正确' );
			}
			$password = md5 ( md5 ( $password ) );
			$map = null;
			$map['username'] = $username;
			$map['password'] = $password;
			$map['is_del'] = array('EQ', 0);
			$info = get_info ( D ( 'MemberView' ), $map );
			if ($info) {
				$info['member_hid'] == 1 ? $this->error('账户已禁用') : true;
				// 更新登录时间和登录IP
				$nowTime = date ( 'Y-m-d H:i:s' );
				$nowIp = get_client_ip ();
				$uid = $info ['member_id'];
				$oldip = get_info($this->table, array ('id' => $uid ), 'login_time,login_ip');
				$_POST = null;
				$_POST ['id'] = $uid;
				if ($oldip) {
					$_POST ['last_login_time'] = $oldip ['login_time'];
					$_POST ['last_login_ip'] = $oldip ['login_ip'];
				}
				$_POST ['login_time'] = $nowTime;
				$_POST ['login_ip'] = $nowIp;
				update_data ($this->table);
				
				session ( 'username', $username );
				session ( 'member_id', $info ['member_id'] );
				
				$info = get_info ( D ( 'MemberView' ), $map );
				session("member_info", $info);
				action_log($this->table, $info ['member_id'], 'id,username as title');
				F ( "memnu_cache", null );
				getMenuList ();
				$this->success ( '登录成功', __ROOT__ . "/Backend" );
			} else {
				$this->error ( '用户名或密码错误' );
			}
		} else {
			header ( "location:" . __ROOT__ . "/Backend" );
		}
	}
	
	/**
	 * 验证码
	 */
	public function verify() {
		$config = array (
			'imageW' => '320',
			'imageH' => '60',
			'fontSize' => '32',
			'length' => 4 
			// 'useCurve' =>false,
			// 'useNoise' =>false
		);
		$verify = new \Think\Verify ( $config );
		$verify->entry ( 1 );
	}
	
	// 检测输入的验证码是否正确，$code为用户输入的验证码字符串
	function check_verify($code, $id = '1') {
		$verify = new \Think\Verify ();
		return $verify->check ( $code, $id );
	}
	/*
	 * 退出登录
	 * @time 2014-12-25
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function logout() {
		session ( null ); // 清空当前的session
		$this->success ( '退出成功', U ( 'backend/base/public/login' ) );
	}
}