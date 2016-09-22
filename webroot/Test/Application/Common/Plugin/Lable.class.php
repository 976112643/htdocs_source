<?php
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Cache;
class Lable {
	public $table='lable';
	
	private $table_1='member_lable';					/*标签列表*/
	
	public $view = '';
		
	public $limit = '';
	
	public $filed = array('id','name');
	
	public $type = 'all';
	
	public $order = 'id desc';
	
	public $feed_lable = '';
	
	/*获取标签数据*/
	public function index($map = array()){
		
		$default_map = array(
			'is_del' => '0',
			'is_hid' => '0'
		);
		$map = array_merge($default_map,$map);
		$this->order = 'activity desc';
		$result = Database::ext_select($this->type,$this->filed,$this->table,$map,$this->order,'','',$this->limit);
	
		return $result;
	}
	
	/*
	 * 标签数据转换为用id做键值的数据
	 * return 转换后的数据
	 * */
	
	public function lable_change(){
		$result = Cache::db_table($this->table,array('order'=>'id desc'));
		foreach($result as $v){
			$list[$v['id']] = $v;
		}
		return $list;
		
	}
	
	
	/*获取常用标签缓存*/
	public function get_common_lable(){
		return  Cache::db_table($this->table_1,array('order'=>'uid desc'));
	}
	
	/*转换常用标签的键值*/
	public function get_common_lable_key($uid){
		
		$result = $this->get_common_lable();
		foreach($result as $v){
			$results[$v['uid']] = $v;
		}
		if($uid){
			return $results[$uid]['lable_id'];
		}else{
			return $results;
		}
	}
	
	/*常用标签获取数据组装*/
	public function get_common_lable_info($uid){
		$lable_string = $this->get_common_lable_key($uid);
		
		$lable_result = $this->lable_change();
		
		$list = array_filter(array_unique(explode(',',$lable_string)));
		foreach($list as $k=>$v){
			if($v){
				if($k<9){
					if($lable_result[$v]['id']){
						$lable_common[$k]['id'] = $lable_result[$v]['id'];
					$lable_common[$k]['name'] = $lable_result[$v]['name'];
					}
					
				}else{
					break;
				}
			}
			
		}
		return $lable_common;
	}
	
	
	
	/*
	 * 获取推荐标签
	 * return 转换后的数据
	 * @parm  $limit 请求条数  $filed  请求字段   $type  请求类型 是查询全部 还是翻页查询
	 * */
	public function get_recommend_lable($limit,$filed,$type,$order,$map){
		if($limit) $this->limit = $limit;
		if($filed) $this->filed = $filed;
		if($type) $this->type = $type;
		if($order) $this->order = $order;
		// $map = array(
			// 'is_recommend' => 1,
		// );
		if(I('get.keywords')){
			$keywords = trim(I('get.keywords'));
			$map['name'] = array('like','%'.$keywords.'%');
		}
		return   self::index($map);
	}
	
	
	/*标签检测 如果存在则返回不存在就保存  存入的时候需要去重复  这个地方是为APP做的接口 网站估计不适用*/
	public function lable_check(){

		$post = $_POST;
		$result = $this->lable_change();

		foreach($result as $k=>$v){
			$key = array_search($v['name'],$post);
			if(is_numeric($key)){
				$this->feed_lable .= $v['id'].',';
				unset($result[$k]);
				unset($post[$key]);
			}
			/*判断是否post数组都找到了对应的值 找到了就直接跳出循环*/
			if(!$post){
				break;
			}
		}
		if($post){
			foreach($post as $v){
				$_POST = null;$_POST = array('name'=>$v);
				$result1[] = update_data($this->table);
			}
			/*清楚缓存*/
			F($this->table,null);
			$this->feed_lable .= implode(',',$result1);
		}
		return $this->feed_lable ;
		
	}
}