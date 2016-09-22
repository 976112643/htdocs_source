<?php
/*
 *	权限类
 * */
 
namespace Common\Plugin;
use Common\Org\Cache;
use Common\Org\Database;




class Purview {
	
	const table='purview';
	const table_2='feed_report';
	const table_3='feed_shield';
	
	/*
	 * 
	 * 获取文章显示的权限  推荐的文章好友推荐的文章显示 用户屏蔽的文章不显示
	 * @author Do
	 * @time 2016-05-10
	 *
	 * */
	public function feed_view_purview(){
		$uid = (I('get.fid'))?I('get.fid'):I('get.uid');
		if(!$uid) return '';
		$info = Database::get_info(self::table_3,array('uid'=>$uid));
		if($info){
			return $info['feed_ids'];
		}else{
			return '';
		}
	}
	
	
	/*
	 * 
	 * 获取文章操作的权限  删除 本人或者拥有该权限的管理员
	 * @author Do
	 * @time 2016-05-10
	 *
	 * */
	public function feed_delete_purview(){
		/*用户的uid*/
		$uid = (I('get.fid'))?I('get.fid'):I('get.uid');
		if(!$uid) return '';
		/*判断用户的id属于什么权限组*/
		$info =Database::get_info('member',array('id'=>$uid,'is_del'=>0,'is_hid'=>0));
		if($info['role_id']=='1'){
			// $member_group = Cache::db_table(self::table,array('order'=>'id desc'));
			// foreach($member_group as $k=>$v){
				// $menu_arr[] = $v ['action'];
			// }
			/*这个地方我写死的只是检测是否有删除权限可能后续需要修改 后续需要调整*/
			// $url  =  'operate_del_feed';
			// if (!in_array ( $url, $menu_arr )) {
				// return true;
			// }else{
				// return false;
				
			// }
			return true;	
		}else{
			return false;	
		}
		
	}
	
	/*
	 * 
	 * 获取文章是否有举报权限
	 * @author Do
	 * @time 2016-05-10
	 *
	 * */
	 
	 public function feed_report_purview(){
		/*用户的uid*/
		$uid = I('get.uid');
		if(!$uid) return false;
		
		$cache_name = self::table_2;
		if(!S($cache_name)){
			$result = Database::get_result(self::table_2);
			foreach($result as $k=>$v){
				$list[$v['report_id']][] = $v['feed_id'];
			}
			S($cache_name,$list,24*60*60);
		}else{
			$list = S($cache_name);
		}
		// if($list[$uid]){
			// $feed_ids = implode(',',$list[$uid]);
		// }else{
			// return false;
		// }
		return $list[$uid];
	}
	
}