<?php
/*
 *	用户文章操作数据类
 *  判断用户是否操作过文章  点赞
 * */
namespace Common\Plugin;
use Common\Org\Database;

class Feed {
	
	protected $table = 'feed_hot';
	
	public function index($uid,$feed_ids){
		$uid = (I('get.fid'))?I('get.fid'):I('get.uid');
		$list = Database::get_result($this->table,array('operator_uid'=>$uid,'type'=>1),'id,feed_id,operator_uid');
		foreach($list as $v){
			$_list[$v['feed_id']] = $v;
		}
		return $_list;
	}
	
	
	public function recommend_list($uid,$feed_ids){
		$uid = (I('get.fid'))?I('get.fid'):I('get.uid');
		$list = Database::get_result($this->table,array('operator_uid'=>$uid,'type'=>3),'id,feed_id,operator_uid');
		foreach($list as $v){
			$_list[$v['feed_id']] = $v;
		}
		return $_list;
	}
	
}