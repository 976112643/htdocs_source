<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;

use Common\Plugin\Notice;
use Common\Plugin\Error;
use Common\Plugin\Find;


/*消息类  需要登录才可以看到*/
class NoticeController extends BaseController{
	
	
	public function __autoload() {
		parent::__autoload();
		$this->notice = new Notice();
		$this->error = new Error();
		$this->find = new Find();
	}
	
	
	/*获取消息条数*/
	public function index(){
		/*错误返回信息*/
		$uid = I('get.uid');				/*用户id*/
		if(!$uid) $this->ajaxReturn($this->error->tips());
		$limit = '1';
		$map = array(
			'uid' => $uid,
		);
		$type = 'row';
		$result = $this->notice->get_notice($map,'',$type);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result)?$result:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*其它通知 只有推荐和转载*/
	public function other_notice(){
		$uid = I('get.uid');
		if(!$uid) $this->ajaxReturn($this->error->tips());
		$map = array(
			'feed_hot.uid'=>$uid,
			'feed_hot.type' => array('in','2,3'),
		);
		$result  = $this->find->get_hot($map,'view','feed_hot.addtime desc');
		$this->notice->clear_notice(array('uid'=>$uid),'other_message');
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
		
	}
	
	/*喜欢通知接口*/
	public function like_notice(){
		$uid = I('get.uid');
		if(!$uid) $this->ajaxReturn($this->error->tips());
		$map = array(
			'feed_hot.uid'=>$uid,
			'feed_hot.type' => 1,
		);
		$result  = $this->find->get_hot($map,'view');
		$this->notice->clear_notice(array('uid'=>$uid),'like_message');
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*评论数据*/
	public function comment_notice(){
		$uid = I('get.uid');
		if(!$uid) $this->ajaxReturn($this->error->tips());
		/*查看自己发的文章 所有数据*/
		$map = array(
			'uid'=>$uid,
		);
		/*查看我参与的文章 评论数据*/
		$result  = $this->find->get_comment($map,'',1000);
		$this->notice->clear_notice(array('uid'=>$uid),'comment_message');
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
	}
}
	