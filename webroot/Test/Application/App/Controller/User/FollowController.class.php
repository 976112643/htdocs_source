<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;

use Common\Plugin\Follow;
use Common\Plugin\Error;
use Common\Plugin\Notice;



class FollowController extends BaseController{
	
	public function __autoload() {
		parent::__autoload();
		$this->follow = new Follow();
		$this->error = new Error();
		$this->notice = new Notice();
		self::__init();
	}
	
	public function __init(){
		$uid = I('get.uid');
		if(empty($uid)){
			$tips = Error::tips(26);
			$this->ajaxReturn($tips);
		}
    	
	}
	
	/*用户关系 获取我的粉丝*/
	public function index(){
		/*错误返回信息*/
		
		$uid = I('get.uid');				/*用户id*/
		$is_login =($uid)?true:false;
		if(!$is_login) $this->ajaxReturn($this->error->tips());
		
		$map = array(
			'uid' => $uid,
		);
		$result = $this->follow->get_member_follow($map);

		$this->notice->clear_notice(array('uid'=>$uid),'attention_message');
		
		
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/**
	 * 添加关注 (关注用户)
	 *
	 * @example null：参数错误
	 *          11：已关注
	 *          12：关注成功(且为单向关注)
	 *          13：关注成功(且为互粉)
	 * @param integer $uid
	 *        	发起操作的用户ID
	 * @param integer $fid
	 *        	被关注的用户ID
	 * @return boolean 是否关注成功
	 */
	public function do_follow() {
		$uid = I('get.uid');
		$fid = I('get.fid');
		$tips = $this->follow->do_follow($uid,$fid);
		$this->ajaxReturn($tips);
		
	}
	
	
	/**
	 * 取消关注（关注用户 / 关注话题）
	 *
	 * @param integer $uid
	 *        	发起操作的用户ID
	 * @param integer $fid
	 *        	被取消关注的用户ID
	 * @return boolean 是否取消关注成功
	 */
	public function un_follow() {
		$fid = I('get.uid');
		$uid = I('get.fid');
		$tips = $this->follow->un_follow($uid,$fid);
		$this->ajaxReturn($tips);
	}

	
}
	