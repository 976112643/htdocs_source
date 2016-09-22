<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class SecurityController extends AdminController {
	protected $table = 'member';
	public function index() {
		$data ['info'] = get_info ($this->table, array ("id" => session ( "member_id" ) ) );
		$this->assign ( $data );
		$this->display ();
	}
	/*
	 * 当前登陆用户密码修改
	 * @time 2015-06-12
	 * @author 周伍 <***@qq.com>
	 */
	public function password() {
		if (IS_POST) {
			$password_old = I ( 'password_old' );
			$password = I ( 'password' );
			$password_agin = I ( 'password_agin' );
			if ($password != $password_agin) {
				$this->error ( '两次密码输入不同' );
			}
			$info = get_info ( $this->table, array ('id' => session ( 'member_id' ),'password' => md5 ( md5 ( $password_old ) ) ) );
			if (! $info) {
				$this->error ( '当前密码错误' );
			}
			$_POST = array ('id' => session ( 'member_id' ),'password' => md5 ( md5 ( $password ) ) );
			update_data ( $this->table );
			$this->success ( '成功', 'index' );
		} else {
			$this->display ();
		}
	}
}