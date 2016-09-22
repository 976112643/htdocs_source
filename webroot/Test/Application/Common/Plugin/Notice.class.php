<?php
/*
 *	消息通知类
 * */
namespace Common\Plugin;
use Common\Org\Database;


class Notice {
	private $table='notice_count';
	
	private $table_2='member_count';
	
	private $filed = true;
	
	private $limit = '20';
	
	private $type = 'page';
	
	private $order = '';
	
	
	/*
	 * 获取消息总数
	 * @param  $limit  用户查询条数参数	
	 * */
	public function get_notice($map=array(),$limit,$type){
		
		if($limit) $this->limit = $limit;
		if($type) $this->type = $type;
		return Database::ext_select($this->type,$this->filed,$this->table,$map,$this->order,'','',$this->limit);
	}
	
	/*清空消息*/
	public function clear_notice($map,$mark){
		if(!$map) return false;

		$data = array($mark=>0);

		return  M($this->table)->where($map)->save($data);
	}
	
	/*
	 * 消息数量更新   增加
	 * $map  查询条件  array（）
	 * $mark 更新字段
	 * $type 点赞  转载  推荐
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function send_notice($map,$mark,$type){
		if(!$map) return false;
		/*消息数加1*/
		$map_1 = array(
			'uid' => ($map['feed_uid'])?$map['feed_uid']:$map['uid']
		);
		$result = M($this->table)->where($map_1)->setInc($mark,1); 
		/*如果是点赞  那么需要对自己的账号添加一条喜欢记录*/
		if($type=='1'){
			$map_2 = array(
				'uid' => $map['uid']
			);
			M($this->table_2)->where($map_2)->setInc('fond_count',1); 
		}
		if(is_numeric($result)){
			return true;
		}
	}
	
	
	/*
	 * 消息数量更新   减少
	 * $map  查询条件  array()
	 * $type 点赞  转载  推荐
	 * @author Do
	 * @time 2016-05-04
	 * */
	
	public function send_diff_notice($map,$mark,$type){
		if(!$map) return false;
		/*这个地方处理如果表中没有uid的数据  自动添加  后期去掉*/
		/*消息数加1*/
		$map_1 = array(
			'uid' => $map['feed_uid'],
			$mark => array('gt',0)
		
		);
		$result = M($this->table)->where($map_1)->setDec($mark,1); 
		/*如果是点赞  那么需要对自己的账号添加一条喜欢记录*/
		if($type=='1'){
			$map_2 = array(
				'uid' => $map['uid'],
				'fond_count' => array('gt',0)
			);
			M($this->table_2)->where($map_2)->setDec('fond_count',1); 
		}
		if($result){
			return true;
		}
		
	}
	
	
	
}