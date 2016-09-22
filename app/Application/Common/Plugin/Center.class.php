<?php
	/*
	 * 服务中心相关插件
	 * @需求：
	 * 	  服务中心列表、查询、搜索
	 * 前台显示
	 * @time 2015/10/20
	 * @author llf 
	 * */
	namespace Common\Plugin;
	use Common\Org\Database;
	use Common\Org\Common;
	use Common\Org\Cache;

class Center extends Main{
	
	const TABLE     	= 'center';
	const MODEL         = '';
	const LIST_LIMIT    = 6;
	const URL_LIST      = 'Home/News/index';           //web端自行修改
	const URL_DETAIL    = 'Home/News/detail';          //web端自行修改
	const TYPE_NOTICE   = 6;
	
	
	
	
	/*
	 * 服务中心搜索列表
	 * @需求：
	 *		    显示当前用户所关联的设备信息
	 * @time    2015/10/20
	 * @author  llf  <747060156@qq.com>
	 * request  参    数	 
		        user_id    			int     //当前用户ID
				field               array   //模型字段获取设置 (模型加字段)
				
	 * response 返 回 值   
	*/
	static function center_lists($user_id,$field = true){
        
		$user_id = intval($user_id);
		if(!$user_id) return false;     /* 不存在 user_id 直接返回 -1 */
		$map = array(
		    'device_relation.status' => 1,
			'device_relation.user_id'=> $user_id,
			'device.status'          => 1,
		);
		$result = Database::page(D(self::MODEL), $map, 'level',$field);

		/* 获取设备号等信息 */ 
		return $result;               
	}
	/* 服务中心添加 */
	static function center_add($relation_id){
	}
	/*
	* @author  llf<747060156>
	*/	
	static function center_search_point($addres_str,$r=0,$path=false){
		// echo $r;
		$point =  self::get_address_point($addres_str);
		if($point){
			/* 查询数据库 */
			$map = array('status'=>1);
			$map['lng'] = array('between',array(bcsub((float)$point['lng'],$r,8),bcadd((float)$point['lng'],$r,8)));
			$map['lat'] = array('between',array(bcsub($point['lat'],$r,8),bcadd((float)$point['lat'],$r,8)));
			if($path){
				$path  = explode('-',$path);
                $count = count($path);
				switch($count){
					case 0://省
						$map['province'] = intval($path[0]);
						break;
					case 1://市
						$map['city'] 	 = intval($path[1]);
						break;
/* 					case 2://区
						$map['area']	 = intval($path[2]);
						break; */
				}
			}
			$field = array(
				'title',
				'id',
				'lng',
				'lat'
			);
			$center_info = Database::get_result(self::TABLE,$map,$field);
			// dump(M()->getLastSql());
			foreach($center_info as $k=>$v){
				$center_info[$k]['point'] = $v['lng'].','.$v['lat'];
			}
			
			/**
			   查询数据过滤 将正方形区域过滤成圆形区域
			**/
			return $center_info;
		}else{
			return $point;
		}
	}
	
	/*
	 * 服务中心搜索
	 * @需求：
	 *		    显示当前用户所关联的设备信息
	 * @time    2015/10/20
	 * @author  llf  <747060156@qq.com>
	 * request  参    数	 
		        $r    			int     当前用户传输的距离默认为0公里
				field           array   //模型字段获取设置 (模型加字段)
				
	 * response 返 回 值   
	*/
	static function center_search_points($addres_str,$r=0,$path=false){
		$point =  self::get_address_point($addres_str);
		if($point){
			$center_point=self::returnSquarePoint($point['lng'], $point['lat'],$r);
			$map = array(
				'lat'=>array('between',array($center_point['right-bottom']['lat'],$center_point['left-top']['lat'])),
				'lng'=>array('between',array($center_point['left-top']['lng'],$center_point['right-bottom']['lng'])),
				'status' => 1
			);
			if($path){
				$path  = explode('-',$path);
                $count = count($path);
				switch($count){
					case 0://省
						$map['province'] = intval($path[0]);
						break;
					case 1://市
						$map['city'] 	 = intval($path[1]);
						break;
/* 					case 2://区
						$map['area']	 = intval($path[2]);
						break; */
				}
			}
			$field = array(
				'title',
				'id',
				'lng',
				'lat',
				'province',
				'city',
				'area',
				'mobile',
				'detailed_address',
			);
			$center_info = Database::get_result(self::TABLE,$map,$field);
			foreach($center_info as $k=>$v){
				$center_info[$k]['point'] = $v['lng'].','.$v['lat'];
			}
			return $center_info;
		}else{
			return $point;
		}
	}
	
	/*
	 * 该方法可以根据经纬度的中心点，指定半径范围内区域内的经纬度
	 * 原理是做一个正方形的内切圆
	 * 参数    $lng 纬度   $lat 经度    $distance  半径  默认为10千米
	 *  return   正方形的四个顶点坐标
	 * */
	function returnSquarePoint($lng, $lat,$distance = 10){
		/*定义地球半径 单位是千米*/
		$EARTH_RADIUS=6371;
		/*根据勾股定理得到一个角度值然后计算各个点的坐标*/
		$dlng = 2 * asin(sin($distance / (2 * $EARTH_RADIUS)) / cos(deg2rad($lat)));

		$dlng = rad2deg($dlng);

		$dlat = $distance/$EARTH_RADIUS;

		$dlat = rad2deg($dlat);
		/*得到一个正方形的坐标*/
		$data= array(
			'left-top'=>array('lat'=>$lat + $dlat,'lng'=>$lng-$dlng),
			'right-top'=>array('lat'=>$lat + $dlat, 'lng'=>$lng + $dlng),
			'left-bottom'=>array('lat'=>$lat - $dlat, 'lng'=>$lng - $dlng),
			'right-bottom'=>array('lat'=>$lat - $dlat, 'lng'=>$lng + $dlng)
		);
		return $data;
	}
	
	
    /**
	 * 通过详细地址查询经纬度
	 * @param string $address	地址信息（中文地址,如：湖北省武汉市XX区XX大厦）
	 * @return array				Array
	 *									(
	 *									    [lng] => xx.xxxxxxx
	 *									    [lat] => xx.xxxxxxx
	 *									)
	 *	经纬度以数组形式返回(lat->纬度,lng->经度)
	 *@author					llf
	 *@date						2015-08-21
	 */
	static function get_address_point($address){
		
		if (!is_string($address)) return '请输入正确的地址信息!';
		$_url = sprintf('http://api.map.baidu.com/geocoder/v2/?address='.$address.'&output=json&ak=1ymhpQR4DO51gDQAdb1rUZh3');
		/* 此url中的ak为百度地图lbs开放平台申请的密钥,如该方法返回数据不正常可尝试更换此值 */
		$_result = false;
		if($_result = file_get_contents($_url)) {
			$_result = json_decode($_result,true);
			$_coords = $_result['result']['location'];
		}
		return $_coords;
	}
	
	
	/**
	 * 通过详细地址查询经纬度
	 * @param string $address	地址信息（中文地址,如：湖北省武汉市XX区XX大厦）
	 * @return array				Array ()
	 * @高德逆地址解析API       http://lbs.amap.com/api/webservice/info/
	 * 经纬度以数组形式返回(lat->纬度,lng->经度)
	 * @author					llf
	 * @date						2016-01-20
	 */
	static function get_address_point_gd($address){
		
		if (!is_string($address)) return '请输入正确的地址信息!';
		// '51e4c924629a8b2598c1368d12f34644' //C('GD_WEB_ADDRESS_KEY')
		$_url = sprintf('http://restapi.amap.com/v3/geocode/geo?address='.$address.'&output=json&key='.'51e4c924629a8b2598c1368d12f34644');
		/* 此url中的key为高德地图开放平台申请的密钥,如该方法返回数据不正常可尝试更换此值 */
		
		$info  = json_decode(file_get_contents($_url),true); 
		if($info['status'] === '1'){
			/* return $info['geocodes']['location']; */  	 /* 经度  纬度 */
			return $info['geocodes'][0];                     /* 包括经纬度 */
		}else{
			Common::write_log(CONTROLLER_NAME,'高德坐标转地址接口错误码');
			return false;
		}
		
	}
	
	/**
	 * 通过高德经纬度查询地址信息
	 * @param string $location	需要查询的经度与纬度 格式(纬度,经度)
	 * @return array		    Array ()
	 * @高德逆地址解析API       http://lbs.amap.com/api/webservice/info/
	 * @最多支持20个坐标点。多个点之间用"|"分割。经度在前，纬度在后，经纬度间以“，”分割，经纬度小数点后不得超过6位
	 * @author					llf
	 * @date				    2016-01-20			
	 */
	static function get_point_to_address($location){
		
		if (!is_string($location)) return false;
		$point = array();
		list($point['lat'],$point['lng']) = explode(',',$location);
		$point['lat'] = number_format(floatval($point['lat']), 6, '.', '');
		$point['lng'] = number_format(floatval($point['lng']), 6, '.', '');
		$point_str    = $point['lng'] . ',' . $point['lat'];

		$_url = sprintf('http://restapi.amap.com/v3/geocode/regeo?location='.$point_str.'&output=json&key='.C('GD_WEB_ADDRESS_KEY'));
		/* 此url中的key为高德地图开放平台申请的密钥,如该方法返回数据不正常可尝试更换此值 */
		$info  = file_get_contents($_url);
		$info  = json_decode(file_get_contents($_url),true); 
		if($info['status'] === '1'){
			/* return $info['geocodes']['location']; */     /* 经度  纬度 */
			return $info['regeocodes'];                     /* 包括经纬度 */
		}else{
			Common::write_log(CONTROLLER_NAME,'高德坐标转地址接口错误码');
			return false;
		}
		
	}
	
	
	/*检测坐标点是否在半径内
	*@param   float     //坐标经度
	*@param   float     //坐标纬度
	*@return  boolean   //是否在范围内
	*@author  llf<747060156>
	**/
	static function chickPointInCircle($point,$lng,$lat){
		/* 算经度差值,算纬度差值 */
		$x  = abs(bcsub($point['lng'],$lng,6));
		$y  = abs(bcsub($point['lat'],$lat,6)); 
		/* 更具坐标差值求斜边  */
		$z  = hypot($x,$y);
		/* 与半径长度对比 */
		if(bccomp($z,0.08,6) < 1){
			return true;
		}else{
			return false;
		}
	}
}