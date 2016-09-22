<?php
namespace Common\Org;
    /*
     * 缓存相关处理
     * @time 2015-08-012
     * @author    秦晓武  <525249206@qq.com>
     * */
      
class Cache {
	/*
	 * 通用数据表缓存
	 * @time 2015-08-12
	 * @param array $table 表名
	 * @param array $set 设置
	 * @return array 返回缓存
	 * @author 秦晓武  <525249206@qq.com>
	 * */
	static function db_table($table,$set = ''){
		$f = 'self::db_' . $table;
		if(is_callable($f)){
			return call_user_func_array($f,array($set));
		}
		$file = $table;
		if(is_null($set)) return F($file,NULL);
		if(F($file)) return F($file);
		if(!F($file)){
			$map =array(
				'is_del' => '0',
				'is_hid' => '0'
			);
			$order = isset($set['order']) ? $set['order'] : 'sort desc';
			$result = Database::get_result($file, $map, true, $order);
			//dump(M($file)->getLastSql());
			F($file, $result);
		}
		return F($file);
	}
	static function db_table_key($table, $set = '', $type=''){
		$f = 'self::db_' . $table;
		if(is_callable($f)){
			return call_user_func_array($f,array($set));
		}
		$file  = $table;
		if($type) $file .= '_'.$type; 
		if(is_null($set)) return F($file,NULL);
		if(F($file)) return F($file);
		if(!F($file)){
			$map['is_hid'] = 0;
			$map['is_del'] = 0;
			if(isset($set['map']) && !empty($set['map'])) {
				$map = array_merge($map, $set['map']);
			}
			$order = isset($set['order']) ? $set['order'] : 'sort desc';
			$result = Database::get_result($table, $map, true, $order);
			switch(explode('_',$type)[0]){
				case 'assoc':
					$temp = array();
					foreach($result as $v){
						$temp[$v[explode('_',$type)[1]]] = $v;
					}
					$result = $temp;
					unset($temp);
					break;
				default:
					break;
			}
			F($file, $result);
		}
		return F($file);
	}
	/*
	 * 配置缓存
	 * @time 2015-08-15
	 * @param array $set 设置
	 * @return array 返回缓存
	 * @author 秦晓武  <525249206@qq.com>
	 * */
	static function db_config($set = ''){
		$file = 'config';
		if(is_null($set)) return F($file,NULL);
		if(F($file)) return F($file);
		if(!F($file)){
			$result = M('config')->getField('name,value');
			F($file, $result);
		}
		return F($file);
	}
    /*
     * 导航缓存
     * @time 2015-08-12
     * @param array $set 设置
     * @return array 返回缓存
     * @author 秦晓武  <525249206@qq.com>
     * */
	static function db_navigation($set = ''){
		$file = 'navigation';
		if(is_null($set)) return F($file,null);
		if(F($file)) return F($file);
		$map['status'] = 1;
		$field = array(
			'id' => 'id',
			'pid' => 'pid',
			'type' => 'type',
			'target' => 'target',
			'url' => 'url',
			'sort' => 'sort',
			'title' => 'show_title',
			'active' => 'active',
			'status' => 'status',
			'cover' => 'cover'
		);
		$result = Database::get_result('navigation', $map, $field, 'sort desc' );
		F($file,$result);
		return F($file);
	}
	/**
	 * 缓存
	 * @param string 	$table		表名
	 * @param string 	$set		排序
	 * @param string 	$type		key值
	 * @param string 	$path		路径
	 * @return mixed
	 */
	static function special_cache($table = 'center', $set = '', $field = true, $type = 'assoc_id', $path = 'Center/') {
		$file = $path.$table;
		if($type) {
			$file .= '_'.$type;
		}
		if(is_null($set)) {
			return F($file, null);
		}
		if(F($file)) {
			return F($file);
		}		
		$map['status'] = 1;
		$order = isset($set['order']) ? $set['order'] : 'id desc';
		$result = Database::get_result($table, $map, $field, $order);
		switch(explode('_',$type)[0]){
			case 'assoc':
				$temp = array();
				foreach($result as $v){
					$temp[$v[explode('_',$type)[1]]] = $v;
				}
				$result = $temp;
				break;
			default:
				break;
		}
		F($file, $result);
		return F($file);
	}	
}