<?php
namespace Backend\Controller\Base;

use Backend\Controller\Base\AdminController;

use Common\Org\Database;
use Common\Org\Cache;

class ManagerController extends AdminController {
	protected $table = 'manager';
	protected $manager_info = 'manager_info';
	protected $manager_view = 'Manager/ManagerInfoView';
	protected $action_filed = 'id,username as title';
	/*
	 * 用户列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
// 		$map ['is_admin'] = 1;
// 		$map['is_platform']=1;//判断是否是平台添加管理员
		$map ['status'] = $count_map ['status'] = array ('gt',- 1 );
		$keywords = I ( 'keywords' );
		if ($keywords) {
			// $map['username|email']=array('like', "%$keywords%");
			$map ['username'] = array ('like','%' . ( string ) $keywords . '%' );
		}
		$result = $this->page ( D ( "ManagerView" ), $map );
		
		$result = int_to_string ( $result );
		$data ['result'] = $result;
		
		$data ['manager_count'] = count_data ( "manager", $count_map );
		
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
			$map = array(
				'id'=> array('LT', 3)	
			);
			$data ['role'] = get_manager_role_info ($map);
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
			$data ['info'] = get_info (D($this->manager_view), $map );
			$data ['role'] = get_manager_role_info ();
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
				array ('username', '/^[A-Za-z\d_-]+$/', '用户名必须填写！'),
				array ('role_id', 'require', '请选择用户组！')
			);
			$_POST['type'] = $_POST['role_id'];
			$data_info = array(
				'email'=> $_POST['email'],
				'job_no'=> $_POST['username']
			);
			if ($id == 0) { // 如果是添加
				$rules[] = array('password', 'require', '密码必须填写！');
				$_POST['password'] = md5 (md5(I('post.password' )));
				$_POST['status'] = 1;
				$data_info['add_ip'] = get_client_ip();
			} else { // 如果是修改
				if(I('post.password')) {
					$_POST['password'] = md5 (md5(I('post.password')));
				} else {
					unset($_POST['password']);
				}
				$map = array(
					'manager_id'=> $id
				);
				$manager_info = Database::get_info($this->manager_info, $map, 'id');
				$data_info['id'] = $manager_info['id'];
			}
			$rules_info[] = array ('email', '/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,3})+$/', '邮箱格式错误！', 2);
			/**
			$_POST ['is_admin'] = 1; //管理员
			$_POST ['is_platform'] = 1; //平台添加人员
			*/
			$M = M();
			$M->startTrans();
			$result = Database::update_data($this->table, $rules);
			$data_info['manager_id'] = $result;
			$result_info = Database::update_data($this->manager_info, $rules_info, array(), $data_info);
			if(is_numeric($result) && is_numeric($result_info)) {
				$M->commit();
				$this->success ('操作成功', U ( 'index' ));
			}else {
				$M->rollback();
				$this->error($result);
			}
		} else {
			$this->error ('违法操作', U('index'));
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
				F("manager_menu_result",null);
				getMenuListService();
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$Menu = M ( 'manager_menu' );
			$map = array('status'=> array('NEQ', -1));
			$menus = $Menu->where($map)->order('sort desc')->select();
			$data ['menus'] = list_to_tree ( $menus );
			$group = Cache::db_table_key('manager_role', array('order'=>'id'), 'assoc_id');
			$data ['info'] = get_info ( $this->table, array ('id' => intval ( I ( 'ids' ) ) ) );
			if(isset($group[$data['info']['role_id']])) {
				$data['info']['rules'] .= ','.$group[$data['info']['role_id']]['rules'];
			}
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
		F("manager_menu_result",null);
		getMenuListService();
		$_GET ["status"] = 1;
		$this->setStatus ();
	}
	
	/*
	 * 禁用
	 * @time 2015-04-20
	 * @author 小邓 <969101097@qq.com>
	 */
	function disable() {
		F("manager_menu_result",null);
		getMenuListService();
		$_GET ["status"] = 0;
		$this->setStatus ();
	}
	
	/*
	 * 删除
	 * @time 2015-04-20
	 * @author 小邓 <969101097@qq.com>
	 */
	function del() {
		F("manager_menu_result",null);
		getMenuListService();
		$_GET ["status"] = - 1;
		$this->set_status ();
	}
}