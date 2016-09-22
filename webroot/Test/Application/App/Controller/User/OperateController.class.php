<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;

use Common\Plugin\Error;
use Common\Plugin\Operate;
use Common\Plugin\Comment;



/*用户操作  需要登录才可以进行转载 评论 关注  等操作*/
class OperateController extends BaseController{
	
	
	public function __autoload() {
		parent::__autoload();
		$this->error = new Error();
		$this->operate = new Operate();
		$this->comment = new Comment();
		/*登录判断*/
		self::__init();
	}
	
	public function __init(){
		$uid = I('post.uid');
		if(!$uid){
			$tips = Error::tips(26);
			$this->ajaxReturn($tips);
		}
    	
	}
	
	/*评论*/
	
	public function operate_comment(){
		if(!$_POST['from_uid']){
			$tips = Error::tips(26);
			$this->ajaxReturn($tips);
		}
		if($_POST){
			
			$tips = $this->comment->operate_comment();
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn(Error::tips(1));
		}
	}
	
	
	
	/*点赞*/
	
	public  function operate_add_diagg(){
		
		$post = $_POST;
		$map = array(
			'operator_uid'=>$post['operator_uid'],
			'feed_id'=>$post['feed_id'],
			'type'=>1,
		);
		$tips = $this->operate->operate_add_diagg($map);
		$this->ajaxReturn($tips);
		
	}
	
	
	
	/*取消点赞*/
	
	public  function operate_cancel_diagg(){
		
		$post = $_POST;
		$map = array(
			'operator_uid'=>$post['operator_uid'],
			'feed_id'=>$post['feed_id'],
			'type'=>1,
		);
		$tips = $this->operate->operate_cancel_diagg($map);
		$this->ajaxReturn($tips);
	}
	
	
	/*推荐*/
	
	public  function operate_add_recommend(){
		 
		$post = $_POST;
		$map = array(
			'operator_uid'=>$post['operator_uid'],
			'feed_id'=>$post['feed_id'],
			'type'=>3,
		);
		$tips = $this->operate->operate_add_recommend($map);
		$this->ajaxReturn($tips);
	}
	
	
	/*取消推荐*/
	
	public  function operate_cancel_recommend(){
		$post = $_POST;
		$map = array(
			'operator_uid'=>$post['operator_uid'],
			'feed_id'=>$post['feed_id'],
			'type'=>3,
		);
		$tips = $this->operate->operate_cancel_recommend($map);
		$this->ajaxReturn($tips);
	}
	
	
	
	/*
	 * 删除文章
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function  operate_del_feed(){
		$uid = I('post.uid');
		$feed_id = I('post.feed_id');
		$map = array(
			'id' => $feed_id,
			'is_del' => '0'
			// 'uid' => $uid
		);
		$info = get_info('feed',$map);
		/*判断是否可以删除*/
		if($info){
			$result = $this->operate->operate_del_feed($info);
			if(!$result){
				$tips = array(
					'status' => '1',
					'msg' => '删除成功',
					'info' => array(),
				);
			}else{
				$tips = $this->error->tips(2);
			}
		}else{
			$tips = $this->error->tips(23);
		}
		
		$this->ajaxReturn($tips);
	}
	
	/*
	 * 举报文章
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_report(){
		if($_POST){
		
			$tips = $this->operate->operate_report();
			
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips());
		}
	}
	
	/*
	 * 屏蔽文章
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_shield(){
		if($_POST){
			$tips = $this->operate->operate_shield();
		
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips());
		}
	}
	
	/*
	 * 删除文章的评论， 用户自己的评论可以删除， 用户文章的评论可以删除
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function delete_comment(){
		if($_POST){
			$tips = $this->operate->delete_comment();
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips());
		}
	}
	
	
	/*
	 * 分享到尚软说
	 * @author Do
	 * @time 2016-05-16
	 * */
	public function operate_share(){
		
		if($_POST){
			$tips = $this->operate->operate_share();
			$this->ajaxReturn($tips);
		}else{
			$this->ajaxReturn($this->error->tips());
		}
	}
}
	