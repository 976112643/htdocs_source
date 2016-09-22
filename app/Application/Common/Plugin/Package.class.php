<?php

	/*
	 * 报文类
	 * @需求：
	 *   用于对报文进行相关解析和调度
	 * 前台显示
	 * @time 2015/12/10
	 * @author llf
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;

class Package extends Main{
	
	/* 基站WiFi报文解析
	 *		需求分析
	 *			解析基站和WiFi报文
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-12
     * @parma    	$str	    	    //基站WiFi字符串 (43-基站WiFi轨迹报文、42-SOS报警)
	 * @return      {
					  ["location"]=>
					  array(5) {
						["address"]=>
						array(6) {
						  ["region"]=>
						  string(9) "广东省"
						  ["county"]=>
						  string(9) "福田区"
						  ["street"]=>
						  string(15) "香蜜湖街道"
						  ["street_number"]=>
						  string(6) "村仔"
						  ["city"]=>
						  string(9) "深圳市"
						  ["country"]=>
						  string(6) "中国"
						}
						["addressDescription"]=>
						string(105) "广东省深圳市福田区泰然九路香蜜湖街道村仔,皇冠科技园南67米,泰然九路西27米"
						["longitude"]=>
						float(114.024252)
						["latitude"]=>
						float(22.532602)
						["accuracy"]=>
						string(3) "200"
					  }
					  ["access_token"]=> NULL
					  ["ErrCode"]=>
					  string(1) "0"
					}

	*/
	static function  explain_lbs_wifi_old($str,$imei,$add_time,$type){
		
		if(!$str)  return false;
				
		$parm = explode('|',$str);
		$date = explode(',',$parm[0])[0];        /* 报文时间字符串 */
		$a  = intval(explode(',',$parm[0])[1]);  /* 基站个数	*/
		$b  = intval(explode(',',$parm[$a-1])[1]);
		
		$jz = array();
		$wf = array();
		if(0 < $a){
			/* 处理 头部 */
			$parm[0] = explode(',',$parm[0])[2];
			for($i=0;$i<$a;$i++){
				$temp_jz = explode(';',$parm[$i]); 
				$jz[] = array(
					'mcc'	 		 =>$temp_jz[0],
					'mnc'	 		 =>$temp_jz[1],
					'lac'			 =>$temp_jz[2],
					'cell_id'		 =>$temp_jz[3],
					'singalstrength' =>intval(explode(';',$parm[$i])[4]),
				);
			}
		}
	
		if(0 < $b){
			--$a;
			/* 处理 头部 */
			$parm[$a] = explode(',',$parm[$a])[2];
			for($j=$a;$j<$b+$a;$j++){
				$temp_wf  = explode(';',$parm[$j]);
				$wf[] 	  = array(
					'macaddress'    =>$temp_wf[0],
					'aaa'           =>$temp_wf[1],
					'singalstrength'=>intval($temp_wf[2]),
				);
			}
		}

	    $key = C('HS_KEY');
		$requestdata = array();
		$requestdata['celltowers'] = $jz;
		$requestdata['wifilist']   = $wf;
		$requestdata['mnctype']    = 'gsm';
		$url    = 'http://api.haoservice.com/api/viplbs?requestdata='.json_encode($requestdata).'&type=1&key='.$key;
	    $result = Common::curl_get($url);
		
		if(!$result) return false;
		$info   = json_decode($result,true);
		if($info['ErrCode'] ==='0'){
			
			/* 数据持久化入库 */
			if($info['location']['addressDescription']){
				$address = $info['location']['addressDescription'];
			}else{
				$address = $info['location']["address"]["region"].$info['location']["address"]["city"].$info['location']["address"]["county"].$info['location']["address"]["street"].$info['location']["address"]["street_number"];
			}
			$data = array(
				'seq'    =>$imei.''.strtotime($add_time),
				'type'   =>$type,
				'lng'    =>$info['location']['longitude'],
				'lat'    =>$info['location']['latitude'],
				'address'=>$address,
				'time'   =>Common::get_time($date), 
			);
			self::save_point($data);
			/* return  $date.','.$info['location']['latitude'].';'.$info['location']['longitude']; */
			return  $info;
		}else{
			Common::write_log(CONTROLLER_NAME,'基站WiFi定位信息解析失败');
			return false;
		}
		
	}	
	/* 高德地图版 */
	static public function explain_lbs_wifi($str,$imei,$add_time,$type){

		if(empty($str))  return false;
		$parm = explode('|',$str);
		$date = explode(',',$parm[0])[0];        	 /* 报文时间字符串 */
		$a  = intval(explode(',',$parm[0])[1]); 	 /* 基站个数 */
		$b  = intval(explode(',',$parm[$a-1])[1]);	 
		
		$requestdata	    	= array();
		if($a > $b){
			$requestdata['accesstype'] = '0';
		}else{
			$requestdata['accesstype'] = '1';
			$requestdata['cdma']       = '0';
		}
		$jz = array();
		$wf = array();
		if(0 < $a){
			/* 处理 头部 */
			$parm[0] = explode(',',$parm[0])[2];
			for($i=0;$i<$a;$i++){
				$temp_jz = explode(';',$parm[$i]); 
				$jz[] = array(
					'mcc'	  =>$temp_jz[0],
					'mnc'	  =>$temp_jz[1],
					'lac'	  =>$temp_jz[2],
					'cellid'  =>$temp_jz[3],
					'signal'  =>intval(explode(';',$parm[$i])[4]),
				);
			}
		}
		if(0 < $b){
			--$a;
			/* 处理 头部 */
			$parm[$a] = explode(',',$parm[$a])[2];
			for($j=$a;$j<$b+$a;$j++){
				$temp_wf  = explode(';',$parm[$j]);
				$wf[] = array(
					'mac'    =>$temp_wf[0],
					'ssid'   =>$temp_wf[1],
					'signal' =>intval($temp_wf[2]),
				);
			}
		}
		if(!empty($jz)){
			$requestdata['bts'] 	= implode(',',$jz[0]);
			unset($jz[0]);
			$requestdata['nearbts'] = '';
			foreach($jz as $v){
				$requestdata['nearbts'] .= implode(',',$v) . '|';
			}
			$requestdata['nearbts'] = rtrim($requestdata['nearbts'],'|');
		}
		if(!empty($wf)){	
			$requestdata['mmac'] 	= implode(',',$wf[0]);
			unset($wf[0]);
			$requestdata['macs'] 	= '';
			foreach($wf as $vv){
				$requestdata['macs'] .= implode(',',$vv) . '|';
			}
			$requestdata['macs'] = rtrim($requestdata['macs'],'|');
		}
		
		/* C('HS_KEY'); */
		$requestdata['output']  = 'json';
		$requestdata['key'] 	= 'bc34e0ecbcee86715a8153d0b57839a3';
		$url  = 'http://apilocate.amap.com/position?imei='.$imei;
		$url .= '&'.http_build_query($requestdata);
        $url  = str_replace('%23','#',$url);
		$result = Common::curl_get($url);
		$info   = json_decode($result,true); 
		if(intval($info['status']) === 1){
			/* 数据入库 */		
			$point	= explode(',',$info['result']['location']);
			$data	= array(
				'seq'    =>$imei.''.strtotime($add_time),
				'type'   =>intval($type),
				'lng'    =>floatval($point[0]),
				'lat'    =>floatval($point[1]),
				'address'=>$info['result']['desc'],
				'time'   =>Common::get_time($date), 
			);
			self::save_point($data);
			return  $info;
		}else{
			Common::write_log(CONTROLLER_NAME,'基站WiFi定位信息解析失败');
			return false;
		}
	}
	/* 高德地图第二代设备测试 */
	static public function explain_lbs_wifi_v2($str,$imei,$add_time,$type){
		
		if(empty($str))  return false;
		$parm = explode(',',$str);
		
		$date = mktime($parm[2][0].''.$parm[2][1],$parm[2][2].''.$parm[2][3],$parm[2][4].''.$parm[2][5],$parm[1][2].''.$parm[1][3],$parm[1][0].''.$parm[1][1],$parm[1][4].''.$parm[1][5]);	/* 报文时间 */
		$a    = intval($parm[17]); 	 				     /* 基站个数 */
		
		if(!$a)	return false;
		
		if(sizeof($parm) > intval(17+$a*3+3)){
			$b = intval($parm[intval(17+$a*3+3+1)]);	 /* WiFi个数 */
		}else{
			$b = 0;
		}		
		$requestdata = array();
		if($a > $b){
			$requestdata['accesstype'] = '0';
		}else{
			$requestdata['accesstype'] = '1';
			$requestdata['cdma']       = '0';
		}
		$jz = array();
		$wf = array();
		if(0 < $a){
			for($i=1;$i<=$a;$i++){
				$jz[] = array(
					'mcc'	  =>$parm[19],
					'mnc'	  =>$parm[20],
					'lac'	  =>$parm[20+$i*3-2],
					'cellid'  =>$parm[20+$i*3-1],
					'signal'  =>$parm[20+$i*3],
				);
			}
		}
		
		if(0 < $b && $b <=5){  /* wifi 最多五个 */
			for($j=1;$j<=$b;$j++){
				$wf[] = array(
					'mac'    =>$parm[20+$a*3+$j*3-1],
					'ssid'   =>$parm[20+$a*3+$j*3-2],
					'signal' =>$parm[20+$a*3+$j*3],
				);
			}
		}
		if(!empty($jz)){
			$requestdata['bts'] 	= implode(',',$jz[0]);
			unset($jz[0]);
			$requestdata['nearbts'] = '';
			foreach($jz as $v){
				$requestdata['nearbts'] .= implode(',',$v) . '|';
			}
			$requestdata['nearbts'] = rtrim($requestdata['nearbts'],'|');
		}
		if(!empty($wf)){	
			$requestdata['mmac'] 	= implode(',',$wf[0]);
			unset($wf[0]);
			$requestdata['macs'] 	= '';
			foreach($wf as $vv){
				$requestdata['macs'] .= implode(',',$vv) . '|';
			}
			$requestdata['macs'] = rtrim($requestdata['macs'],'|');
		}
		
		/* C('HS_KEY'); */
		$requestdata['output']  = 'json';
		$requestdata['key'] 	= 'bc34e0ecbcee86715a8153d0b57839a3';
		$url  = 'http://apilocate.amap.com/position?imei='.$imei;
		$url .= '&'.http_build_query($requestdata);
        $url  = str_replace('%23','#',$url);
		$result = Common::curl_get($url);
		$info   = json_decode($result,true); 
		
		if(intval($info['status']) === 1){
			/* 数据入库 */		
			$point	= explode(',',$info['result']['location']);
			$data	= array(
				'seq'    =>$imei.''.strtotime($add_time),
				'type'   =>intval($type),
				'lng'    =>floatval($point[0]),
				'lat'    =>floatval($point[1]),
				'address'=>$info['result']['desc'],
				'time'   =>date('Y-m-d H:i:s',$date),
			);
			self::save_point($data);
			return  $info;
		}else{
			Common::write_log(CONTROLLER_NAME,'基站WiFi定位信息解析失败,高德错误码:'.$info['status']);
			return false;
		}
	} 
	/* 判断基站报文是否已经解析，存在解析这返回解析结果数据
	 *		需求分析
	 *			读取数据库判断该点是否存在 后期对经纬坐标hash 存储 去重复等 
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-12
     * @parma   $data  = array(
					'imei'    =>,
					'type'    =>,
					'add_time'=>,
				)  	                       
	*/
	static function get_parser_point($data=array()){
		
		$map = array(
			'seq' =>$data['imei'].''.strtotime($data['add_time']),
			'type'=>$data['type'],
		);
		$has  = get_info('parser',$map,true);
		if($has){
			/* return  date('YmdHis',strtotime($has['time'])).','.$has['lat'].';'.$has['lng']; */
			return $has;
		}else{
			return false;
		}
	}
	
	/* 纬度解析信息进行保存 */
	static function save_point($data){
		
		$_POST = $data;
		$_POST['add_time'] = date('Y-m-d H:i:s'); 
		$result = update_data('parser');
		if(!is_numeric($result)){
			/* 插入失败写入日志 */
			/* Common::write_log(CONTROLLER_NAME,'基站坐标解析信息进行保存失败'); */
		}
	} 

} 