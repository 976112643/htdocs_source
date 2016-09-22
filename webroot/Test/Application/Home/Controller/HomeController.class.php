<?php
namespace Home\Controller;
use Common\Controller\CommonController;
class HomeController extends CommonController{
	/*
	 * 全局加载
	 * @time 2014-12-26
	 * @author	郭文龙  <2824682114@qq.com>
	 * */
	protected function __autoload(){
		if(MODULE_NAME=="Home" || MODULE_NAME=="User" ){
			session('loginout_url',U('/'));
		}else if(MODULE_NAME=="Order" && ACTION_NAME=='confirm' ){
			session('loginout_url',U('Order/Index/index'));
		}else{
			session('loginout_url',U(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME,param()));
		}
		
		if(MODULE_NAME=="User" && (CONTROLLER_NAME=="Register" || CONTROLLER_NAME=="Login")){
			session('login_url',U('/'));
		}else if(MODULE_NAME=="Home"){
			session('login_url',U('/'));
		}else if(MODULE_NAME=="Order" && ACTION_NAME=='confirm' ){
			session('login_url',U('Order/Index/index'));
		}else{
			session('login_url',U(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME,param()));
		}
		if(C("SITE_STATUS")!=1 && !$_SESSION["admin_member_id"]){
			//$this->error("站点已关闭");
		}
		//echo THEME_PATH;
		
		$this->__init();
	}
	protected function __init(){
    	
	}
	public function getSearch(){
		$data['status']=1;
		$data['tags']=array(
			array(
				"title"=>"do",
				"url"=>U('index')
			),
			array(
				"title"=>"东欧",
				"url"=>U('index')
			),
			array(
				"title"=>"大偶",
				"url"=>U('index')
			),
			array(
				"title"=>"doodles",
				"url"=>U('index')
			)
		);
		$data['users']=array(
			array(
				"title"=>"用户1",
				"avatar"=>"1_60.jpg",
				"url"=>U("",array("uid"=>1))
			),
			array(
				"title"=>"用户2",
				"avatar"=>"1_60.jpg",
				"url"=>U("",array("uid"=>2))
			),
			array(
				"title"=>"用户3",
				"avatar"=>"1_60.jpg",
				"url"=>U("",array("uid"=>3))
			)
		);
		$this->ajaxReturn($data);
	}
}