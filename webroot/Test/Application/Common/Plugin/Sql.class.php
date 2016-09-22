<?php
namespace Common\Plugin;
	/**
	*	数据处理类
	*/
class Sql {	
	const PREFIX = 'sr_';
	/** 	
	*	获取用户达人专题的sql语句
	* 	@param $uid  查询的用户  
	* 	@param $key 请求的数组
	*/
	public function talent_sql($uid,$key){
		/*数组去除空*/
		$uids = implode(',',$uid);
		$sql = 'select MAX(`specia_feed_count`) as max,uid,specia_id from  `sr_member_specia`  where  `uid` IN('.$uids.')  GROUP BY `uid`' ;
		return $sql;		
	}
	
	public function get_feedback($map,$pages,$num){
		$sql="select sr_member.nickname,sr_member.id,sr_feedback.mobile,sr_feedback.content,sr_feedback.addtime from sr_member  inner join  sr_feedback on sr_member.id=sr_feedback.uid where $map limit $pages,$num";
		return $sql;
	}
	public function count_feedback($map){
		$sql="select count(sr_feedback.id) as count from sr_feedback inner join sr_member on sr_member.id=sr_feedback.uid where $map";
		return $sql;
	}
	
	/**
	* 	获取该用户的所有文章
	* 	@param $id 用户的id
	*/
	public static function get_art($id,$page,$num){
		$sql="select sr_feed.id,sr_feed.addtime,sr_feed.style,sr_feed.feed_lable,sr_feed.comment_count,sr_feed.hot_count,sr_feed_content.feed_title,sr_feed_content.feed_content,sr_feed_content.address from sr_feed inner join sr_feed_content on sr_feed.id=sr_feed_content.feed_id  where sr_feed.is_del=0 and sr_feed.is_hid=0 and sr_feed.uid='$id' order by sr_feed.addtime desc limit $page,$num ";
		return $sql;
	}

	/**
	*	获取用户个人信息
	*	@param $id 用户的id 
	*/
	public static function user_info_sql($id){
		$sql="select sr_member.id as id,sr_member.description,sr_member.nickname,sr_member.role_id as role_id,sr_member.icon,sr_member.sex,sr_member.is_recommend,sr_member.qq_open_id,sr_member.sina_open_id,sr_member.weixin_open_id,sr_member.mobile,sr_member.login_time,sr_member_count.feed_count,sr_member_count.attention_count,sr_member_count.fond_count,sr_member_count.fans_count from sr_member left join sr_member_count on sr_member_count.uid = sr_member.id left join sr_member_blacklist on sr_member.id = sr_member_blacklist.fid where sr_member.id = '$id'";
		return $sql;
	}
	/**
	*	获取单篇文章的详细信息
	*	@param $id 文章的id 
	*/
	public function get_article_detail($id){
		$sql="SELECT sr_feed.id AS id,sr_feed.style as style,sr_feed.is_hid AS is_hid,sr_feed.addtime AS addtime,sr_feed_content.feed_title AS title,sr_feed_content.feed_content as content ,sr_member.nickname AS nickname,sr_member.icon as icon FROM sr_feed INNER JOIN sr_member ON sr_member.id = sr_feed.uid INNER JOIN sr_feed_content ON sr_feed.id = sr_feed_content.feed_id	WHERE sr_feed.id=".$id."  LIMIT 0,1";
		return $sql;
	}
	/**
	 * 获取轮播图/分页
	 * @param $map 查询条件
	 * @return [type] [description]
	 */
	public function get_banner($map,$order='',$pages,$num){
		$sql="SELECT sr_feed.id,sr_feed_content.feed_id,sr_feed_content.feed_title,sr_feed_content.feed_content,sr_feed.addtime,sr_feed.status,sr_feed.comment_count,sr_feed.hot_count,sr_feed.style,sr_feed.is_hid FROM sr_feed  INNER JOIN sr_feed_content ON sr_feed.id = sr_feed_content.feed_id WHERE sr_feed.is_del = '0' $map  $order limit $pages,$num";
		return $sql;
	}
	/**
	 * 轮播图的总数
	 * @param  [type] $map 查询条件
	 */
	public function count_banner($map){
		$sql="SELECT count(sr_feed.id) as count  FROM sr_feed  INNER JOIN sr_feed_content ON sr_feed.id = sr_feed_content.feed_id WHERE sr_feed.is_del = '0' $map ";
		return $sql;
	}
	/**
	 * 轮播图的详情
	 * @param  [type] $map 查询条件
	 */
	public function get_banner_detail($map){
		$sql="SELECT sr_feed.id,sr_feed_content.feed_id,sr_feed_content.feed_title,sr_feed_content.feed_content,sr_feed.addtime,sr_feed.status,sr_feed.comment_count,sr_feed.hot_count,sr_feed.style,sr_feed.is_hid FROM sr_feed  INNER JOIN sr_feed_content ON sr_feed.id = sr_feed_content.feed_id WHERE sr_feed.is_del = '0' $map";
		return $sql;
	}
	/**/
	public function update_banner($data){
		$sql="update sr_feed_content left join sr_feed_image on sr_feed_content.feed_id=sr_feed_image.feed_id set sr_feed_content.feed_content='".$data['content']."',sr_feed_content.feed_title='".$data['title']."' ,sr_feed_image.image='".$data['imagePath']."' where sr_feed_content.feed_id='".$data['id']."'";
		return $sql;
	}
	/**
	*	获取文章列表
	*/
	public function get_article_sql($map='',$order='',$pages,$num){
		$sql="SELECT sr_feed.id AS id,sr_feed_content.feed_id as feed_id,sr_feed_content.feed_content as feed_content,sr_feed_content.feed_title AS feed_title,sr_feed.addtime AS addtime,sr_feed.status as status,sr_feed.comment_count AS comment_count,sr_feed.hot_count AS hot_count,sr_feed.style AS style,sr_member.nickname AS nickname,sr_feed.is_hid AS is_hid FROM sr_feed INNER JOIN sr_member ON sr_member.id = sr_feed.uid INNER JOIN sr_feed_content ON sr_feed.id = sr_feed_content.feed_id	WHERE sr_feed.is_del = '0' $map  $order LIMIT $pages,$num";
	
		return $sql;
	}
	/**
	*	获取文章总数
	*/
	public function count_article_sql($map){
		$sql="SELECT count(sr_feed.id) AS num
		FROM sr_feed INNER JOIN sr_member ON sr_member.id = sr_feed.uid INNER JOIN sr_feed_content ON sr_feed.id = sr_feed_content.feed_id	WHERE sr_feed.is_del = '0' $map ";
		return $sql;
	}
	
	/**
	*	获取评论列表
	*	@param $keywords 关键字搜索
	*	@param $pages 页数
	*	@param $num 每页数量
	*/
	public function get_comment_sql($map='',$pages,$num){
		$sql="select sr_comment.id as id,sr_member.nickname as nickname,sr_comment.content as content,
			sr_comment.is_audit as is_audit,sr_feed_content.feed_title AS title,sr_feed_content.feed_content as feed_content,sr_comment.addtime as addtime,sr_feed_content.feed_id as feed_id
			from sr_comment INNER JOIN  sr_member on sr_member.id=sr_comment.uid INNER JOIN sr_feed_content on sr_comment.feed_id=sr_feed_content.feed_id where  sr_comment.is_del = '0'   $map order by addtime desc limit $pages,$num";
		return $sql;
	}
	/**
	*	获取评论总数
	*	@param $keywords 关键字搜索
	*/
	public static function count_comment_sql($map=''){
		$sql="SELECT count(sr_comment.id) AS num
		from sr_comment INNER JOIN  sr_member on sr_member.id=sr_comment.uid INNER JOIN sr_feed_content on sr_comment.feed_id=sr_feed_content.feed_id where  sr_comment.is_del = '0'  $map ";
		return $sql;
	}
	/**
	*	获取相关文章下所有人评论列表
	*	@param $feed_id 文章的id 
	*/
	public function  get_comment_detail($feed_id){
		$sql="select sr_member.nickname as nickname,sr_member.icon as icon,sr_comment.content as content,sr_comment.to_uid as to_uid,sr_comment.from_uid as from_uid,sr_comment.addtime as addtime from sr_comment INNER JOIN  sr_member on sr_member.id=sr_comment.from_uid  where  sr_comment.is_del = '0' and sr_comment.feed_id=$feed_id order by addtime desc";
		return $sql;
	}
	
	

	public static function page_comment_detail($feed_id,$pages,$num){
		$sql="select sr_member.nickname as nickname,sr_member.icon as icon,sr_comment.content as content,sr_comment.to_uid as to_uid,sr_comment.from_uid as from_uid,sr_comment.addtime as addtime from sr_comment INNER JOIN  sr_member on sr_member.id=sr_comment.from_uid  where  sr_comment.is_del = '0' and sr_comment.feed_id=$feed_id order by addtime desc limit $pages,$num";
		return $sql;
	}
	/**
	*	获取举报文章的相关信息
	*/
	public function report_info_sql($map,$pages,$num){
		$sql="select sr_feed_report.feed_id as id,sr_feed_report.status as status, sr_feed_report.report_id as report_id, sr_member.nickname as nickname,sr_feed_content.feed_title as title,sr_feed_content.feed_content as feed_content,sr_feed.is_del from sr_feed_report inner join sr_member on sr_member.id=sr_feed_report.feed_uid  inner join sr_feed_content on sr_feed_content.feed_id=sr_feed_report.feed_id inner join sr_feed on sr_feed_report.feed_id=sr_feed.id  where sr_feed_report.is_del = '0'  $map limit $pages,$num";
		return $sql;
	}
	/**
	*	获取条件下举报的总数
	*	@param $map 为搜索条件。
	*/
	public function count_report_sql($map){
		$sql="select count(sr_feed_report.feed_id) AS num from sr_feed_report inner join sr_member on sr_member.id=sr_feed_report.feed_uid  inner join sr_feed_content on sr_feed_content.feed_id=sr_feed_report.feed_id where sr_feed_report.is_del = '0'  $map";
		return $sql;
	}
	
	public function specia_sort_sql($table,$post){
		$table = Self::PREFIX.$table;
		$ids = $post['fid'].','.$post['zid'];
		$sql = 'UPDATE '.$table.'
			set sort =
			( 
			CASE
				 WHEN id = '.$post['zid'].'
				 THEN ('.$post['zid_val'].')
				 WHEN id = '.$post['fid'].'
				 THEN ('.$post['fid_val'].') 
			END
			)where id in('.$ids.');';
		return $sql;
	}
	
	
	/*批量更新标签Sql语句*/
	public function update_lable_sql($ids){
		return  'update `sr_lable` set activity = activity+1 where  id in ('.$ids.');';
	}
	/*批量更新标签Sql语句*/
	public function diff_lable_sql($ids){
		return  'update `sr_lable` set activity = activity-1 where  id in ('.$ids.');';
	}
	/*批量插入粉丝*/
	public function add_follow_list($uids,$fid){
		if(empty($uids) || empty($fid))  return '';
		$table = 'member_follow';
		$time = time();
		$sql = '';
		foreach($uids as $val){
			$sql .= 'insert into sr_'.$table. '(uid,fid,addtime) value ("'.$val['id'].'","'.$fid.'","'.$time.'");';
		}
		$sql = rtrim($sql,',');
		return $sql;
	}
}