<?php
	/*
	 * 请求交互函数汇总
	 * */
namespace Common\Org;
class Request {
	const TABLE_USER = 'user';
	/*
	 * 处理全局POST交互
	 * @time 2015-08-15
	 * @author 秦晓武  <525249206@qq.com>
	 * */
	static function do_post(){
		switch(I('operate')){
			case 'get_mobile_code'://获取手机验证码
				$info = get_info(self::TABLE_USER, array(
					'id' => session('user_id')
				));
				$mobile = $info['mobile'];
				if(I('mobile') && !$info['mobile']){
					$mobile = I('mobile');
				}
				$result = self::send_mobile_code($mobile);
				$data['info'] = $result;
				$data['status'] = 1;
				echo json_encode($data);
				exit;
				break;
			default:
				;
		}
	}
	static function do_get(){
		
	}
	/*
	 * 注册发送短信接口，文档http://sdk2.entinfo.cn:8060/webservice.asmx
	 * */
	static function send_mobile_code($mobile,$content=''){
		$config = Cache::db_table('config');
		$code = rand(1000,9999);
		session('mobile_code',$code);
		session('mobile',$mobile);
		if(!$content){
			$content = str_replace('#code#',$code,$config['MESSAGE_CONTENT']);
		}
		$sn = $config['MESSAGE_NAME'];
		$password = $config['MESSAGE_PASSWORD'];
		$pwd = md5($sn.$password);
		$pwd = strtoupper($pwd);
		$content = urlencode($content);
		$url = "http://sdk2.entinfo.cn:8061/mdsmssend.ashx?sn=$sn&pwd=$pwd&mobile=$mobile&content=$content&ext=&stime=&rrid=&msgfmt=";
		$status = self::curl_get($url);
		return $status;
	}
	/*
	 * 封装curl
	 * */
	static function curl_get($url){
		//初始化
		$ch = curl_init();
		//设置选项，包括URL
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		//执行并获取HTML文档内容
		$output = curl_exec($ch);
		//释放curl句柄
		curl_close($ch);
		//返回获得的数据
		return $output;
	}
}