<?php

	/*
	 * 设备插件
	 * @需求：
	 * 后台可以管理新闻
	 * 前台显示
	 * @time 2015/10/14
	 * @author 朱成
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;

class Stock extends Main{
	
	const TABLE		  = 'service_stock';
	const SERVICE     = 'service';
	const LIST_LIMIT  = 4;
	const URL_LIST 	  = 'Home/News/index';
	const URL_DETAIL  = 'Home/News/detail';
	const TYPE_NOTICE = 4;
	
	/* 获取该产品当前日期后一个月的价格 库存 
	 *		需求分析
	 *			获取服务产品库存信息
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-21
	 * @操作数据 UserDeviceView[用户设备视图模型]
     * @parma    	$goods_id		     //服务ID		   
     * @parma    	$center_id   		 //服务中心ID	
	 * @return      $info or null        //服务库存价格信息
	*/
	static function get_service_stock($goods_id,$center_id =0){
		
		if(!$goods_id) return false;
		$arr_id = array();
		$product_id = str_pad($goods_id,11,'0',STR_PAD_LEFT);
		
		for($i=0;$i<30;++$i){
			$arr_id[] = date('ymd',strtotime('+'.$i.' day')).$product_id;
		}
		$map  = array(
			'center_id' => $center_id,
			'id'        => array('in',$arr_id),
		);
		$field = array(
			'id',
			'price',
			'stock',
			'sale',
		);
		$service_stock  = Database::get_result(self::TABLE,$map,$field);
		$defult_info    = get_info('service',array('status'=>array('GT',0),'id'=>$goods_id),array('id','stock','price'));
		if(!$defult_info) return false;

		/* 查询到信息 */
		$info = array();
		/* 将结果集转化成键值数组 */
		$temp = array();
		foreach($service_stock as $a=>$b){
			$temp[$b['id']] = $b;
		}
		$insert_arr_id = array();
		foreach($arr_id as $key=>$val){
			if($temp[$val]){
				$info[] = array(
					'date'  => '20'.substr($temp[$val]['id'],0,2).'-'.substr($temp[$val]['id'],2,2).'-'.substr($temp[$val]['id'],4,2),
					'price' => $temp[$val]['price'],
					'stock' => ($temp[$val]['stock']-$temp[$val]['sale']),
				); 
			}else{
				$insert_arr_id[] = $arr_id[$key]; 
				$info[] = array(
					'date' =>'20'.substr($arr_id[$key],0,2).'-'.substr($arr_id[$key],2,2).'-'.substr($arr_id[$key],4,2),
					'price'=>$defult_info['price'],
					'stock'=>$defult_info['stock'],
				); 
			}
		}
		unset($service_stock);
		unset($temp);
		/* 批量插入默认值 */
		foreach($insert_arr_id as $c=>$d){
			$_POST = array(
				'id'       =>$insert_arr_id[$c],
				'center_id'=>$center_id,
				'goods_id' =>$defult_info['id'],
				'price'    =>$defult_info['price'],
				'stock'    =>$defult_info['stock'],
				'add_time' =>date('Y-m-d H:i:s'),
			);
			add_data(self::TABLE);
		}
		unset($insert_arr_id);
		return  $info;

	}
	
	/* 更新服务库存信息 
	 *	 需求分析:
	 *			用户下单完成更新服务库存信息和服务预约人数信息
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-11-03
	 * @操作数据 sr_service_stock -- 服务库存表  sr_service --服务商品表
     * @parma    	$goods_id		 //服务ID		   
     * @parma    	$add		   	 //更新增量 
     * @parma    	$server_time	 //服务时间
     * @parma    	$center_id		 //中心ID
	 * @return      bool             //更新成功或失败
	*/
	static function update_service_stock($goods_id,$add=0,$server_time='',$center_id=0){
		
		if(!$goods_id) return false;
		if($add === 0) return false;
		if($server_time === '') $server_time = date('Y-m-d H:i:s');
		$add  	     = intval($add);
		$goods_id    = intval($goods_id);
		$center_id   = intval($center_id);
		$server_time = date('ymd',strtotime($server_time));
		$map = array(
			'center_id' =>$center_id,
			'id'        =>$server_time.str_pad($goods_id,11,'0',STR_PAD_LEFT),
		);
		
		$Model = M();
		$Model->startTrans();
		
		/* 更新库存表 */
		$StocktModel  = M(self::TABLE); 
		$stock_result = $StocktModel->where($map)->setInc('sale',$add); 
		
		/* 更新服务表 */
		$map = array(
			'status'    =>array('GT',0),
			'center_id' =>$center_id,
			'id'        =>$goods_id,
		);
		$Server_Model  = M(self::SERVICE);
		$server_result = $Server_Model->where($map)->setInc('num',$add); 
		
		if(is_numeric($stock_result) && is_numeric($server_result)){
			$Model->commit();
			return true;
		}else{
			$Model->rollback();
			return false;
		}
		
	}
	
	
	
	
} 