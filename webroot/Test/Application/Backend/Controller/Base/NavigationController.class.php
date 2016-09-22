<?php

namespace Backend\Controller\Base;
use Common\Plugin\Navigation;

class NavigationController extends AdminController {
	protected $table = 'navigation';
	protected $action_filed = 'id,title';
	protected $cache_data = 'navigation_result';
	/*
	 * 全局预加载
	 * @time 2015-08-15
	 * @author	秦晓武  <525249206@qq.com>
	 * */
	function __autoload(){
		parent::__autoload();
		self::init_data();
		if(IS_POST){
			self::post_operate();
		}
	}
	/* 全局数据初始化
	 * @time 2015-08-15
	 * @author	秦晓武  <525249206@qq.com>
	 * */
	function init_data(){
		$this->navigation = new Navigation();
	}
	
	/* 全局POST处理
	 * @time 2015-08-15
	 * @author	秦晓武  <525249206@qq.com>
	 * */
	function post_operate(){
		switch(I('operate')){
			default:
				;
		}
	}
	/*
	 * 首页导航
	 * @time 2015-05-05
	 * @author 康利民 <3027788306@qq.com>
	 */
	public function index() {
		$this->navigation->backend_list();
	}
	/*
	 * 添加导航
	 * @time 2015-05-05
	 * @author 康利民 <3027788306@qq.com>
	 */
	public function add() {
		$this->navigation->backend_update();
	}
	/*
	 * 修改导航
	 * @time 2015-05-05
	 * @author 康利民 <3027788306@qq.com>
	 */
	public function edit() {
		$this->navigation->backend_update();
	}
}
