<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;


use Common\Plugin\Error;
use Common\Plugin\Set;
use Common\Plugin\Member;
use Common\Plugin\Purview;




class SetController extends BaseController{
	
	public function __autoload() {
		parent::__autoload();
		$this->error = new Error();
		$this->set = new Set();
		$this->member = new Member();
		
	}
	
	
	/*专题分类列表*/
	public  function special_list(){
		$result = $this->set->publish_special();
	}
	
	/*添加专题分类*/
	public function add_special(){
		$result = $this->set->add_special();
		if(is_numeric($result)){
			F('special',null);
			$tips = array(
				'status' => '1',
				'msg' => '发布成功',
				'info' => array(),
			);
		}else{
			$tips = array(
				'status' => '0',
				'msg' => $result,
				'info' => array(),
			);
		}
		$this->ajaxReturn($tips);
	}
	
	/*编辑专题分类*/
	public function edit_special(){
		$result = $this->set->edit_special();
		if(is_numeric($result)){
			F('special',null);
			$tips = array(
				'status' => '1',
				'msg' => '修改成功',
				'info' => array(),
			);
		}else{
			$tips = array(
				'status' => '0',
				'msg' => $result,
				'info' => array(),
			);
		}
		$this->ajaxReturn($tips);
	}
	
	
	/*增加权限隐私部分人参数  人员名单获取*/
	
	public function perason_list(){
		$result = $this->set->perason_list();

		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*编辑权限隐私部分人参数  获取人员已经选择的名单*/
	public function get_perason_list(){
		$special_id = I('get.special_id');
		if(!$special_id){
			$result['list']= array();
			$tips = array(
				'status' => '1',
				'msg' => 'OK',
				'info' => $result,
			);
		}else{
			$result = $this->set->get_perason_list();
			$tips = array(
				'status' => '1',
				'msg' => 'OK',
				'info' => ($result['list'])?$result:array(),
			);
		}
		$this->ajaxReturn($tips);
	}
	
	/*编辑个人资料*/
	public function set_data(){
		
		if($_POST){
			$result = $this->set->set_data();
			if(is_numeric($result)){
				$info = $this->member->get_member_info($result);
				if($info){
					$tips = array(
						'status' => '1',
						'msg' => '修改成功',
						'info' => ($info)?$info:array(),
					);
				}else{
					$tips = array(
						'status' => '0',
						'msg' => '修改失败',
						'info' => array(),
					);
				}
			}
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips());
		}
		
	}
	
	/*更换手机号码*/
	public function change_mobile(){
		if($_POST){
			$result = $this->set->change_mobile();
			if(is_numeric($result)){
				$info = $this->member->get_member_info($result);
				$tips = array(
					'status' => '1',
					'msg' => 'OK',
					'info' => ($info)?$info:array(),
				);
			}else{
				$tips = array(
					'status' => '0',
					'msg' => $result,
					'info' => array(),
				);
			}
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips());
		}
		
	}
	
	
	
	/*账号绑定*/
	public  function bind_account(){
		$type = I('post.type');
		if(!$type) $this->ajaxReturn($this->error->tips());
		$result = $this->set->bind_account($type);

		if(is_numeric($result)){
			$info = $this->member->get_member_info($result);
			$tips = array(
				'status' => '1',
				'msg' => '操作成功',
				'info' => ($info)?$info:array(),
			);
		}else{
			$tips = array(
				'status' => '0',
				'msg' => $result,
				'info' => array(),
			);
		}
		$this->ajaxReturn($tips);
	}
	
	/*隐私设置*/
	public function set_privacy(){
		
		$result = $this->set->set_privacy();
		if(is_numeric($result)){
			
			$this->ajaxReturn($this->error->tips(3));
		}else{
			$this->ajaxReturn($this->error->tips(2));
			
		}
	}
	
	
	/*专题排序*/
	public  function special_sort(){
		if(!$_POST){
			$this->ajaxReturn($this->error->tips());
		}
		/*判断是否传入控制*/
		foreach($_POST as $v){
			if(!$v){
				$this->ajaxReturn($this->error->tips(2));
			}
		}
		$result = $this->set->special_sort();
		if(is_numeric($result)){
			F('special',null);
			$this->ajaxReturn($this->error->tips(3));
		}else{
			$this->ajaxReturn($this->error->tips(2));
		}
	}
	
	/*删除分类*/
	public  function del_special(){
		$id = I('get.special_id');
		if(!$id) return $this->ajaxReturn($this->error->tips());
		$result = $this->set->del_special($id);
		if(is_numeric($result)){
			F('special',null);
			$this->ajaxReturn($this->error->tips(3));
		}else{
			$this->ajaxReturn($this->error->tips(2));
		}
	}
	
	
	/*意见反馈*/
	
	public  function feedback(){
		
		if($_POST){
			$result = $this->set->feedback();
			if(is_numeric($result)){
				$this->ajaxReturn($this->error->tips(25));
			}else{
				$tips = array(
					'status' => '0',
					'msg' => $result,
					'info' => array(),
				);
				$this->ajaxReturn($tips);
			}
		}else{
			$this->ajaxReturn($this->error->tips());
		}
	}
	
	
	public function test(){
		dump(Purview::feed_view_purview());
	}
	

}
	