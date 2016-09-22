<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;

use Common\Plugin\Find;
use Common\Plugin\Follow;
use Common\Plugin\Purview;

class IndexController extends BaseController{
	
	public function __autoload() {
		parent::__autoload();
		$this->find = new Find();
		$this->follow = new Follow();
	}

	
	/*
	 *	1：首页的数据信息
     *	2: 需要登录可以正常的访问
	 *	@time 2016-4-18
	 *	@author	 Do
	 *	*/
	public function index(){
		/*文章权限查询条件*/					
		/*我关注的好友*/
		$uid = I('get.uid');
		$follow_list = $this->follow->get_user_attention($uid);
		if($follow_list){
			$follow_ids = implode(',',$follow_list).','.$uid;
		}else{
			$follow_ids = $uid;
		}
		
		/*用户屏蔽的文章*/
		
		/*获取推荐的文章*/
		
		$shield_ids = Purview::feed_view_purview();
		
		
		
		$map = array(
			'feed.uid' => array('in',$follow_ids),
			'feed.id'  =>array('not in',$shield_ids)	
		);
		
		$result = $this->find->find($map);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips,'json');
		
	}
	
	
	/*
	 *	1：首页的数据信息,获取文章的热度,
     *	2: 登录获取文章的互动信息,
	 *  @parm 文章的id  提交方式  GET	
	 *	@time 2016-4-18
	 *	@author	 Do
	 *	*/
	public function get_hot(){
		$id = I('get.feed_id');
		$map = array(
			'feed_id' => $id,
			'type' => array('in','2,3')
		);
		$result = $this->find->get_hot($map);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result)?$result:array(),
		);
		$this->ajaxReturn($tips,'json');
	}

}