<?php
namespace Common\Plugin;

use Common\Org\Database;
use Common\Plugin\Follow;
use Common\Plugin\Image;
use Common\Plugin\Data;
/*
 *	个人中心我的资料类
 * */
 
class Personal {
	
	private $table = 'member_count';
	
	private $table_1 = 'member';
	
	private $table_2 = 'feed_hot';
	
	
	private $view = 'MemberTalentView';
	
	private $filed = true;
	
	private $limit = '20';
	
	private $type = 'all';
	
	private $order = '';
	
	private $ids = '';
	
	
	public function __construct() {
		$this->follow = new Follow();
		$this->image = new Image();
	}
	
	/*获取人员的数据  比如 粉丝数之类*/
	public function get_personal_count($list){
		
		foreach($list as $v){
			$this->ids .=$v['fid'].',';
		}
		$map = array('uid'=>array('in',$this->ids));
		$this->filed = array('uid','feed_count','attention_count','fans_count');
		$_result = Database::ext_select($this->type,$this->filed,$this->table,$map,$this->order,'','',$this->limit);
		foreach($_result as $v){
			$result[$v['uid']] = $v;
		}
		foreach($list as $k=>$v){

			$list[$k]['feed_count'] = $result[$v['fid']]['feed_count'];
			$list[$k]['attention_count'] = $result[$v['fid']]['attention_count'];
			$list[$k]['fans_count'] = $result[$v['fid']]['fans_count'];

		}
		return $list;
	}
	
	
	
	/*获取我的喜欢列表*/
	public function get_my_favor($map,$type,$list){

		$result = Database::ext_select($this->type,$this->filed,$this->table_2,$map,$this->order,'','',$this->limit);
		foreach($result as $v){
			$this->ids .=$v['feed_id'].',';
		}
		return $this->ids;
	}
	
	
	/*个人主页
	*  
	*/
	public function index($uid,$fid){
		if(!$uid) return array();
		$map = array(
			'member.id' => $uid
		);
		$info = Database::ext_select('row',$this->filed,D($this->view),$map);
		/*判定好友关系  如果是自己就不需要显示聊天  和关注 */
		if($info['icon']){
			$info['icon'] = Data::assUrl($info['icon']);
		}
		if(!$fid){
			$info['is_show'] = '0';
			/*个人信息显示*/
			$info['is_attention'] = '0';
			$info['is_fans'] = '0';
			$info['is_favor'] = '0';
		}else{
			$info['is_show'] = '1';
			$result = $this->follow->get_follow_states($uid,$fid);
			/*好友关系*/
			$info['follow_states'] = $this->follow->follow_app_state($uid, $fid, $result);
			
		}
		return $info;
		
		
	}
	
	/**
	 * 设置头像
	 * @example 00：取消失败
	 *          01：取消成功
	 * @param integer $uid
	 *        	发起操作的用户ID
	 * @param integer $fid
	 *        	被取消关注的用户ID或
	 * @return boolean 是否取消关注成功
	 */
	public function set_head(){
		$info = $this->image->uploadImgs();
		if($info){
			$post = $_POST;
			
			$img_url  = 'Uploads'.$info['img']['savepath'].$info['img']['savename'];
			$_POST = array(
				'id'   => $post['uid'],
				'icon' => $img_url,
			);
			return Database::update_data($this->table_1);
		}
		
	}
	
	/**
	 * 分享好友
	 * @param integer $uid 被分享用户id
	 * return 一个其他平台可以访问的网址   需要我们自己的域名
	 * @author Do    	
	 */
	public function share_friends(){
		$uid = I('get.uid');
		$url =  C('SHARE').'/'.$uid.'.html';
		return $url;
	}
	
	
	
	
	
	
	
}