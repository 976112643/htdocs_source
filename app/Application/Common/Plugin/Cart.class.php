<?php
	/*
	 * 购车插件
	 * @需求：
	 * 	  购车商品的列表、删除、生成订单
	 * 前台显示
	 * @time 2015/10/20
	 * @author llf 
	 * */
	namespace Common\Plugin;
	use Common\Org\Database;
	use Common\Org\Common;
	use Common\Org\Cache;

class Cart extends Main{
	
	const TABLE     	= 'cart';
	const MODEL         = '';
	const LIST_LIMIT    = 6;
	const URL_LIST      = 'Home/News/index';           //web端自行修改
	const URL_DETAIL    = 'Home/News/detail';          //web端自行修改
	const TYPE_NOTICE   = 6;
	
	/*
	 * 用户购物车列表
	 * @需求：
	 *		    分页显示当前用户所购车信息
	 * @time    2015/10/20
	 * @author  llf  <747060156@qq.com>
	 * @table   购物车视图
	 * request  参    数	 
		        user_id    			int     //当前用户ID
				field               array   //所要获取的字段 -- 购物车表字段
	 * response 返 回 值   
	 */

	static function cart_lists($user_id,$field = true,$status = '',$type='1'){

        
		$user_id = intval($user_id);
		if(!$user_id) return false;        /* 不存在 user_id 直接返回 false */
		$map = array(
		    'status' => ($status)?$status:array('gt',0),
			'user_id'=> $user_id,
			'type'	 => $type,
		);
		$result = Database::get_result(self::TABLE, $map,$field,'id desc'); 
		if(!$result)  return null;
		
		/* 获取服务缓存信息 */
		$service_result = Cache::db_table_key('service',array('order' =>'id desc'),'assoc_id');
		$product_result = Cache::db_table_key('product',array('order' =>'id desc'),'assoc_id');
		foreach($result as $key=>$val){
			$result[$key]['server_list'] =  json_decode($val['server_list'],true);
			if(intval($val['type'])===1){
				$goods_cahce = $service_result;
				foreach($result[$key]['server_list'] as $k=>$v){
 					$temp = explode('|',$v['t']);
					$result[$key]['server_list'][$k]['d'] = $temp[0];
					$result[$key]['server_list'][$k]['t'] = $temp[1];
					$result[$key]['server_list'][$k]['n'] = $v['n'];	
					$result[$key]['server_list'][$k]['r'] = $temp[2];						
				}
			}else{
				$goods_cahce = $product_result;
			}
			$result[$key]['goods_title'] =  $goods_cahce[$val['goods_id']]['title'];
			$result[$key]['img_path'] 	 =  $goods_cahce[$val['goods_id']]['img_path'];
			$result[$key]['price'] 	 	 =  $goods_cahce[$val['goods_id']]['price'];
			/* 所需商品信息字段直接获取 */
		}
		return $result;               

	}
	
	
	/*
	 * 删除购车中的商品(真删除)
	 * @需求：
	 *		    删除用户提交ID的购物车
	 * @time    2015/10/20
	 * @author  llf  <747060156@qq.com>
	 * request  参    数	 
		        arr_id    string     //关系ID  数组 
				user_id   int        //用户ID
	 * response 返 回 值   
	 */
	static function cart_del($arr_id,$user_id){
        
		if(!is_array($arr_id) || !$user_id)	return false;
		
		$map = array(
			'id'	 => array('in',$arr_id),
			'user_id'=> intval($user_id),
		);
		$result  = Database::delete_data(self::TABLE,$map);
		if($result){
			return true;
		}else{
			return false;
		}
	}
 
	/*
	 * 购物车生成订单信息
	 * @需求：
	 *		    购物车生成订单信息
	 *  流程分析
	 *			1、获取所有购物车状态为2的信息 
	 * @time    2015/10/20
	 * @author  llf  <747060156@qq.com>
	 * request  参    数	 
				user_id   int        //用户ID
	 * response 返 回 值  订单编号多个  一维数组
	 */
	static function cart_confirm($user_id){
		
		if(!is_array($arr_id) || !$user_id)	return false;
		
		$map = array(
			'type'   => 1,
			'status' => 2,      
			'user_id'=> intval($user_id),
		);
		$field = array(
			'id as cart_id',
			'user_id',
			'gooods_id',
			'vins_no',
			'num',
			'total',
			'server_list',
		);
		$cart_confirm  = Database::get_result(self::TABLE,$map,$fiel);
		
		if(!$cart_confirm) return false;
		
		foreach($cart_confirm as $val){
			$val['server_list'] = json_decode($val['server_list'],true);
			/* foreach(){
					//执行事务
				    //批量处理优化--预留
			} */
		}
		
		if(true){
			return true ;   /* 操作成功 */ 
		}else{
			return false ;  /* 操作失败 */ 
		}
		
	}
}