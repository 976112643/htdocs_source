<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class ManagerMenuController extends AdminController {
	protected $table = 'manager_menu';
	protected $session_cache_name = 'manager_menu_result';
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$map ['pid'] = 0;
		if (I ( 'pid' )) {
			$map ['pid'] = intval ( I ( 'pid' ) );
		}
		$keywords = I ( 'keywords' );
		if ($keywords) {
			$map ['title'] = array ('like',"%$keywords%" );
		}
		$map ['status'] = array ('gt',- 1 );
		$result = $this->page ( $this->table, $map, 'id asc' );
		$result = int_to_string ( $result, array ('status' => array (1 => '启用',- 1 => '删除',0 => '禁用' ) ) );
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
			if (I ( "pid" )) {
				$pinfo = get_info ( $this->table, array ("id" => I ( "pid" ) ) );
				$this->assign ( "pinfo", $pinfo );
			}
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
			if (I ( "pid" )) {
				$pinfo = get_info ( $this->table, array ("id" => I ( "pid" ) ) );
				$this->assign ( "pinfo", $pinfo );
			}
			$id = intval ( I ( 'ids' ) );
			$map ['id'] = $id;
			$data ['info'] = M ( $this->table )->where ( $map )->find ();
			$result = M ( $this->table )->where ( array ('status' => 1,'pid' => $id ) )->field ( 'title' )->select ();
			$sub_menu = array ();
			foreach ( $result as $row ) {
				$sub_menu [] = $row ['title'];
			}
			$data ['sub_menu'] = $sub_menu;
			
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
			if ($id > 0) {
				$before_info = get_info ( $this->table, array ('id' => $id ), 'pid,path' );
			}
			
			$url = I ( 'post.url' );
			$rules = array (
				array ('title','require','菜单名称必须！' ) 
			);
			/*
			 * 计算level等级
			 */
			$pid = intval ( I ( 'post.pids' ) );
			$level = 0;
			$_POST ['path'] = '-0-';
			 if ($pid > 0) {
				$parent_info = get_info ( $this->table, array ('id' => $pid ), 'pid,path,level' );
				if ($parent_info) {
					$level = $parent_info ['level'] + 1;
					$_POST ['path'] = $parent_info ['path'] . $pid . '-';
				} else {
					$this->error ( "添加失败，上级菜单没有找到" );
				}
			} 
			$_POST['pid'] = $pid;
			$_POST['level'] = $level;
			/* 附加属性 */
			if(I('post.additional', false, '/\S+/')) {
				$_POST['additional'] = ' '.trim($_POST['additional']);
			}
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) {
				$_POST = null;
				// 判断是否更改父级菜单
				$after_info = get_info ( $this->table, array ('id' => $result ), 'pid,path' );
				if ($before_info ['pid'] != $after_info ['pid']) {
					$map ['pid'] = $result;
					$menu_data ['path'] = $after_info ['path'] . $result . '-';
					M ( $this->table )->where ( $map )->save ( $menu_data );
					$menu_data = null;
				}
				F("manager_menu_result",null);
				F($this->table.'_assoc_id', null);
				getMenuListService();
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
		F($this->table.'_assoc_id', null);
		getMenuListService();
		$_GET ["status"] = 1;
		$this->setStatus ( "status" );
	}
	/*
	 * 禁用
	 */
	function disable() {
		F("manager_menu_result",null);
		F($this->table.'_assoc_id', null);
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
				F($this->table.'_assoc_id', null);
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