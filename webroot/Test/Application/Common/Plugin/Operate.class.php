<?php
/*
 *	文章操作类
 * */
 
namespace Common\Plugin;
use Common\Org\Cache;
use Common\Org\Database;
use Common\Plugin\Notice;
use Common\Plugin\Error;
use Common\Plugin\Sql;



class Operate {
	
	private $table='feed';							/*文章表*/
	
	private $table_1='feed_hot';				    /*文章热度表*/
	
	private $table_2='feed_report';				    /*举报文章表*/
	
	private $table_3='feed_shield';				    /*屏蔽文章表*/
	
	private $table_4='comment';				    /*屏蔽文章表*/
	
	
	
	
	public function __construct() {
		$this->notice = new Notice();
		$this->error = new Error();
		$this->sql = new Sql();
	}
	
	/*
	 * 点赞
	 * 需要的表  feed  feed_hot 
	 * 需要发送消息
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function operate_add_diagg($map){

		/*查看用户是否对文章已经赞过*/
		$post = $_POST;
		$info = Database::get_info($this->table_1,$map);

		if($info){
			$tips =$this->error->tips(4);
			
		}else{
			/*查询文章信息*/
			$feed_info = Database::get_info($this->table,array('id'=>$map['feed_id']),'id,uid,hot_count');
			/*文章的数据*/
			$result = $this->operate_feed($feed_info);
			/*文章的热度数据*/
			$result_1 = $this->operate_feed_hot($post,$feed_info);
			/*发送通知*/
			$map = array(
				'feed_uid'      => $feed_info['uid'],
				'uid' 			=> $post['operator_uid'],
			); 
			$result_2 = $this->notice->send_notice($map,'like_message','1');
			
			if(is_numeric($result)&&is_numeric($result_1)){
				$tips =$this->error->tips(3);
			}else{
				$tips =$this->error->tips(2);
			}
			
		}
		return $tips;
		
		
		
	}
	
	/*
	 * 取消点赞
	 * 需要的表  feed  feed_hot 
	 * 需要发送消息
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_cancel_diagg($map){
		$post = $_POST;
		$info = Database::get_info($this->table_1,$map);

		if(!$info){
			$tips =$this->error->tips(1);

		}else{
			/*查询文章信息*/
			
			$feed_info = Database::get_info($this->table,array('id'=>$map['feed_id']),'id,uid,hot_count');
			
			/*文章的数据*/
			$hot_count = $feed_info['hot_count']-1;
			if($hot_count<0){
				$hot_count = 0;
			}
			$posts = array(
				'id'        => $feed_info['id'],
				'hot_count' => $hot_count,
			);
			$result = $this->operate_diff_feed($posts);
			
			/*文章的热度数据*/
			$map = null;
			$map = array(
				'uid'             => $feed_info['uid'],
				'feed_id'         => $post['feed_id'],
				'operator_uid'    => $post['operator_uid'],
				'type'            => 1,						/*点赞*/
			);
			$result_1 = $this->operate_diff_feed_hot($map);
			
			/*发送通知*/
			
			$map = array(
				'feed_uid'      => $feed_info['uid'],
				'uid' 			=> $post['operator_uid'],
			); 
			$result_2 = $this->notice->send_diff_notice($map,'like_message','1');
			
			/*结果返回*/
			if(is_numeric($result)&&$result_1){
				$tips =$this->error->tips(3);

			}else{
				$tips =$this->error->tips(2);
			
			}
			
		}
		return $tips;
	}
	
	
	/*
	 * 推荐
	 * 需要的表  feed  feed_hot 
	 * 需要发送消息
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_add_recommend($map){
		/*查看用户是否对文章已经推荐*/
		$post = $_POST;
		$info = Database::get_info($this->table_1,$map);

		if($info){
			
			$tips =$this->error->tips(5);
			
		}else{
			/*查询文章信息*/
			$feed_info = Database::get_info($this->table,array('id'=>$map['feed_id']),'id,uid,hot_count');
			/*文章的数据*/
			$posts = array(
				'is_recommend'   => '1',
				'recommend_time' => time(),
				'recommend_id'	 => $post['operator_uid'],
			);
			$result = $this->operate_feed($feed_info,$posts);
			
			/*文章的热度数据*/
			$result_1 = $this->operate_feed_hot($post,$feed_info,3);
			
			/*发送通知*/
			$map = array(
				'feed_uid'      => $feed_info['uid'],
				'uid' 			=> $post['operator_uid'],		
			); 
			$result_2 = $this->notice->send_notice($map,'other_message','3');
			
			if(is_numeric($result)&&is_numeric($result_1)){
				$tips =$this->error->tips(3);
			}else{
				$tips =$this->error->tips(2);
			}
			
		}
		return $tips;
	}
	
	/*
	 * 取消推荐
	 * 需要的表  feed  feed_hot 
	 * 需要发送消息
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_cancel_recommend($map){
		$post = $_POST;
		$info = Database::get_info($this->table_1,$map);

		if(!$info){
			$tips =$this->error->tips(1);

		}else{
			/*查询文章信息*/
			
			$feed_info = Database::get_info($this->table,array('id'=>$map['feed_id']),'id,uid,hot_count');
			$hot_count = $feed_info['hot_count']-1;
			if($hot_count<0){
				$hot_count = 0;
			}
			/*文章的数据*/
			$posts = array(
				'id'             => $feed_info['id'],
				'hot_count'      =>	$hot_count,
				'is_recommend'	 => '0',
				'recommend_id'	 => '0'
			);
			$result = $this->operate_diff_feed($posts);
			
			/*文章的热度数据*/
			$map = null;
			$map = array(
				'uid'             => $feed_info['uid'],
				'feed_id'         => $post['feed_id'],
				'operator_uid'    => $post['operator_uid'],
				'type'            => 3,						
			);
			$result_1 = $this->operate_diff_feed_hot($map);
			// $flag = Database::trans(M($this->table),function() use ($this,$posts,$map){
				// $result[] = $this->operate_diff_feed($posts);
				// $result[] = $this->operate_diff_feed_hot($map);
				// $result[] = $this->notice->send_notice($map,'other_message','3');
				// $result[] = 'ss';
				// return $result;
			// });
			// dump($flag);exit;
			
			
			/*结果返回*/
			if(is_numeric($result)&&$result_1){
				$tips =$this->error->tips(3);

			}else{
				$tips =$this->error->tips(2);
			
			}
			
		}
		return $tips;
	}
	
	
	
	
	/*操作热度表 减少*/
	public function operate_diff_feed_hot($post,$feed_info){
		
		return Database::delete_data($this->table_1,$map);
		
	}
	/*操作文章表 减少*/
	public function operate_diff_feed($post){
		
		return Database::update_data($this->table,'','',$post);
	}
	
	
	/*操作热度表 增加*/
	public function operate_feed_hot($post,$feed_info,$type="1"){
		$_POST = array(
			'uid'             => $feed_info['uid'],
			'feed_id'         => $post['feed_id'],
			'operator_uid'    => $post['operator_uid'],
			'type'            => $type,						
			'addtime'         => time(),
		);
		
		return Database::update_data($this->table_1);
		
	}
	
	/*操作文章表 增加*/
	public function operate_feed($feed_info,$post= array()){
		$_POST = array(
			'id'        => $feed_info['id'],
			'hot_count' => $feed_info['hot_count']+1,
		);
		$_POST = array_merge($_POST,$post);
		return Database::update_data($this->table);
	}
	
	
	/*
	 * 删除文章
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function  operate_del_feed($info){
		$data = array(
			'is_del' => '1'
		);
		$that = $this;
		$posts = $_POST;
		/*事务*/
		$flag = Database::trans(M('feed'),function() use ($that,$posts,$info,$data){
			$map = array(
				'id'=>$posts['feed_id']
			);
			/*删除文章*/
			$result[] =  M('feed')->where($map)->save($data);
			
			$map_1 = array(
				'feed_id' => $posts['feed_id']
			);
			/*删除文章内容*/
			$result[] =  M('feed_content')->where($map_1)->save($data);
			$map_2 = array('uid'=>$posts['uid']);
			
			$infos = Database::get_info('member_count',$map_2);
			
			/*用户文章数量减一*/
			
			if($infos['feed_count']>0){
				$result[] = M('member_count')->where($map_2)->setDec('feed_count',1); 
			}
			/*标签数量减一*/
			$result[] = self::update_lable_data($info['feed_lable']);
			return $result;
		});
		return $flag;
		
	}
	
	/*标签关联的更新*/
	public function update_lable_data($ids){
		$ids = array_filter(array_unique(explode(',',$ids)));
		if(!$ids) return 1;
		$ids = implode(',',$ids);
		return  Database::execute_sql(Sql::diff_lable_sql($ids));
	}
	
	/*
	 * 举报文章shield
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_report(){
		$post = I('post.');
		$map = array(
			'id' => $post['feed_id'],
			'uid' => $post['feed_uid']
		);
		
		/*文章是否已经举报*/
		$report_info = Database::get_info('feed_report',array('feed_id'=>$post['feed_id'],'report_id'=>$post['uid']));
		
		if($report_info){
			return $this->error->tips(27);
		}
		
		
		$info = Database::get_info($this->table,$map);
		
		
		if(!$info){
			return $this->error->tips(23);
		}else{
			$_POST['report_id'] = $post['uid'];
			$result = Database::update_data($this->table_2);
			if(is_numeric($result)){
				S('feed_report',null);
				return $this->error->tips(3);
			}else{
				return $this->tips->tips(2);
			}
		}
		
	}
	
	/*
	 * 屏蔽文章
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function operate_shield(){
		$post = I('post.');
		$map = array(
			'uid' => $post['uid'],
		);
		
		$info = Database::get_info($this->table_3,$map);
		if(!$info){
			$result = Database::update_data($this->table_3,'','',$map);
			if(is_numeric($result)){
				return $this->error->tips(24);
			}
			
		}else{
			/*文章是否已经屏蔽*/
			$feed_shield = ','.$post['feed_id'];

			$return =  strpos($info['feed_ids'],$feed_shield);

			if($return){
				return $this->error->tips(34);
			}
			$data = array(
				'feed_ids' => $info['feed_ids'].','.$post['feed_id']
			);
			$result = M($this->table_3)->where($map)->save($data);
			
			if(is_numeric($result)){
				return $this->error->tips(3);
			}else{
				return $this->tips->tips(2);
			}
		}
	}
	
	
	/*
	 * 删除文章的评论， 用户自己的评论可以删除， 用户文章的评论可以删除
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function delete_comment(){
		
		$post = $_POST;
		
		/*查询文章 是否存在*/
		$map = array(
			'id'        =>$post['feed_id'],
			'uid'		=>$post['feed_uid'],
			'is_del'    => 0,
			'is_hid'	=> 0,
		);
		$data = array(
			'is_del' => 1
		);
		$feed_info = Database::get_info($this->table,$map);
		if(!$feed_info){
			return $this->error->tips(23);
		}
		/*查询删除的评论是否存在*/
		$map_1 = array(
			'id' => $post['comment_id']
		);
		$comment_info = Database::get_info($this->table_4,$map_1);
		/*如果不存在直接返回*/
		if(!$comment_info){
			return $this->error->tips(28);
		}
		/*删除文章的用户是发表该文章的用户*/
		if($post['uid']==$feed_info['uid']){
			/*删除id 为评论id的评论*/
			if($comment_info['pid']>0){
				$map_2 = array(
					'id' => $post['comment_id']
				);
			}else{
				$map_2 = array(
					'id|pid' => $post['comment_id']
				);
			}
			$result =  M($this->table_4)->where($map_2)->save($data);
			
		}else{
			/*如果不是文章发表的用户 只是删除自己的评论*/
			if($post['uid']!=$comment_info['from_uid']){
				return $this->error->tips(29);
			}else{
				$map_2 = array(
					'id' => $post['comment_id']
				);
				$result =  M($this->table_4)->where($map_2)->save($data);
			}
		}
		/*文章评论数减少*/
		if($feed_info['comment_count']>0){
			$map_3 = array(
				'id'=>$post['feed_id']
			);
			$result[] = M($this->table)->where($map_3)->setDec('comment_count',1); 
		}
		
		if(is_numeric($result)){
			return $this->error->tips(30);
		}else{
			return $this->error->tips(2);
		}
	}
	
	/*分享到尚软说*/
	public function operate_share(){
		return $this->error->tips(35);
	}
}