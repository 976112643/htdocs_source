<?php
namespace Common\Plugin;
use Common\Org\Database;
use Common\Plugin\Member;
use Common\Plugin\Error;
use Common\Plugin\Notice;
use Common\Plugin\Data;

/*
 *	用户关系类
 * */
class Follow {
	private $table='member_follow';
	
	private $table_1='member';
	
	private $table_2='member_count';
	
	private $filed = true;
	
	private $limit = '20';
	
	private $type = 'page';
	
	private $order = 'addtime desc';
	
	protected $view = 'MemberFollowView';
	
	protected $ids = '';
	
		
	public function __construct() {
		
		$this->member = new Member();
		$this->error = new Error();
		$this->notice = new Notice();
	}
	
	/*
	 * 获取关注我的好友 并返回好友之间的关系
	 * $parm  $uid  被关注者id   $fid  粉丝id
	 * */
	public function get_member_follow($map){
	
		$result = Database::ext_select($this->type,$this->filed,D($this->view),$map,$this->order,'','',$this->limit);
		foreach($result['list'] as $k=>$v){
			$result['list'][$k]['icon'] = Data::assUrl($v['icon']);
		}
		/*获取我的关注*/
		$fid_result = $this->get_member_realtion();
		/*好友之间关系判断*/
		$result['list'] = $this->get_realtion($result['list'],$fid_result,'fid');
		return $result;
	}
	
	
	/*获取我关注的好友*/
	
	public function get_member_attention($map){
		$result = Database::ext_select($this->type,$this->filed,$this->table,$map,$this->order,'','',$this->limit);
		$member_result = $this->member->member_key_result();
		foreach($result['list'] as $k=>$v){
			$result['list'][$k]['nickname'] = $member_result[$v['uid']]['nickname'];
			$result['list'][$k]['description'] = $member_result[$v['uid']]['description'];
			$result['list'][$k]['icon'] = Data::assUrl($member_result[$v['uid']]['icon']);
		}
		/*获取关注我的*/
		$uid_result = $this->get_attention_result();
		/*好友之间关系判断*/
		$result['list'] = $this->get_realtion($result['list'],$uid_result,'uid');
		return $result;
	}
	
	
	/*获取关注我的好友*/
	public function get_attention_result(){
		$uid = I('get.uid');
		$map = array();
		$default_map = array(
			'uid' => $uid,
			'fid' => array('in',$this->ids)
		);
		$map = array_merge($map,$default_map);
		$result = Database::ext_select('all','*',$this->table,$map);
		foreach($result as $kk=>$vv){
			$fid_list[$vv['fid']] = $vv;
		}
		return $fid_list;
	}
	
	
	/* 
	 * 
	 * 查询我关注的好友
	 * param   uid 用户id
	 * */ 
	public function get_member_realtion(){
		$fid = I('get.uid');
		$map = array();
		$default_map = array(
			'fid' => $fid,
			// 'uid' => array('in',$this->ids)
		);
		$map = array_merge($map,$default_map);
		$result = Database::ext_select('all','*',$this->table,$map);
		foreach($result as $kk=>$vv){
			$fid_list[$vv['uid']] = $vv;
		}
		return $fid_list;
		
	}
	
	
	/* 
	 * 好友之间的关系
	 * 我关注了他  他关注了我   互相关注
	 * param   uid 用户id $fid_result 我关注的好友  $uid_result 关注我的好友
	 * */ 
	public function get_realtion(&$uid_result,&$fid_result,$uid){
		
		
		$follow_states = $this->_formatFollowState ( $uid_result, $fid_result ,$uid);

		return $follow_states;
	}
	
	
	/**
	 * 格式化，用户的关注数据
	 * $uid_result  关注我的好友
	 * $fid_result 我关注的好友
	 * @return array 格式化后的用户关注状态数据
	 */
	private function _formatFollowState($uid_result, $fid_result,$uid) {

		foreach($uid_result as $k=>$v){
			if($fid_result[$v[$uid]]){
				$uid_result[$k]['follow_states'] = '2';

			}else{
				$uid_result[$k]['follow_states'] = '1';
				
			}
		}
		return $uid_result;
	}
	
	

	/**
	 * 全局的好友关系调用      主要用于网站
	 * @uid 用户id
	 * @return array 格式化后的用户关注状态数据
	 */
	public  function get_member_list_follow($result){

		foreach($result as $v){
			$this->ids.=$v['id'].',';
		}
		/*获取我关注的好友*/
		$my_attention_result = self::get_member_realtion();
		foreach($result as $k=>$v){
			if($my_attention_result[$v['id']]){
				$result[$k]['follow_states'] = '2';
			}else{
				$result[$k]['follow_states'] = '1';
			}
		}
		return $result;
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
	 * @author Do
	 * @time 2016-05-05
	 */
	public function do_follow($uid, $fid) {
		
		if (intval ( $uid ) <= 0 || $fid <= 0) {
			return  $this->error->tips();
		}
		if ($uid == $fid) {
			/*不能关注自己*/
			return  $this->error->tips(10);
		}
		$info = Database::get_info($this->table_1,array('id'=>$fid,'is_del'=>0,'is_hid'=>0));
		if (!$info) {
			 /*被关注的用户不存在*/
			return $this->error->tips(11);
		}
		/*验证是否存在黑名单，我是否把对方拉入黑名单*/

		/*获取双方的关注关系*/
		$follow_data = $this->get_follow_states($fid, $uid);
		
		$follow_states = $this->follow_app_state ( $uid, $fid, $follow_data);

		if ($follow_states==1) {
			
			/*添加关注*/
			$_POST = array(
				'uid' 		=> $fid,
				'fid' 		=> $uid,
				'addtime'	=> time()
			);
			$result = Database::update_data($this->table);
			/*发送通知*/
			$map_1= array(
				'uid' => $fid
			);
			
			$result = $this->notice->send_notice($map_1,'attention_message');

			/*关注人数据更新统计*/
			$map_2 = array(
				'uid' => $uid
			);
			
			M($this->table_2)->where($map_2)->setInc('attention_count',1); 
			
			/*对方粉丝数据更新统计*/
			$map_2 = array(
				'uid' => $fid
			);
			M($this->table_2)->where($map_2)->setInc('fans_count',1); 
			
			if($result){
				session('member_follow',null);
				return $this->error->tips(14);
			}else{
				return $this->error->tips(14);
			}
			
			
		}else{
			/*已关注*/
			return $this->error->tips(16);
			
			
		}		
		
	}
	
	/**
	 * 取消关注（关注用户 / 关注话题）
	 *
	 * @example 00：取消失败
	 *          01：取消成功
	 * @param integer $fid
	 *        	发起操作的用户ID
	 * @param integer $uid
	 *        	被取消关注的用户ID或
	 * @return boolean 是否取消关注成功
	 */
	public function un_follow($uid, $fid) {
		$map ['uid'] = $uid;
		$map ['fid'] = $fid;
		/*获取双方的关注关系*/
		$follow_data = $this->get_follow_states($uid, $fid);
		$follow_states = $this->follow_app_state ( $uid, $fid, $follow_data );
		if (2 == $follow_states) {
			/*再删除关注*/
			$map = array(
				'uid' 		=> $uid,
				'fid' 		=> $fid,
			);
			$result = Database::delete_data($this->table,$map);
			
			/*关注人数据更新统计*/
			$map_2 = array(
				'uid' => $fid
			);
			
			M($this->table_2)->where($map_2)->setDec('attention_count',1); 
			
			/*对方粉丝数据更新统计*/
			$map_2 = array(
				'uid' => $uid
			);
			
			M($this->table_2)->where($map_2)->setDec('fans_count',1); 
			
			
			if($result){
				session('member_follow',null);
				return $this->error->tips(18);
			}else{
				return $this->error->tips(17);
			}
			
		} else {
			/*未关注*/
			return $this->error->tips(17);
		}
	}
	
	public function get_follow_states($uid,$fid){
		
		 return Database::get_info($this->table,array('uid'=>$uid,'fid'=>$fid));
	}
	
	/*好友之间的状态  只合适APP*/
	public function follow_app_state($uid, $fids, $follow_data) {
		// ! is_array ( $fids ) && $fids = explode ( ',', $fids );
		$follow_states = 0;
		if ($follow_data) {
			$follow_states  = 2;
		} else{
			$follow_states  = 1;
		}
		if($follow_states ==0){
			$follow_states  = 1;
		}
		return $follow_states;
	}
	
	
	/*获取登入用户的关注缓存*/
	public function get_user_attention($uid){
		if(!$uid)  return array();

		
		if(!session('member_follow')){
			$list = get_result ( $this->table,array('fid'=>$uid),'uid');
			foreach($list as $k=>$v){
				$result[$k] = $v['uid'];
			}
			session('member_follow',$result);
		}else{
			$result = session('member_follow');
		}
		return $result;
	}
	
	
	
	
	
	
}