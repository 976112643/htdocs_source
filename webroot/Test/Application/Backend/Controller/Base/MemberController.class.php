<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
use Common\Org\Cache;
class MemberController extends AdminController {
	protected $table = 'admin';
	protected $role = 'role';
	protected $action_filed = 'id,username as title';
	/*
	 * 用户列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$map ['is_del'] = 0;
		$keywords = I ( 'keywords' );
		if ($keywords) {
			// $map['username|email']=array('like', "%$keywords%");
			$map ['username|email'] = array ('like','%' . ( string ) $keywords . '%' );
		}
		$result = $this->page ( D ( "MemberView" ), $map );
		
		$result = int_to_string ( $result );
		$data ['result'] = $result;
		
		$data ['member_count'] = count_data ( $this->table, $count_map );
		
		$this->assign ( $data );
		$this->display ();
	}
	
	/*
	 * 添加用户
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function add() {
		if (IS_POST) {
			$this->update ();
		} else {
			$data ['role'] = get_role_info ();
			$data ['operate_type'] = '添加';
			
			$this->assign ( $data );
			$this->display ( 'operate' );
		}
	}
	
	/*
	 * 修改用户
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function edit() {
		if (IS_POST) {
			$this->update ();
		} else {
			$map ['id'] = intval ( I ( 'ids' ) );
			$data ['info'] = get_info ( $this->table, $map );
			$data ['role'] = get_role_info ();
			$data ['operate_type'] = '修改';
			$this->assign ( $data );
			$this->display ( 'operate' );
		}
	}
	
	/*
	 * 添加/修改操作
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function update() {
		if (IS_POST) {
			$id = intval ( I ( 'post.id' ) );
			$rules = array (
				array ('username','require','用户名必须填写！' ),
				array ('role_id','require','请选择用户组！')
			);
			if ($id == 0) { // 如果是添加
				$rules [] = array ('password','require','密码必须填写！' );
				$_POST ['password'] = md5 ( md5 ( I ( 'post.password' ) ) );
			} else { // 如果是修改
				if (I ( 'post.password' )) {
					$_POST ['password'] = md5 ( md5 ( I ( 'post.password' ) ) );
				} else {
					unset ( $_POST ['password'] );
				}
			}
			if (I ( "email" )) {
				$rules [] = array ('email','/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,3})+$/','邮箱格式错误！' );
			}
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) {
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$this->error ( '违法操作', U ( 'index' ) );
		}
	}
	/* 用户的访问授权 */
	function access() {
		if (IS_POST) {
			$id = intval ( I ( 'id' ) );
			$access_id_arr = I ( 'post.access_id' );
			if ($access_id_arr) {
				$rules = implode ( ',', $access_id_arr );
			} else {
				$rules = '';
			}
			$_POST = null;
			$_POST ['id'] = $id;
			$_POST ['rules'] = $rules;
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) {
				session("menu_result",null);
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$Menu = M ( 'menu' );
			$menus = $Menu->where ( array ('is_del' => 0 ) )->order ( 'sort desc' )->select ();
			$data ['menus'] = list_to_tree ( $menus );
			$data ['info'] = get_info ( $this->table, array ('id' => intval ( I ( 'ids' ) ) ) );
			$role_list = Cache::db_table_key($this->role, array('order'=> 'id desc'), 'assoc_id');
			$data['info']['rules'] .= $role_list[$data['info']['role_id']] ? ','.$role_list[$data['info']['role_id']]['menu_ids'] : '';
			$this->assign ( $data );
			$this->display ();
		}
	}
	
	/*
	 * 启用
	 * @time 2015-04-20
	 * @author 小邓 <969101097@qq.com>
	 */
	function enable() {
		session("menu_result",null);
		$_GET ["status"] = 1;
		$this->setStatus ();
	}
	
	/*
	 * 禁用
	 * @time 2015-04-20
	 * @author 小邓 <969101097@qq.com>
	 */
	function disable() {
		session("menu_result",null);
		$_GET ["status"] = 0;
		$this->setStatus ();
	}
	
	/*
	 * 删除
	 * @time 2015-04-20
	 * @author 小邓 <969101097@qq.com>
	 */
	function del() {
		session("menu_result",null);
		$_GET ["status"] = - 1;
		$this->set_status ();
	}
}