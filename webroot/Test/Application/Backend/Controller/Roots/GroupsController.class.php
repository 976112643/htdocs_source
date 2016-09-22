<?php
namespace Backend\Controller\Roots;
use Backend\Controller\Base\MillerController;
class GroupsController extends MillerController {
	protected $table = 'groups';//权限组表
	
	/**
	 * 权限组列表
	 * @流程分析：
	 * 1、获取传入的值
	 * 2、若没有值则直接获取所有权限组
	 * @time 2016-04-29
	 * @author 刘楚雄
	 */
	public function index(){
		$res = $this->page($this->table,$map);
		$data['res'] = $res;
		$this->assign($data);
		$this->display();
	}
	/**
	 * 添加权限组
	 * @流程分析：
	 * 1、判断是否为post提交
	 * 2、如果是则进行添加操作，否则输出到模板
	 * @time 2016-04-29
	 * @author 刘楚雄
	 */
	public function add(){
		if(IS_POST){
			$data = I('post.');
			if($data['names'] == ""){
				$this->error('权限组名称不能为空');
			}
			$map['names'] = $data['names'];
			$map['is_del'] = 0;
			$res = get_info($this->table,$map);
			if($res){
				$this->error('该权限组名称已存在');
			}
			$url_id = implode(',',$data['access_id']);
			$_POST = array(
				'names'=>$data['names'],
				'url_id'=>$url_id
			);
			$ras = update_data($this->table);
			if($ras){
				$this->success('添加成功',U('index'));
			}
		}else{
			$map['is_del'] = 0;
			$map['id'] = array('neq','1');
			$map['path'] = array('notlike','-0-1-%');
			$res = get_result('menu',$map);
			$data ['menus'] = list_to_tree($res);
			$this->assign ($data);
			$this->display();
		}
	}
	/**
	 * 修改权限组
	 * @流程分析：
	 * 1、判断是否为post提交
	 * 2、如果是则进行修改操作，否则输出到模板
	 * @time 2016-04-29
	 * @author 刘楚雄
	 */
	public function upd(){
		if(IS_POST){
			$data = I('post.');
			if($data['names'] == ""){
				$this->error('权限组名称不能为空');
			}
			$map['names'] = $data['names'];
			$map['is_del'] = 0;
			$map['id'] = array('neq',$data['id']);
			$res = get_info($this->table,$map);
			if($res){
				$this->error('该权限组名称已存在');
			}
			$url_id = implode(',',$data['access_id']);
			$_POST = array(
					'id'=>$data['id'],
					'names'=>$data['names'],
					'url_id'=>$url_id
			);
			$ras = update_data($this->table);
			if($ras){
				$this->success('修改成功',U('index'));
			}
		}else{
			$id = I('ids');
			$maps['id'] = $id;
			$maps['is_del'] = 0;
			$ras = get_info($this->table,$maps);
			$data['ras'] = $ras;
			$map['is_del'] = 0;
			$map['id'] = array('neq','1');
			$map['path'] = array('notlike','-0-1-%');
			$res = get_result('menu',$map);
			$data ['menus'] = list_to_tree($res);
			$this->assign ($data);
			$this->display();
		}
	}
}