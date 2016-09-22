<?php

	/*
	 * 地址用户插件
	 * @需求：
	 * 后台可以用户
	 * 前台地址添加修改
	 * @time 2015/10/14
	 * @author 刘巧
	 * */
namespace Common\Plugin;
use Common\Org\Cache;
class Address extends Main{
	
	/*
	 * 存入地址
	 * @author    刘巧
	 * @param     $data 一个数组参数，包含地址，姓名，手机邮编
	 * @param	  $id 获取修改地址id 默认为空
	 * @date      2015-09-10
	 * @return    String
	*/

	static function save_address($data){
		
		if(!preg_match('/^1[3|4|5|8][0-9]\d{8}$/',$data['telephone'])){
				
				$tips_msg = array('status'=>0,'info'=>'手机号格式不正确！');
		}
		$rules = array(
			array('username','require','请填写收货人！'), 
			array('telephone','require','请填写手机号码！'), 
			array('detailed_address','require','详细地址必须填写！'), 
			array('postalcode','require','邮编必须填写！'), 
			
		);
		if($data['province']>0&&$data['city']>0&&$data['area']>0){
			/*将地址链接*/
			$area_path = '-0-'.$data['province'].'-'.$data['city'].'-'.$data['area'];
			$_POST = array(
				'member_id' => session('user_id'),
				'id' =>$data['id'],
				'username' => $data['username'],
				'telephone' =>$data['telephone'],
				'postalcode' => $data['postalcode'],
				'area_path' => $area_path,
				'detailed_address' =>$data['detailed_address'],
				'type' => 1,
			);
			$result = update_data('address');
			if(is_numeric($result)){
				$tips_msg = array('status'=>1,'info'=>'添加成功','url'=>U('index'));
			}else{
				$tips_msg = array('status'=>0,'info'=>'添加失败');
			}
		}else{
			$tips_msg=array('status'=>0,'info'=>'地址信息填写不完整');
			
		}
		return $tips_msg;
	}
		
	/*
	 * 获取修改地址信息
	 *
	 * @author    刘巧
	 * @param     $data 一个数组参数，包含地址，姓名，手机邮编
	 * @
	 * @date      2015-09-10
	 * @return    String
	*/
	function edit_address($id){
		$user_id = session('user_id');
		if($user_id){
			if($id){
				$addressInfo  =  get_info('address',$map=array('id'=>$id)); 
				//解析地址
				$area = Common::get_area_cache();
				$ret  = explode('-',$addressInfo['area_path']);
				$province   =  $ret[2];
				$city     =  $ret[3];
				$area     =  $ret[4];
				$addressInfo['province'] = $province;
				$addressInfo['city'] = $city;
				$addressInfo['area'] =$area;
				$tips_msg = array('status'=>'1','info'=>$addressInfo);
			}else{
				$tips_msg = array('status'=>'0','info'=>'提交参数有误！');
			}
		}else{
			$tips_msg = array('status'=>'0','info'=>'提交参数有误！');
		}
		return $tips_msg;
	}
	/*
	 * 根据id解析地址中文名称
	 *
	 * @author    刘巧
	 * @param     $province 省  $city 市  $area  区 
	 * @
	 * @date      2015-09-10
	 * @return    String
	*/
	function analysis_address($province='',$city='',$area=''){
		$data = Cache::db_table('area');
		$address['province'] = $data[$province]['title'];
		$address['city'] = $data[$city]['title'];
		$address['area'] = $data[$area]['title'];
		return $address;
	}
		
}