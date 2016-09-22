<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;

use Common\Plugin\Publish;
use Common\Plugin\Error;

class PublishController extends BaseController{
	
	public function __autoload() {
		parent::__autoload();
		
		$this->publish = new Publish();
		$this->error = new Error();
	}

	
	/*
	 *	1：文章发布 
	 *	2:发布权限
	 *	@time 2016-4-25
	 *	@author	 Do
	 *	*/
	public function post_publish(){
		if($_POST){
			$result = $this->publish->post_feed();
			if($result=='true'){
				$tips = array(
					'status' => '1',
					'msg' => '发布成功！',
					'info' => array(),
				);
			}else{
				$tips = array(
					'status' => '0',
					'msg' =>($result=='false')?'发布失败':$result,
					'info' =>  array(),
				);
			}
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips(31));
		}
		
	}
	
	
	/*转发*/
	public function repost_feed(){
		
		if($_POST){
			$result = $this->publish->repost_feed();
			if(empty($result)){
				$this->ajaxReturn($this->error->tips(32));
			}else if($result == '-1'){
				$this->ajaxReturn($this->error->tips(23));
			}else{
				$this->ajaxReturn($this->error->tips(33));
			}
		}else{
			
			$this->ajaxReturn($this->error->tips(31));
		}
		
	}
	
	
	
	
	
	/*保存用户的的新标签*/
	public function lable_operate(){

		if(!$_POST){
			$tips = array(
				'status' => '0',
				'msg' => '未选择标签',
				'info' => array(),
			);
			$this->ajaxReturn($tips);
		}else{
			$result['lable'] = $this->publish->lable_operate();
			$tips = array(
				'status' => '1',
				'msg' => 'OK',
				'info' => ($result)?$result:array(),
			);
			$this->ajaxReturn($tips);
		}
		
	}
	
	
	/*常用标签返回*/
	public  function common_label(){
		$uid = I('get.uid');
		$result = $this->publish->common_label($uid);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result)?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*发布声明返回*/
	public  function publish_statement(){
		
		$result = $this->publish->publish_statement();
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result)?$result:array(),
		);
		$this->ajaxReturn($tips);
	
	}
	
	/*发布分类*/
	public function publish_special(){
		
		$result = $this->publish->publish_special();
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result)?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	public function test(){
		$result = $this->publish->update_special_lable();
	}
	
	

}