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
		// I('operate')
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
			case 'ajax_msg':
				$map1['status'] = 1;
				$map1['type'] = 5;
				session('center_id') > 0 ?  $map1['center_id'] = session('center_id') : false;
				if(session('notice_view_time')){
					$map1['add_time'] = array('gt',session('notice_view_time'));
				}else{
					$map1['add_time'] = array('gt',date('Y-m-d'));
				}
				$data['notice_count'] = Database::count_data('notice',$map1);
				$data['status'] = 1;
				echo json_encode($data);
				exit;
				break;
			case 'ajax_order_msg':
				if(session('center_id')){
					$model_data = CallBack::get_model('',session('center_id'));
					$map =array(
						'type' => '1',
						'center_id' => session('center_id'),
					) ;
					if(session('role_id')=='3'){
						$map['status'] = array('in','10,20');
					};
					if(session('role_id')=='5'){
						$map['status'] = '30';
					};
					if(session('orders_view_time')){
						$map['add_time'] = array('gt',session('orders_view_time'));
					}else{
						$map['add_time'] = array('gt',date('Y-m-d'));
					}
					$order_count = Database::count_data('orders',$map,'id',$model_data['crm_db_name']);
				}
				$data['info'] = $order_count;
				$data['status'] = 1;
				echo json_encode($data);
				exit;break;
			case 'ajax_select2':
				$limit = 10;
				$data['info'] = L('QSRCXGJZ_ERROR');
				$data['status'] = 0;
				$keyword = I('post.q', null, '/\S+/');
				if(empty($keyword)){ 
					echo json_encode($data);
					exit();
				}
				$page = I('post.page', 1, '/^[1-9]\d*$/');
				$start = ($page - 1) * $limit;
				$keyword = '%'.trim($keyword).'%';
				$data = self::select2_list($keyword, $start.','.$limit);
				echo json_encode($data);
				exit();
				break;
			case 'set_center':
				$data = array(
					'status'=> 0,
					'info'=> '',
				);
				$center_id = I('post.center_id');
				$center_list = Common::center_list(session('role_id'));
				if(is_array($center_list)) {
					if(in_array($center_id, array_column($center_list, 'id'))) {
						session('center_id', $center_id);
						$data['status'] = 1;
						$data['info'] = L('WDQHCG_SUCCESS');
						$data['url'] = 'location';
					}
				}
				echo json_encode($data);
				exit();
				break;
			case 'remeber_page':
				$action = I('post.num', 0, 'int');
				switch($action) {
					case 0:
						session('remember_page', null);
						break;
					case 1:
						session('remember_page', I('post.page', 10, '/^[1-9]\d+$/'));
						break;
					default:
						break;
				}
				$data['status'] = 1;
				echo json_encode($data);
				exit();
				break;
			case 'default_page':
				$action = I('post.num', 0, 'int');
				switch($action) {
					case 0:
						cookie('default_remember_page', null);
						break;
					case 1:
						cookie('default_remember_page', I('post.page', 10, '/^[1-9]\d+$/'), 31536000);
						break;
					default:
						break;
				}
				$data['status'] = 1;
				echo json_encode($data);
				exit();
				break;
			default:
				break;
		}
	}
	static function do_get(){
		
	}
	
	
	
	
	/*
	 * 注册发送短信接口，文档http://sdk2.entinfo.cn:8060/webservice.asmx
	 *  "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	 * */
	static function send_mobile_code($mobile,$content=''){
		
		$config = Cache::db_table('config');
		$code = rand(1000,9999);
		session('code',$code);
		session('mobile',$mobile);
		if(!$content){
			$content = str_replace('#code#',$code,$config['CONTENT']);
		}
		
		// $sn = $config['MESSAGE_NAME'];
		// $password = $config['MESSAGE_PASSWORD'];
		$sn = 'cf_cnsunrun';
		$password = 'cnsunrun87778785..';
		$target = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";


		$post_data = "account=$sn&password=$password&mobile=".$mobile."&content=".$content;
		
		
		//密码可以使用明文密码或使用32位MD5加密
		$gets =  self::xml_to_array(self::Post($post_data, $target));
		
		if($gets['SubmitResult']['code']==2){
			$_SESSION['mobile'] = $mobile;
			$_SESSION['mobile_code'] = $mobile_code;
		}
		return $gets;
	}
	
	static function Post($curlPost,$url){
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_NOBODY, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
		$return_str = curl_exec($curl);
		curl_close($curl);
		return $return_str;
	}
	static function xml_to_array($xml){
		$reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
		if(preg_match_all($reg, $xml, $matches)){
			$count = count($matches[0]);
			for($i = 0; $i < $count; $i++){
			$subxml= $matches[2][$i];
			$key = $matches[1][$i];
				if(preg_match( $reg, $subxml )){
					$arr[$key] = self::xml_to_array( $subxml );
				}else{
					$arr[$key] = $subxml;
				}
			}
		}
		return $arr;
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
	/*
	 * Select 2 查询
	 */
	static function select2_list($keyword, $limit) {
		$array = array(
			'total_count'=> 0,
			'items'=> array()
		);
		$count_field = 'id';
		$type = I('get.ajax_select2');
		switch($type) {
			/*区域经理列表*/
			case 'get_send_id' :
				$Model = 'member';
				$map = array(
					'email|mobile'=> array('like', $keyword)
				);
				$field = 'id,mobile,email,nickname';
				$func = function ($var) {
					$str = '%mobile%（%email%）（%nickname%）';
					return str_replace(array('%mobile%', '%email%','%nickname%'), array($var['mobile'], $var['email'],$var['nickname']), $str);
				};
				break;
			
			default:
				return $array;
				break;
		}
		$list = (array)Database::get_result($Model, $map, $field, '', $limit);
		$total_count = Database::count_data($Model, $map, $count_field);
		foreach($list as $k=> &$v) {
			$v['full_name'] = $func($v);
		}
		unset($v);
		$array['total_count'] = $total_count;
		$array['items'] = $list;
		return $array;
	}
}