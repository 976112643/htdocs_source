<?php
namespace App\Controller\AppCommon;
use   Common\Org\Common;  

class RequestController extends BaseController {
	
	/*
	 * 返回设备请求时时配置
	 *		需求分析
	 *			 显示当前用户的关联设备
	 *		流程分析
	 *           1、 获取默认请求时间配置缓存
	 *           2、 返回
	 * @author	 LLF <747060156@qq.com>
	 * @date	 2015-12-10  
	 * 接口地址  APP/AppCommon/Request/request_set
	 * 方式方式  GET 
		request  参   数 : 无
		response 参   数 
						{
							"status": 1,
							"msg": "OK",
							"info": {
								"heart_request": "5",		  心率数据请求间隔	单位/秒
								"track_request": "5",		  轨迹数据请求间隔	单位/秒
								"imme_request": "5"			  立即定位请求间隔	单位/秒
							}
						}
	
	*/
    public function request_set(){

		$device_app_config     = Common::get_device_app_config_cache();

		$data = array();
		$data['heart_request'] = $device_app_config['heart_request'];
		$data['track_request'] = $device_app_config['track_request'];
		$data['imme_request']  = $device_app_config['imme_request'];
			
		$this->apiReturn(array('status'=>1,'msg'=>'OK','info'=>$data));
    }

}