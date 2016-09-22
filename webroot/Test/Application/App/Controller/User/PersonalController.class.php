<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;


use Common\Plugin\Error;
use Common\Plugin\Follow;
use Common\Plugin\Personal;
use Common\Plugin\Find;	
use Common\Plugin\Member;	
use Common\Plugin\Operate;	
	




class PersonalController extends BaseController{
	
	public function __autoload() {
		parent::__autoload();
		$this->follow = new Follow();
		$this->personal = new Personal();
		$this->error = new Error();
		$this->find = new Find();
	}
	
	/*个人主页*/
	public function index(){
		$uid = I('get.uid');	//被访用户id
		$fid = I('get.fid');	//来访者id
		$info = $this->personal->index($uid,$fid);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($info)?$info:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	/*我的文章*/
	public function my_feed(){
		$uid = I('get.uid');	//被访用户id
		$fid = I('get.fid');	//来访者id
		// $feed_id = $this->personal->get_my_favor($map,'page');
		$map = array(
			'feed.uid' => $uid
		);
		$result = $this->find->find($map,'page',20);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	/*我的粉丝*/
	public function my_fans(){
		
		$uid = I('get.uid');				/*用户id*/
		$is_login =($uid)?true:false;
		if(!$is_login) $this->ajaxReturn($this->error->tips());
		
		$map = array(
			'uid' => $uid,
		);
		$result = $this->follow->get_member_follow($map);

		$result['list'] = $this->personal->get_personal_count($result['list']);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*我的关注*/
	public function my_attention(){
		$uid = I('get.uid');				/*用户id*/
		$keywords = I('get.keywords');
		$is_login =($uid)?true:false;
		if(!$is_login) $this->ajaxReturn($this->error->tips(26));
		
		$map = array(
			'fid' => $uid,
		);
		
		if($keywords){
			$map_1 = array(
				'nickname'=>array('like','%'.$keywords.'%'),
			);
			$list = get_result('member',$map_1,'id');
			if($list){
				foreach($list as $v){
					$lists[]  = $v['id'];
				}
				$ids = implode(',',$lists);
				$map['uid'] = array('in',$ids);
			}else{
				$tips = array(
					'status' => '1',
					'msg' => 'OK',
					'info' => array(),
				);
				$this->ajaxReturn($tips);
			}
			
		}

		$result = $this->follow->get_member_attention($map);


		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*我的喜欢*/
	
	public function my_favor(){
		$uid = I('get.uid');
		$map = array(
			'operator_uid' => $uid,
			'type' => 1,
		);
		if(!$uid) $this->ajaxReturn($this->error->tips());
		$feed_id = $this->personal->get_my_favor($map,'page');
		$map = array(
			'feed.id' => array('in',$feed_id)
		);
		$result = $this->find->find($map,'page',20);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*设置头像*/
	public function set_head(){
		$result = $this->personal->set_head();
		
		if(is_numeric($result)){
			$info = Member::get_member_info($result);
			$tips = array(
				'status' => '1',
				'msg' => '设置成功',
				'info' => $info,
			);
		}else{
			$tips = $this->error->tips(2);
		}
		
		$this->ajaxReturn($tips);
	}
	
	
	/**
	 * 分享好友
	 * @param integer $uid 被分享用户id
	 * @author Do    	
	 */
	public function share_friends(){
		$uid = I('get.uid');
		$result =  C('SHARE').'/'.$uid.'.html';
		$tips = array(
				'status' => '1',
				'msg' => 'OK',
				'info' => $result,
		);
		$this->ajaxReturn($tips);
	}
	

	
	
	
}