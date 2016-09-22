<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class ListDemoController extends AdminController {
	protected $table='file',$action_filed='id,name,add_time';
	
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author	郭文龙  <2824682114@qq.com>
	 * */
	public function index(){
		$map['status']=1;
		$keywords=I('keywords');
		$order=I('order');
		if($keywords){
			$map['name']=array('like', "%$keywords%");
		}
// 		$result=$this->page(D('Common/ActionLogView'), $map,'add_time desc');
		$result=$this->page(D($this->table), $map,'add_time desc');
		$result=int_to_string($result);
		$data['result']=$result;
		$this->assign($data);
		$this->display();
// 		dump(D('Common/ActionLogView'));
		dump($data);
	}
	public function  add(){
		if(IS_POST){
			dump($_POST);die;
			$this->update(); 
		}else{
			$this->display('operate');
		}
	}
	/*
	 * 删除数据库中的数据，如果是删除数据到回收站，不需要此函数
	 * @time 2014-12-26
	 * @author	郭文龙  <2824682114@qq.com>
	 * */
	function del(){
		$ids=I('ids');
		if(is_array($ids)){
			$map['id']=array('in',$ids);
			action_log ( $this->table, $ids, $this->action_filed );
			$result=delete_data($this->table,$map);
			$ids=implode(',', $ids);
			if($result){
				$this->success('操作成功',U('index'));
			}else{
				$this->error($result);
			}
		}else{
			$ids=intval($ids);
			action_log ( $this->table, $ids, $this->action_filed );
			$map['id']=$ids;
			$result=delete_data($this->table,$map);
			if($result){
// 				dump($result);die;
				$this->success('操作成功',U('index'));
			}else{
				$this->error($result);
			}
		}
	}
	
}