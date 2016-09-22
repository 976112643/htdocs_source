<?php
namespace Common\Plugin;
use Common\Org\Database;
use Common\Plugin\Lable;
use Common\Plugin\Member;
use Common\Plugin\Feed;
use Common\Plugin\Follow;
use Common\Plugin\Purview;
class Find {
	protected $table='feed';
	protected $table_1='feed_hot';
	protected $table_2='comment';
	protected $table_3='feed_image';
	protected $table_4='feed_content';
	
	protected $view = 'FeedView';
	
	protected $view_1 = 'FeedHotView';			/*文章热度视图*/
	
	protected $view_2 = 'FeedCommentView';			/*文章评论视图*/
	
	protected $filed = true;
		
	protected $limit = '20';
	
	private $type = 'page';
	
	private $order = 'addtime desc';
	
	protected $member_result = array();			/*用户的数组集合*/
	
	protected $feed_result = array();			/*文章集合*/
	protected $ids = array();			
	protected $pids = array();
	protected $feed_ids = array();				/*文章id */	
	protected $feed_images = array();				/*文章图片 */	
	
	
	public function __construct() {
		
		$this->lable = new Lable();
		$this->member = new Member();
		$this->feed = new Feed();
		$this->follow = new Follow();
	}
	
	/*
	 * 获取首页数据 用户必须是登录状态，才可以查看
	 * @parm $client 判断客户端是否登录默认是未登录  传入true 表示登录
	 *		 $map 查询条件 默认查询条件为空数组
	 * return array 查询的结果集
	 * 
	 * @author Do
	 * @time  2016-4-18
	 * */
	
	public function find($map = array(),$type,$limit){
		if($type)  $this->type = $type;
		if($limit)  $this->limit = $limit;
		/*默认查询条件*/
		$default_map = array(
			'feed.is_del' => '0',
			'feed.is_hid' => '0'
		);
		/*合并查询条件*/
		$map = array_merge($default_map,$map);
		/*查询结果*/
		$result = Database::ext_select($this->type,true,D($this->view),$map,$this->order,'','',$this->limit);
		/*获取标签标题*/
		$lable = $this->lable->lable_change();
		/*获取人员数据信息*/
		self::get_member_info();
		$result['list'] = self::data_deal($result['list'],$lable);
		/*获取标签对应的中文名称*/
		return $result;
	}
	
	/*获取单条文章  主要用于被转载的*/
	public function get_info_feed($feed_id,$creat_id){
		if(!$feed_id) return array();
		$map = array('feed.id'=>$feed_id);
		$info = Database::ext_select('row',true,D($this->view),$map);
		$image_result = Database::ext_select('all','image,height,width','feed_image',array('feed_id'=>$creat_id));
		$image_result = ($image_result)?$image_result:array();
		$return_info['content'] = array(
			'feed_content'  => $info['feed_content'],
			'feed_title'	=> $info['feed_title'],
			'feed_id'		=> $info['feed_id'],
			'feed_uid'		=> $info['uid'],
			
		);
		foreach($image_result as $k=>$v){
			$image_result[$k]['image'] = DOMAIN_PATH.__ROOT__.'/'.$v['image'];
		}
		$return_info['image']= $image_result;
		return $return_info;
		
	}
	
	/*数据处理*/
	public function data_deal($list,$lable){
		
		$_list = $this->feed->index();
		$recommend_list = $this->feed->recommend_list();
		/*用户是否是管理员级别*/
		$is_delete_role = (I('get.uid'))?Purview::feed_delete_purview():false;
		/*举报*/
		$is_report_list = (I('get.uid'))?Purview::feed_report_purview():array();
		foreach ( $list as $k=>$v){
			/*当前用户是否点赞*/
			$list[$k]['is_like'] = ($_list[$v['feed_id']])?'1':'0';
			$list[$k]['is_recom'] = ($recommend_list[$v['feed_id']])?'1':'0';
			if($this->limit!='1'){
				$list[$k]['feed_content'] = msubstr_tag($v['feed_content'],300);
			}
			
			/*发布文章的姓名*/
			
			$list[$k]['uname'] = self::get_copy($v['uid']);
			$temp = explode(',',$v['feed_lable']);
			/*是不是转载 获取被转载人昵称*/
			if($v['is_repost']=='1'){
				$creat_id = $v['feed_row_id'];
				$feed_info = self::get_info_feed($v['feed_row_id'],$creat_id);
				$list[$k]['repost'] = self::get_copy($v['copy_id']);
				$list[$k]['repost_feed'] =$feed_info['content'] ;
			}
			/*是否有原创*/
			if($v['creat_id']){
				
				$list[$k]['create_name'] = self::get_copy($v['creat_id']);
				
			}
			
			/*是不是推荐 获取推荐人昵称*/
			if($v['is_recommend']=='1'){
				$list[$k]['recommend'] = self::get_recommend($v['recommend_id']);
			}
			/*是否关注*/
			
			$uid = (I('get.fid'))?I('get.fid'):I('get.uid');
			if($uid){
				if(in_array($v['uid'],$this->follow->get_user_attention($uid))){
					$list[$k]['follow_states'] = 2;
				}else{
					$list[$k]['follow_states'] = 1;
				}
			}
			
			
			/*是否有删除权限*/
			if(I('get.fid')&&I('get.uid')){
				$list[$k]['is_delete'] = (I('get.fid')==$v['uid']||$is_delete_role)?'1':'0';
			}else{
				$list[$k]['is_delete'] = (I('get.uid')==$v['uid']||$is_delete_role)?'1':'0';
			}
			
			
			/*是否已经举报*/
			$list[$k]['is_report'] = (in_array($v['feed_id'],$is_report_list))?'1':'0';
			
			/*判断是否为图文*/
			if($v['style']=='2'){   
				$map['feed_id'] = $v['feed_id'];
				if($v['is_repost']!='1'){
					$list[$k]['image_path'] = self::get_feed_img($map);
				}else{
					$list[$k]['image_path'] =$feed_info['image'];
				}
				
			}else{
				$list[$k]['image_path'] = array();
			}
			/*判断是否有标签*/
			if($v['feed_lable']){
				foreach($temp as $vv){
					if($lable[$vv]['name']){
						$list[$k]['lable_arr'][] = $lable[$vv]['name'];
					}
				}
			}else{
					$list[$k]['lable_arr'] = array();
			}
			/*判断是否有评论*/
			if($v['comment_count']>0){
				$map = array(
					'feed_id'=>$v['id'],
					'is_del' => 0,
					'is_hid' => 0
				);
				$result = self::get_index_comment($map,'page','4');
				$list[$k]['feed_comment'] = ($result['list'])?$result['list']:array();
			}

		}
		return $list;
	}
	
	/*
	 *	判断文章是否有好友推荐,获取该文章最新的推荐人，获取发表文章的推荐人
	 */
	
	public function get_recommend($id){
		if(!id) return false;
		return $this->member_result[$id];
	}
	
	/*
	 *	判断文章是否为转载，如果转载就将转载人id标示
	 */
	public function get_copy($id){
		return $this->member_result[$id];
	}
	
	/*获取用户名 只返回用户昵称 头像  id*/
	
	public function get_member_info(){
		$filed = array('id','nickname','icon');
		$this->member_result= $this->member->member_key_result($filed);
	}
	
	
	/*获取文章的热度记录信息*/
	
	public function get_hot($map,$table_name="table",$order){
		if(!$map) return false;
		
		/*判断热度查询的方式，如果只是对自己文章查询那么就用table_1*/
		
		$table = ($table_name=="table")?$this->table_1:D($this->view_1);
		
		if($order) $this->order = $order;
		
		/*获取人员数据信息*/
		
		if(!$this->member_result) self::get_member_info();
		$result = Database::ext_select($this->type,$this->filed,$table,$map,$this->order,'','',$this->limit);
		
		foreach($result['list'] as $k=>$v){
			$this->feed_ids[] = $v['feed_id'];
		}
		$ids = implode(',',$this->feed_ids);
		$image_map = array(
			'feed_id' => array('in',$ids),
		);
		$feed_images = Database::get_result($this->table_3,$image_map);

		foreach($feed_images as $v){
			$this->feed_images[$v['feed_id']] = DOMAIN_PATH.__ROOT__.'/'.$v['image'];
		}
		foreach($result['list'] as $k=>$v){
			$result['list'][$k]['uid_name']=($v['uid'])?$this->member_result[$v['uid']]['nickname']:'';
			$result['list'][$k]['icon']=($v['operator_uid'])?$this->member_result[$v['operator_uid']]['icon']:'';
			$result['list'][$k]['type_name']=($v['type'])?$this->get_type($v['type']):'';
			$result['list'][$k]['operator_name'] = ($v['operator_uid'])?$this->member_result[$v['operator_uid']]['nickname']:'';
			$result['list'][$k]['from_name'] = ($v['from_uid'])?$this->member_result[$v['from_uid']]['nickname']:'';
			$result['list'][$k]['create_name'] = ($v['create_uid'])?$this->member_result[$v['create_uid']]['nickname']:'';
			$result['list'][$k]['feed_image'] = ($this->feed_images[$v['feed_id']])?$this->feed_images[$v['feed_id']]:'';
		}
		return $result;
	}
	
	
	/*获取评论首页的评论  没有层级显示*/
	public function get_index_comment($map,$type,$limit){
		if(!$map) return false;
		if($limit) $this->limit = $limit;
		if($type) $this->type = $type;
		/*获取人员数据信息*/
		if(!$this->member_result) self::get_member_info();
		
		$result = Database::ext_select($this->type,$this->filed,$this->table_2,$map,$this->order,'','',$this->limit);
		
		foreach($result['list'] as $k=>$v){
			if($v['to_uid']) $result['list'][$k]['to_uid_name'] = $this->member_result[$v['to_uid']]['nickname'];
			$result['list'][$k]['icon']=$this->member_result[$v['from_uid']]['icon'];
			if($v['from_uid']) $result['list'][$k]['from_uid_name'] = $this->member_result[$v['from_uid']]['nickname'];
		}
	
		return $result;
	}
	
	
	/*获取评论页面的评论*/
	
	public function get_comment($map,$type,$limit){
		if(!$map) return false;
		if($limit) $this->limit = $limit;
		if($type) $this->type = $type;
		/*获取人员数据信息*/
		if(!$this->member_result) self::get_member_info();
		$list_id = get_result($this->table_2,$map);

		foreach($list_id as $v){
			$this->ids[]=$v['id'];
			$this->feed_ids[] = $v['feed_id'];
			if($v['pid']>0){
				$this->pids[]=$v['pid'];
			}
			
		}
		/*获取文章图片*/
		$this->feed_ids = implode(',',array_unique($this->feed_ids)); 
		$map_image = array(
			'feed_id'=>array('in',$this->feed_ids)
		);
		$image_list = Database::get_result($this->table_3,$map_image);
		foreach($image_list as $v){
			$this->feed_images[$v['feed_id']] = DOMAIN_PATH.__ROOT__.'/'.$v['image'];
		}
		/*数组去重复*/
		$this->pids = array_unique($this->pids);
		$this->ids = array_merge($this->ids,$this->pids);
		$this->ids = array_unique($this->ids);
	
		$pids = implode(',',$this->pids);
		$ids = implode(',',$this->ids);
		if($list_id){
			if($this->pids){
				$map_1['_string'] = "id IN({$ids})  OR  pid IN({$pids}) OR  pid IN({$ids})";
			}else{
				$map_1['id']	= array('in',$ids);
				
			}
		}else{
			$map_1['uid']	= $map['uid'];
		}
		$map_1['is_del'] = 0;
		$map_1['is_hid'] = 0;
		$result = Database::ext_select($this->type,$this->filed,$this->table_2,$map_1,$this->order,'','',$this->limit);
		foreach($result['list'] as $k=>$v){
			if($v['uid']) $result['list'][$k]['uid_name'] = $this->member_result[$v['uid']]['nickname'];
			$result['list'][$k]['icon']=$this->member_result[$v['from_uid']]['icon'];
			if($v['to_uid']) $result['list'][$k]['to_uid_name'] = $this->member_result[$v['to_uid']]['nickname'];
			if($v['from_uid']) $result['list'][$k]['from_uid_name'] = $this->member_result[$v['from_uid']]['nickname'];
			$feed_ids[$v['feed_id']] = $v['feed_id'];
		}
		/*获取评论对应文章*/
		self::get_content($feed_ids);
		$result['list'] = $this->deal_comment_data($result['list']);

		return $result;
	}
	
	
	
	/*获取文章*/
	public function get_content($feed_ids = array()){
		if(!$feed_ids) return ;
		$ids = implode(',',$feed_ids);
		$map = array(
			'feed_id' => array('in',$ids),
			'is_del' => 0,
		);
		$feed_content = Database::get_result($this->table_4,$map);
		foreach($feed_content as $key => $v){
			$feed_contents[$v['feed_id']] = $v;
		}
		$this->feed_result = $feed_contents;
	}
	
	
	/*评论数据处理*/
	public function deal_comment_data($list,$pid=0){
		if(!$list)  return array();
		$comment_data  = list_to_tree($list, $pk = 'id', $pid = 'pid', $child = '_child');

		foreach($comment_data as $k=>$v){
			// if($this->feed_result[$v['feed_id']]){
				$comment_data[$k]['list'] = tree_to_list($v['_child']);
				$comment_data[$k]['feed_title'] = ($this->feed_result[$v['feed_id']]['feed_title'])?$this->feed_result[$v['feed_id']]['feed_title']:'';
				$comment_data[$k]['feed_content'] = ($this->feed_result[$v['feed_id']]['feed_content'])?$this->feed_result[$v['feed_id']]['feed_content']:'';
				$comment_data[$k]['feed_image'] = ($this->feed_images[$v['feed_id']])?$this->feed_images[$v['feed_id']]:'';
				unset($comment_data[$k]['_child']);
			// }else{
				// unset($comment_data[$k]);
			// }
			
		}
		return $comment_data;
	}
	
	
	
	public function get_type($key){
		$result =  array(
			'1' => '喜欢',
			'2' => '转载',
			'3' => '推荐',
		);
		if($key){
			return $result[$key];
		}else{
			return $result;
		}
	}
	
	
	
	/*获取图片*/
	public function get_feed_img($map){
		$this->type = 'all';
		$result =  Database::ext_select($this->type,'image,width,height',$this->table_3,$map);
		foreach($result as $k=>$v){
			$result[$k]['image'] = DOMAIN_PATH.__ROOT__.'/'.$v['image'];
		}
		$result = ($result)?$result:array();
		return $result;
	}
	
	
	
	
	
}