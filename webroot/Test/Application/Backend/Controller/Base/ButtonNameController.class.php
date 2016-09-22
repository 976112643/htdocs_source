<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class ButtonNameController extends AdminController {
	protected $table = 'btn_name';
	protected $session_cache_name = 'manager_menu_result';
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$keywords = I ( 'keywords' );
		if ($keywords) {
			$map ['title'] = array ('like',"%$keywords%" );
		}
		$map ['status'] = array ('gt',- 1 );
		$result = $this->page ( $this->table, $map, 'id asc' );
		$result = int_to_string ( $result, array ('status' => array (1 => '启用',- 1 => '删除',0 => '禁用' )));
		$data ['result'] = $result;
		$this->assign ( $data );
		$this->display ();
	}
	/*
	 * 添加菜单
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
	 * 修改菜单
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
			$posts = I ( "post." );
			$id = intval ( I ( 'post.id' ) );
			$rules = array (
				array ('title','require','按钮名称必须！' ),
				array ('color','require','颜色类必须！' ),
				array ('order_status','require','按钮状态必须！')
			);
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) {
				$this->success ( '操作成功', U ( 'index', array (
						'pid' => intval ( $pid ) 
				) ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$this->success ( '违法操作', U ( 'index' ) );
		}
	}
	
	/*
	 * 启用
	 */
	function enable() {
		F("manager_menu_result",null);
		getMenuListService();
		$_GET ["status"] = 1;
		$this->setStatus ( "status" );
	}
	/*
	 * 禁用
	 */
	function disable() {
		F("manager_menu_result",null);
		getMenuListService();
		$_GET ["status"] = 0;
		$this->setStatus ( "status" );
	}
	/*
	 * 删除数据库中的数据，如果是删除数据到回收站，不需要此函数
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function del() {
		M ()->startTrans ();
		$ids = I ( 'ids' );
		if (empty ( $ids )) {
			$this->error ( '请选择要删除的菜单!' );
		}
		if (is_array ( $ids )) {
			$map = null;
			$map ['id'] = array ('in',$ids );
			$result = delete_data ( $this->table, $map );
			$ids_str = implode ( ',', $ids );
			if ($result) {
				foreach ( $ids as $key => $val ) {
					$map = null;
					$map ['path'] = array ("like","%-" . $val . "-%" );
					delete_data ( $this->table, $map );
				}
				action_log ( $this->table, $ids );
				F("manager_menu_result",null);
				getMenuListService();
				M ()->commit ();
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				M ()->rollback ();
				$this->error ( $result );
			}
		} else {
			$ids = intval ( $ids );
			$map = null;
			$map ['id'] = $ids;
			$result = delete_data ( $this->table, $map );
			if ($result) {
				$map = null;
				$map ['path'] = array ("like","%-" . $ids . "-%" );
				delete_data ( $this->table, $map );
				action_log ( $this->table, $ids );
				F("manager_menu_result",null);
				getMenuListService();
				M ()->commit ();
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				M ()->rollback ();
				$this->error ( $result );
			}
		}
	}
}