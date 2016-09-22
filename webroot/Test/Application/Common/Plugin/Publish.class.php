<?php
namespace Common\Plugin;
use Common\Org\Cache;
use Common\Org\Database;
use Common\Plugin\Lable;
use Common\Plugin\Image;
use Common\Plugin\Sql;
/*
 *	文章发布类
 * */
class Publish {
	public $config = array(	//默认配置
			'maxSize'	 => 3145728,   
			'rootPath'   => 'Uploads/', //保存根路径			
			'savePath'   => '/feed/',    
			'saveName'   => array('uniqid',''),    
			'exts'       => array('jpg', 'gif', 'png', 'jpeg'),    
			'autoSub'    => true,
			'subName'    => array('date','Ymd'),
		);
	private $table='feed';
	
	private $table_1='feed_content';
	
	private $table_2='feed_image';
	
	private $table_3='feed_rule';					/*声明列表*/
	
	private $table_4='special';					/*专题列表*/
	
	private $table_5='lable';					/*标签列表*/
	
	private $table_6='member_lable';					/*标签列表*/
	
	private $table_7='member_specia';

	
	private $table_8='member_count';					
	
	
	private $view = '';

	private $filed = true;
	
	private $limit = '';
	
	private $type = 'all';
	
	private $order = '';
	
	private $post = '';
	
	private $error = '';
	
	public function __construct() {
		
		$this->lable = new Lable();
		$this->image = new Image();
		$this->sql = new Sql();
	}
	
	/*文章发布*/
	public function post_feed(){
		$this->post = $_POST;
		$this->post['addtime'] = time();
		$Model =M($this->table);
		$Model->startTrans();
		/*feed表数据保存*/
		if($this->publish_feed_rule()){
			
			$result = self::save_feed();                    /*文章保存*/
			
			$result_1 = self::save_feed_content($result);   /*feed_content 保存*/
			
			
			$result_2 = self::save_feed_image($result);     /*feed_image 保存*/

			
			$result_3 = self::update_lable_data($this->post['feed_lable']);		/*标签统计更新*/		    
			
			$result_4 = self::update_feed_count();  /*文章数量统计*/
			
			
			$result_5 = self::update_special_data();  /*文章专题数据更新*/
			
			$result_6 = self::update_common_lable($this->post['feed_lable']);  /*常用标签更新*/
			
			$result_7 = self::update_special_lable($this->post['feed_lable']);  /*专题标签更新*/
			
			if(is_numeric($result)&&$result_1&&$result_2){
				$Model->commit();
				return true;
			}else{
				$Model->rollback();
				return false;
			}
		}else{
			return $this->error;
		}
		
	}
	
	
	/*转发*/
	public function repost_feed(){
		$this->post = I('post.');
		
		$map = array(
			'id'=>$this->post['feed_row_id'],
			'is_del' => '0',
			'is_hid' => '0'
		);
		$feed_info = Database::get_info('feed',$map);
		if(!$feed_info)  return '-1';
		$this->post['addtime'] = time();
		$this->post['is_repost'] = '1';
		$this->post['type'] = '2';
		$this->post['special_id'] = $feed_info['special_id'];
		$this->post['style'] = $feed_info['style'];
		$this->post['style'] = $feed_info['style'];
		$posts = $this->post;
		$that = $this;
		/*事务*/
		$flag = Database::trans(M($this->table),function() use ($that,$posts){
			$result_1 = self::save_feed();                    /*文章保存*/
			$result[] = $result_1;
			$result[] = self::save_feed_content($result_1);   /*feed_content 保存*/

			$result[] = self::update_lable_data($posts['feed_lable']);	/*标签统计更新*/			
			$result[] = self::update_feed_count();			/*文章数量统计*/
			
			return $result;
		});
		return $flag;
	}
	
	
	/*feed表数据保存*/
	public function save_feed(){
		$_POST = null;
		$_POST = array(
			'id' 				=> $this->post['id'],
			'uid'				=> $this->post['uid'],
			'feed_lable'		=> $this->post['feed_lable'],
			'special_id'		=> $this->post['special_id'],
			'addtime'			=> $this->post['addtime'],
			'style'				=> $this->post['style'],
			'feed_rule_id'		=> $this->post['feed_rule_id'],
			'feed_row_id'		=> $this->post['feed_row_id'],
			'copy_id'			=> $this->post['copy_id'],
			'creat_id'			=> $this->post['creat_id'],
			'is_repost'			=> $this->post['is_repost'],
			'type'				=> $this->post['type'],
		);
		return update_data($this->table);
	}
	
	/*feed_content 保存*/
	public function save_feed_content($feed_id){
		if(!is_numeric($feed_id)) return true;
		$_POST = null;
		$_POST = array(
			'feed_id'				=> $feed_id,
			'feed_content'			=> $this->post['feed_content'],
			'feed_title'			=> $this->post['feed_title'],
			'address'				=> $this->post['address']
		);
		return update_data($this->table_1);
	}
	
	/*feed_image 保存*/
	public function save_feed_image($feed_id){
		$result = $this->image->uploadImgs($this->config);
		if($result){
			foreach($result as $v){
				$_POST = array(
					'feed_id'		=> $feed_id,
					'image'		    => 'Uploads'.$v['savepath'].$v['savename'],
					'width'			=> $v['width'],
					'height'		=> $v['height'],
					'size'			=> $v['size']
				);
				$res[] = update_data($this->table_2);
			}
			return true;
		}else{
			return true;
		}
	}
	

	/*标签关联的更新*/
	public function update_lable_data($ids){
		$ids = array_filter(array_unique(explode(',',$ids)));
		if(!$ids) return 1;
		$ids = implode(',',$ids);
		return  Database::execute_sql($this->sql->update_lable_sql($ids));
	}
	
	
	/*常用标签更新*/
	public function update_common_lable($ids){
		$ids = array_filter(array_unique(explode(',',$ids)));
		if(!$ids) return 1;
		$ids = implode(',',$ids);
		$info = Database::get_info($this->table_6,array('uid'=>$this->post['uid']));

		if($info){
			$ids = $ids.','.$info['lable_id'];
			$ids =implode(',',array_unique(explode(',',$ids)));
			$data = array(
				'lable_id' => $ids
			);
			F($this->table_6,null);
			return M($this->table_6)->where(array('uid'=>$this->post['uid']))->save($data);
		}else{
			F($this->table_6,null);
			return Database::update_data($this->table_6,'','',array('uid'=>$this->post['uid']));
		}
	}
	
	/*专题数据更新*/
	
	public function update_special_data(){
		$map = array(
			'uid'       => $this->post['uid'],
			'specia_id' => $this->post['special_id']
		);
		$info = Database::get_info($this->table_7,$map);
		if($info){
			
			return M($this->table_7)->where($map)->setInc('specia_feed_count',1); 
		}else{
			$map['specia_feed_count'] = '1';
			return Database::update_data($this->table_7,'','',$map);
		}
	}
	
	
	/*专题标签数据更新*/
	
	public function update_special_lable($ids){
		$ids = array_filter(array_unique(explode(',',$ids)));
		if(!$ids) return 1;
		$map = array(
			'id' => $this->post['special_id']
		);
		$ids = implode(',',$ids);
		$info = Database::get_info($this->table_4,$map);
		if($info){
			$ids = $ids.','.$info['special_lable'];
			$ids =implode(',',array_unique(explode(',',$ids)));
			$data = array(
				'id' => $this->post['special_id'],
				'special_lable' => $ids
			);
			return Database::update_data($this->table_4,'','',$data);
		}else{
			return 1;
		}
	}
	
	
	
	/*用户文章数据更新*/
	
	public function update_feed_count(){
		$map = array(
			'uid' => $this->post['uid']
		);
		return M($this->table_8)->where($map)->setInc('feed_count',1); 
	}
	
	
	
	/*文章发布的规则验证*/
	public function publish_feed_rule(){
		/*敏感词接口*/
		
		/*数据验证*/
		
		if($this->post['feed_content']||$this->post['feed_title']||$_FILES){
			return true;
			
		}else{
			$this->error = '博文内容呢~~';
			return false;
		}
		
	}
	
	
	
	
	
	
	/*保存用户的的新标签*/
	public function lable_operate(){
		/*敏感词接口*/
		
		$post = $_POST;
	
		return $this->lable->lable_check();
		
	}
	
	
	/*常用标签返回*/
	public  function common_label($uid){
		if(!$uid) return array();
		return $this->lable->get_common_lable_info($uid);

	}
	
	
	/*发布声明返回 这个地方涉及到权限*/
	public  function publish_statement(){
		
		$result = Cache::db_table($this->table_3,array('order'=>'id desc'));
		foreach($result as $k=>$v){
			unset($result[$k]['description']);
			unset($result[$k]['is_del']);
			unset($result[$k]['is_hid']);
		}
		return $result;
		
	}
	
	
	
	/*发布专题*/
	public function publish_special(){
		$result = Cache::db_table($this->table_4);
		// $result = get_result($this->table_4,array('is_del'=>0));
		foreach($result as $k=>$v){
			unset($result[$k]['description']);
			unset($result[$k]['is_del']);
			unset($result[$k]['is_hid']);
			unset($result[$k]['talent_title']);
		}
		return $result;
	}
	
	
}