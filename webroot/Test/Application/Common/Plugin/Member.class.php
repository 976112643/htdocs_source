<?php
/*
 *	用户关系类
 *  @author : Do
 * 
 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Cache;
use Common\Plugin\Sql;
use Common\Plugin\Data;




class Member {
	private $table='member';
	
	private $table_1='member_specia';
	
	private $view = 'MemberTalentView';

	private $filed = true;
	
	private $limit = '20';
	
	private $type = 'all';
	
	private $order = '';
	
	
	
	
	/*获取用户*/
	public function get_member_result($map=array(),$filed,$type){

		if($filed)  $this->filed = $filed ;
		if($type)  $this->type = $type ;
		if($this->type=="all") $this->limit = '';
		$result = Database::ext_select($this->type,$this->filed,$this->table,$map,'','','',$this->limit);
		foreach($result['list'] as $k=>$v){
			$result['list'][$k]['icon'] = Data::assUrl($v['icon']);
		}
		return $result;
	}
	
	
	/*转换键值*/
	public function member_key_result($filed){
		
		$result = self::get_member_result('',$filed);
		foreach($result as $v){
			if($v['icon']){
				$v['icon'] = Data::assUrl($v['icon']);
			}
			$list[$v[id]] = $v;
			
		}
		return $list;
	}
	
	
	/*达人获取 根据用户的粉丝数获取*/
	
	public function get_talent($map = array()){
		$default_map = array(
			'member.is_hid' => '0',
			'member.is_del' => '0'
		);
		$map = array_merge($default_map,$map);

		$result = Database::ext_select($this->type,$this->filed,D($this->view),$map,$this->order,'','',$this->limit);
		/*需要接入达人名称 */
		if($this->type=='all'){	
		/*判断是查询全部还是翻页查询，翻页查询不需要标注达人标签*/
			$talent_txt = $this->get_talent_info($result);
			
			foreach($result as $k=>$v){
				if($v['icon']){
						$result[$k]['icon'] = Data::assUrl($v['icon']);
				}
				$result[$k]['talent_txt'] = $talent_txt[$v['id']];
			}
		}else{
			foreach($result['list'] as $k=>$v){
				if($v['icon']){
					$result['list'][$k]['icon'] = Data::assUrl($v['icon']);
				}
			}
		}
		return $result;
	}
	
	/*获取推荐达人*/
	
	public function get_recommend_talent($limit,$filed,$type,$order,$map){
		if($limit) $this->limit = $limit;
		if($filed) $this->filed = $filed;
		if($type) $this->type = $type;
		if($type) $this->order = $order;
		if(I('get.uid')){
			if(!$map['member.id']){
				$map['member.id'] = array('neq',I('get.uid'));
			}
		}
		if(I('get.keywords')){
			$keywords = trim(I('get.keywords'));
			$map['member.nickname'] = array('like','%'.$keywords.'%');
		}
		return  self::get_talent($map);
		
		

	
	}
	
	/*获取达人标识 考虑直接用缓存*/
	
	public function get_talent_mark(){
		$map = array(
			'is_hid' => '0',
			'is_del' => '0'
		);
		return Database::get_result('special',$map);
	}
	
	/*达人文字转换*/
	public function key_specia(){
		$result = $this->get_talent_mark();
		foreach($result as $v){
			$list[$v['id']] = $v['talent_title'];
		}
		return $list;
	}
	
	
	/*专题键值转换*/
	public function key_special_list(){
		$result = $this->get_talent_mark();
		foreach($result as $v){
			$list[$v['id']] = $v;
		}
		return $list;
	}
	
	
	/*获取达人专题标示*/
	public function get_talent_info($result){
		foreach($result as $v){						/*获取达人的用户id*/
			$ids[] = $v['id'];
		}
		$sql = Sql::talent_sql($ids);
		$talent_max = Database::query_sql($sql);
		/*获取标签*/
		$key_speci = $this->key_specia();
		
		foreach($talent_max as $v){
			$talent_max_list[$v['uid']] =$key_speci[$v['specia_id']];
		}
		return $talent_max_list;
	}
	
	
	
	/*获取用户所有的专题标示*/
	
	public function get_member_special(){
		$result =  Cache::db_table($this->table_1,array('order'=>'uid desc'));
		$list = $this->key_special_list();

		foreach($result as $key=>$v){
			$result_list[$v['uid']]['special_text'][] = $list[$v['specia_id']]['title'];
		}
		return $result_list;
	}
	
	
	
	
	/*获取单个人的信息*/
	public function get_member_info($id){

		$info = get_info('member',array('id'=>$id));
		if($info['icon']){
			$info['icon'] = Data::assUrl($info['icon']);
		}
		return $info;
	}
	
	
	
	
	
	
}