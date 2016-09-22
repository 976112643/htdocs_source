<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
use Common\Org\Cache;
class MenuController extends AdminController {
	protected $table = 'menu';
	protected $session_cache_name = 'menu_result';
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$map['pid'] = 0;
		if(I('pid')) {
			$map['pid'] = intval(I('pid'));
		}
		$keywords = I ('keywords');
		if($keywords) {
			$map['title'] = array('like', "%$keywords%");
		}
		$map['is_del'] = array('EQ', 0);
		$result = $this->page($this->table, $map, 'id asc');
		$result = int_to_string($result, array ('is_hid' => array (0 => '启用', 1 => '禁用')));
		$data['result'] = $result;
		$data['menu_cache'] = Cache::db_table_key($this->table, '', 'assoc_id');
		$this->assign($data);
		$this->display();
	}
	/*
	 * 添加菜单
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function add() {
		
		if(IS_POST) {
			$this->update();
		}else {
			
			if(I('pid')) {
				$map = array(
					'id'=> array('EQ', I('pid')),
					'is_del'=> array('EQ', 0)
				);
				$pinfo = get_info($this->table, $map);
				$this->assign('pinfo', $pinfo);
			}
			$this->display('operate');
		}
	}
	/*
	 * 修改菜单
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function edit() {
		if(IS_POST) {
			$this->update();
		} else {
			if(I('pid')) {
				$map = array(
					'id'=> array('EQ', I('pid')),
					'is_del'=> array('EQ', 0)
				);
				$pinfo = get_info($this->table, $map);
				$this->assign('pinfo', $pinfo);
			}
			$id = intval(I('ids'));
			$map = array(
				'id'=> array('EQ', $id),
				'is_del'=> array('EQ', 0)
			);
			$data['info'] = M($this->table)->where($map)->find();
			$map = array(
				'pid'=> $id,
				'is_del'=> array('EQ', 0)
			);
			$result = M( $this->table)->where($map)->field ('title')->select ();
			$sub_menu = array();
			foreach($result as $row) {
				$sub_menu[] = $row['title'];
			}
			$data['sub_menu'] = $sub_menu;
			
			$this->assign($data);
			$this->display('operate');
		}
	}
	/*
	 * 添加/修改操作
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function update() {
		if(IS_POST) {
			$posts = I('post.');
			$id = intval(I('post.id'));
			if($id > 0) {
				$before_info = get_info($this->table, array('id' => $id, 'is_del'=> array('EQ', 0)), 'pid,path');
			}
			$url = I ('post.url');
			$rules = array (
				array('title', 'require', '菜单名称必须！') 
			);
			/*
			 * 计算level等级
			 */
			$pid = intval(I('post.pid'));
			$level = 0;
			$_POST['path'] = '-0-';
			if ($pid > 0) {
				$parent_info = get_info($this->table, array('id' => $pid, 'is_del'=> array('EQ', 0)), 'pid,path,level');
				if($parent_info) {
					$level = $parent_info['level'] + 1;
					$_POST['path'] = $parent_info['path'].$pid.'-';
				} else {
					$this->error('添加失败，上级菜单没有找到');
				}
			}
			$_POST['level'] = $level;
			$result = update_data($this->table, $rules);
			if(is_numeric($result)) {
				$_POST = null;
				// 判断是否更改父级菜单
				$after_info = get_info($this->table, array('id' => $result, 'is_del'=> array('EQ', 0)), 'pid,path');
				if($before_info['pid'] != $after_info['pid']) {
					$map['pid'] = $result;
					$menu_data['path'] = $after_info['path'].$result.'-';
					M($this->table)->where($map)->save($menu_data);
					$menu_data = null;
				}
				session('menu_result', null);
				Cache::db_table_key($this->table, null, 'assoc_id');
				$this->success('操作成功', U('index', array('pid'=> intval($pid))));
			} else {
				$this->error($result);
			}
		} else {
			$this->success('违法操作', U('index'));
		}
	}
	
	/*
	 * 启用
	 */
	function enable() {
		session('', null);
		Cache::db_table_key($this->table, null, 'assoc_id');
		$_REQUEST['update_param'] = I('get.');
		$_GET['is_hid'] = 0;
		$this->setStatus('is_hid');
	}
	/*
	 * 禁用
	 */
	function disable() {
		session('menu_result', null);
		Cache::db_table_key($this->table, null, 'assoc_id');
		$_REQUEST['update_param'] = I('get.');
		$_GET['is_hid'] = 1;
		$this->setStatus(is_hid);
	}
	/*
	 * 删除数据库中的数据，如果是删除数据到回收站，不需要此函数
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function del() {
		M()->startTrans();
		$ids = I('ids');
		if (empty($ids)) {
			$this->error('请选择要删除的菜单!');
		}
		if (is_array($ids)) {
			$map = null;
			$map['id'] = array('in', $ids);
			$result = delete_data($this->table, $map);
			$ids_str = implode(',', $ids);
			if($result) {
				foreach($ids as $key => $val) {
					$map = null;
					$map['path'] = array('like', '%-'.$val.'-%');
					delete_data($this->table, $map);
				}
				action_log($this->table, $ids);
				session(menu_result, null);
				Cache::db_table_key($this->table, null, 'assoc_id');
				M()->commit();
				$this->success ('操作成功', U('index'));
			} else {
				M()->rollback();
				$this->error($result);
			}
		} else {
			$ids = intval($ids);
			$map = null;
			$map['id'] = $ids;
			$result = delete_data($this->table, $map);
			if ($result) {
				$map = null;
				$map['path'] = array('like', '%-'.$ids.'-%');
				delete_data($this->table, $map);
				action_log($this->table, $ids);
				session('menu_result', null);
				Cache::db_table_key($this->table, null, 'assoc_id');
				M()->commit();
				$this->success('操作成功', U('index'));
			} else {
				M()->rollback();
				$this->error($result);
			}
		}
	}
}