<?php
namespace App\Controller\AppCommon;
use Common\Controller\AppController;
class BaseController extends AppController {
	/*
	 * 全局加载
	 * @time 2014-08-26
	 * @author	陆龙飞  <747060156@qq.com>
	 * */
	protected function __autoload(){
		
		if(C("SITE_STATUS")!=1){
			$this->ajaxReturn(array('status'=>'0','info'=>'站点已经关闭'),'json');
		}
		$this->__init();
	}
	
	protected function __init(){
		
	 /*  open_file(array(I('get.'),$_FILES),'img','1','txt'); 
 		$prams  = array();
		$prams['apitype']  		 = I('post.apitype');
		$prams['key']    	     = I('post.key');
		$prams['home_member_id'] = I('post.home_member_id');

		
		if(!$prams['api_key']) 		  $prams['apitype']  		  = I('get.apitype');
		if(!$prams['key']) 			  $prams['key']  			  = I('get.key');
		if(!$prams['home_member_id']) $prams['home_member_id']    = I('get.home_member_id');

		*/
 	  /*  $this->app_login_common(array_merge(I('post.'),I('get.'))); */
	}
}