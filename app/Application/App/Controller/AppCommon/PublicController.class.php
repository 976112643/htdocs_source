<?php
namespace App\Controller\AppCommon;
use	Common\Org\Common;

class PublicController extends BaseController {
	
	public function clear_cache(){
	
		F('device_default_config_cache',null);
		F('device_app_config_cache',null);
		F('device_default_config_cache_2_1',null);
		F('device_default_config_cache_2_0',null);
		F('device_app_config_cache_2',null);
		Common::get_device_config_cache();
		Common::get_device_app_config_cache();
		Common::get_device_config_cache_2_1();
		Common::get_device_config_cache_2_0();
		Common::get_device_app_config_cache_2();
	}
	
	public function api_temp_status(){
			
		$this->apiReturn(array('status'=>'0','msg'=>'hide'));
	}

		//缓存测试
	public function api_cache(){
		
		$aa = array(
			'device_default_config_cache'=>Common::get_device_config_cache(),
			'device_app_config_cache'=>Common::get_device_app_config_cache(),
			'device_default_config_cache_2_1'=>Common::get_device_config_cache_2_1(),
			'device_default_config_cache_2_0'=>Common::get_device_config_cache_2_0(),
			'device_app_config_cache_2'=>Common::get_device_app_config_cache_2(),
		);
		var_dump($aa);
		die();
		
	}

		
	
}