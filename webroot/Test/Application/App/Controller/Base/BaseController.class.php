<?php
namespace App\Controller\Base;
use Common\Controller\AppController;
class BaseController extends AppController{
	
	/*
	 * 全局加载
	 * @time 2014-8-27
	 * @author	陆龙飞  <2824682114@qq.com>
	 * */
	protected function __autoload(){
		
		if(C("SITE_STATUS")!=1){
			$this->ajaxReturn(array('status'=>'0','info'=>'站点已经关闭'),'json');
		}
		$this->__init();
	}
	
	protected function __init(){
		
    	/* 前台不做验证控制可公共访问 */
		/*$this->app_login_common(array_merge(I('post.'),I('get.')));*/
	}
	
}