<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;

use Common\Org\Cache;

class ManagerGroupController extends AdminController {
	protected $table = 'manager_role';
	
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$map ['is_admin'] = 1;
		$map ['status'] = array ('gt',- 1 );
		$keywords = I ( 'keywords' );
		if ($keywords) {
			$map ['title'] = array ('like',"%$keywords%" );
		}
		$result = $this->page ( $this->table, $map, 'id asc' );
		$result = int_to_string ( $result );
		$data ['result'] = $result;
		
		$this->assign ( $data );
		$this->display ();
	}
	/*
	 * 添加操作
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function add() {
		if (IS_POST) {
			$this->update ();
		} else {
			$this->display ( 'operate' );
		}
	}
	/*
	 * 修改操作
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function edit() {
		if (IS_POST) {
			$this->update ();
		} else {
			$id = intval ( I ( 'ids' ) );
			$map ['id'] = $id;
			$data ['info'] = M ( $this->table )->where ( $map )->find ();
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
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) {
				// action_log($result);
				F("menu_result",null);
				F($this->table.'_assoc_id', null);
				Cache::db_table_key($this->table, array('order'=> 'id'), 'assoc_id');
				getMenuList();
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$this->success ( '违法操作', U ( 'index' ) );
		}
	}
	/*
	 * 访问授权
	 * @time 2014-12-30
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function access() {
		$id = intval ( I ( 'ids' ) );
		if (IS_POST) {
			$access_id_arr = I ( 'post.access_id' );
			$rules = implode ( ',', $access_id_arr );
			$_POST = array ('id' => $id,'rules' => $rules );
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) {
				session("menu_result",null);
				F($this->table.'_assoc_id', null);
				Cache::db_table_key($this->table, array('order'=> 'id'), 'assoc_id');
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$Menu = M ( 'manager_menu' );
			$map = array('status'=> array('NEQ', -1));
			$menus = $Menu->where($map)->order('sort desc')->select();
			$data ['menus'] = list_to_tree ( $menus );
			$data ['info'] = get_info ( $this->table, array ('id' => $id ) );
			$this->assign ( $data );
			$this->display ();
		}
	}
}