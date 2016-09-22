<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class AreaController extends AdminController {
	protected $table = 'area';
	protected $cache_data = 'area_data'; /* 缓存数据名称 */
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$map['pid'] = 0;
		if (I('pid')) {
			$map['pid'] = intval(I('pid'));
		}
		
		$keywords = I('keywords');
		if ($keywords) {
			$map['title'] = array ('like',"%".$keywords."%");
		}
		$map['status'] = array ('gt',- 1 );
		$result = $this->page($this->table, $map, 'id asc');
		$result = int_to_string($result );
		$data['result'] = $result;
		
		$this->assign($data );
		$this->display();
	}
	/*
	 * 添加菜单
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function add() {
		if (IS_POST) {
			$this->update();
		} else {
			$this->display('operate');
		}
	}
	/*
	 * 修改菜单
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function edit() {
		if (IS_POST) {
			$this->update();
		} else {
			$id = intval(I('ids'));
			$map['id'] = $id;
			$data['info'] = M($this->table)->where($map)->find();
			
			$this->assign($data );
			$this->display('operate');
		}
	}
	/*
	 * 添加/修改操作
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function update() {
		if (IS_POST) {
			$id = intval(I('post.id'));
			$url = I('post.url');
			$rules = array (
				array (
					'title',
					'require',
					'菜单名称必须！' 
				)
			);// 默认情况下用正则进行验证
			/*
			 * 计算level等级
			 */
			$pid = intval(I('post.pid'));
			$level = 0;
			$_POST['path'] = '-0-';
			if ($pid > 0) {
				$parent_info = get_info($this->table,array('id'=>$pid),array('level,path'));
				if ($parent_info) {
					$level = $parent_info['level']+1;
					$_POST['path'] = $parent_info['path'].$pid.'-';
				}
			}
			$_POST['level'] = $level;
			$_POST['type'] = $this->type;
			
			$result = update_data($this->table, $rules);
			
			if (is_numeric($result )) {
				/* 修改数据后清空缓存数据 */
				F($this->cache_data, NULL );
				$this->success('操作成功', U('index',array('pid'=>intval(I('post.pid')))));
			} else {
				$this->error($result);
			}
		} else {
			$this->success('违法操作',U('index'));
		}
	}
}