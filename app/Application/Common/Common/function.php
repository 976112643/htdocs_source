<?php

/*
 * 微信支付
 * */
function WxPay($order_num,$money,$notify_url,$body,$attach='',$trade_type='NATIVE'){
	
	vendor('WxPay.lib.WxPayApi');
	vendor('WxPay.WxPayNativePay');
	vendor('WxPay.log');
	$notify = new \NativePay();
	$input  = new \WxPayUnifiedOrder();
	$money=$money*100;
	$input->SetBody($body);
	$input->SetAttach($attach);
	$input->SetOut_trade_no($order_num);
	$input->SetTotal_fee($money);
	$input->SetTime_start(date("YmdHis"));
	$input->SetTime_expire(date("YmdHis", time() + 600));
	$input->SetNotify_url($notify_url);
	$input->SetTrade_type($trade_type);
	$input->SetProduct_id("1");
	$result = $notify->GetPayUrl($input);
	$url = $result["code_url"];
	return $url;

}

/*
 * 微信回调
 * */
function notity($table){
	vendor('WxPay.PayNotifyCallBack');
	$notify = new \PayNotifyCallBack($table);
	$notify->Handle(false);
}

function getReadMessageNum($message_id, $status = '') {
	$map['message_id'] = $message_id;
	if($status !== '') {
		$map['status'] = $status;
	}
	$result = count_data( "message_status", $map );
	return $result;
}
function getWaitReadMessageNum() {
	$map['receive_member_id'] = session( "manager_id" );
	$map['receive_status'] = 0;
	$result = get_result( D( "MessageView" ), $map );
	return $result;
}


function getWaitReadMessageNums() {
	$map['status'] = 0;
	$map['user_id']=session('user_id');
	$result = get_result('system_message_status',$map);
	return $result;
}

function getReadMessageNums() {
	$map['status'] = 1;
	$map['user_id']=session('user_id');
	$result = get_result('system_message_status',$map,'','id desc');
	return $result;
}
/*
 * 发送短消息（采用事务，message和message_status表只能为InnoDB）
 * $ids 消息发送对象
 * 消息类型只有三种：
 * all 全体消息，由管理员发出，只有管理员可以删除，$ids参数无效
 * message 私信/短消息，$ids为数组形式传递进来
 * $content 消息发送内容
 * 返回值 array status为1表示发送成功，为-1表示发送失败
 * 不管发送成功与否，info均为对应发送结果返回状态
 */
function sendMessage($ids, $title, $content = '', $type = 'message') {
	if(! session( "manager_id" )) {
		$data['status'] = '-1';
		$data['info'] = "没有登录不能发送消息";
		return $data;
	}
	if($title == '') {
		$title = "无主题";
	}
	if($content == '') {
		$data['status'] = '-1';
		$data['info'] = "不能发送空消息";
		return $data;
	}
	// 开启事务
	M()->startTrans();
	$posts = $_POST;
	// 发送消息
	$_POST = null;
	$_POST['type'] = $type;
	$_POST['title'] = $title;
	$_POST['content'] = $content;
	$_POST['member_id'] = session( "manager_id" );
	$_POST['last_update_time'] = date( "Y-m-d H:i:s" );
	$result = update_data( "message" );
	if(is_numeric( $result )) {
		// 为消息批量添加接收者
		if($type == 'all') {
			$member_ids = get_result( "member", array(
					"id" => array(
							"neq",
							session( "manager_id" ) 
					) 
			), 'id' );
			foreach( $member_ids as $val ) {
				$member_ids[] = $val['id'];
			}
		} else {
			$member_ids = $ids;
		}
		
		foreach( $member_ids as $id ) {
			if($id && $id != 0) {
				$_POST = null;
				$_POST['path'] = '-0-' . $result . '-';
				$_POST['message_id'] = $result;
				$_POST['member_id'] = $id;
				$set_result = update_data( "message_status" );
				if(! is_numeric( $set_result )) {
					// 回滚事务
					M()->rollback();
					$data['status'] = '-1';
					$data['info'] = $set_result;
					return $data;
				}
			}
		}
		// 提交事务
		M()->commit();
		$_POST = $posts;
		$data['status'] = '1';
		$data['info'] = "发送成功";
		return $data;
	} else {
		// 回滚事务
		M()->rollback();
		$data['status']='-1';
		$data['info']=$result;
		return $data;
	}
}
/*
 * 回复消息（采用事务，message和message_status表只能为InnoDB）
 * $pid int 被回复消息ID
 * $content string 回复内容
 * 返回值 array status为1表示回复成功，为-1表示回复失败
 * 不管回复成功与否，info均为对应回复结果返回状态
 * @time 2015/07/11
 * @author 康利民 <kanglimin@cnsunrun.com>
 */
function replyMessage($pid, $content) {
	// 开启事务
	M()->startTrans();
	$info = get_info( "message", array(
			"id" => $pid 
	), 'path,member_id' );
	$posts = $_POST;
	// 发送消息
	$_POST = null;
	$_POST['pid'] = $pid;
	$_POST['path'] = $info['path'] . $pid . '-';
	$_POST['type'] = 'reply';
	$_POST['member_id'] = session( "manager_id" );
	$_POST['content'] = $content;
	$result = update_data( "message" );
	if(is_numeric( $result )) {
		// 增加消息回复对方的阅读状态
		$_POST = null;
		$_POST['id'] = $pid;
		$_POST['last_update_time'] = date( "Y-m-d H:i:s" );
		$message_result = update_data( "message" );
		if(! is_numeric( $message_result )) {
			// 回滚事务
			M()->rollback();
			$data['status'] = '-1';
			$data['info'] = $message_result;
			return $data;
		}
		$_POST = null;
		$_POST['path'] = $info['path'] . $pid . '-' . $result . '-';
		$_POST['message_id'] = $pid;
		$_POST['member_id'] = $info["member_id"];
		$set_result = update_data( "message_status" );
		if(! is_numeric( $set_result )) {
			// 回滚事务
			M()->rollback();
			$data['status'] = '-1';
			$data['info'] = $set_result;
			return $data;
		}
		// 提交事务
		M()->commit();
		$_POST = $posts;
		$data['status'] = '1';
		$data['info'] = "发送成功";
		return $data;
	} else {
		// 回滚事务
		M()->rollback();
		$data['status'] = '-1';
		$data['info'] = $result;
		return $data;
	}
}
/*
 * 删除消息或回复（假删除）
 * 删除消息时，同时删除回复及消息阅读状态记录
 */
function delMessage($ids) {
	$posts = $_POST;
	// 开启事务
	M()->startTrans();
	$result = get_result( "message", array(
			"id" => array(
					"in",
					$ids 
			) 
	) );
	foreach( $result as $val ) {
		// 判断当前删除消息是否为发布人的消息，发布人的消息只需要改变消息的状态
		if($val['member_id'] == session( "manager_id" )) {
			M( "message" )->where( array(
					"id" => $val['id'] 
			) )->setField( "status", - 1 );
		} else {
			
			M( "message_status" )->where( array(
					"message_id" => $val['id'],
					'member_id' => session( "manager_id" ) 
			) )->setField( "status", - 1 );
		}
	}
	// 提交事务
	M()->commit();
	$_POST = $posts;
	$data['status'] = '1';
	$data['info'] = "删除成功";
	return $data;
}
/*
 * 将信息状态调为已读状态
 */
function setMessageStatus($ids, $status = 1) {
	if($ids) {
		M( "message_status" )->where( array(
				"message_id" => array(
						"in",
						$ids 
				),
				'member_id' => session( "manager_id" ) 
		) )->setField( "status", $status );
		$data['status'] = 1;
	} else {
		$data['status'] = 0;
		$data['info'] = "请选择需要标记的数据";
	}
	return $data;
}

function  sub_telphone($telephone){
		$telephone=substr($telephone, 0, 3).'****'.substr($telephone, 7);
		return $telephone;
}


	/*
	 * 截取字符串
	 * @author    刘巧
	 * @date      2015-08-30
	 * @return    String
	*/
	function  sub_string($content,$num){
		if(strlen($content)>$num*3){
			$content=mb_substr($content, 0, $num, 'utf-8').'....';
		}
		return $content;
	}
	
	/*
 * 计算服务 省数量
 * @param   int       $user_id          产品或服务id         
 * @author  刘巧
 * @date    2015-09-07  
*/
function product_province(){
	$area = get_area_cache();
	$cache_name = 'province';
	if (! F ( $cache_name )) {
		$province=get_result('address',array('type'=>3),'count(*),province','','',$group='province');
		$province_num=array();
		foreach($province as $v){
			$province_num[]=$v['province'];
		}
		foreach ($area as $value){
			foreach($province as $k=>$v){
				if($value['id']==$v['province']){
					$province[$k]['title']=$value['title'];
				}
			}
		}
		$data=array();
		foreach($province as $k=>$row){
			$data['city'][]  = array('name'=>$row['title']);
			$data['point'][] = array('name'=>$row['title'].'省','value'=>$row['count(*)']);
			
		}
		F($cache_name,$data);
	}else{
		$result = F ( $cache_name );
	}
	return  $result;
}


/*
 * 地区数据缓存
 * @time 2015-01-21
 * @author 郭文龙 <2824682114@qq.com>
 */
function get_area_cache(){
	$cache_name='area_data';
	if(!F($cache_name)){
		$cache_result=get_result('area',array('status'=>1),'','sort desc');
		$result=get_cache_data($cache_result,$cache_name);
	}else{
		$result=F($cache_name);
	}
	return $result;
}

/*
 * 根据IP获取对应地址
 * @time 2015-06-11
 * @author 康利民 <3027788306@qq.com>
 */
function getLocationByIp($ip = '127.0.0.1') {
	return Common\Org\Operate::ip_to_location($ip);
}


/*
 * 获取分类数据
 * $type string 分类类型
 * @time 2015-05-05
 * @author 康利民 <3027788306@qq.com>
 */
function getCategory($type) {
	$cache_name = $type . '_category_result';
	// 判断缓存是否存在
	if (! F ( $cache_name )) {
		$map ['status'] = 1;
		$map ['type'] = $type;
		$cache_result = get_result ( "category", $map, '', 'sort desc,id asc' );
		$result = get_cache_data ( $cache_result, $cache_name );
	} else {
		$result = F ( $cache_name );
	}
	return $result;
}

function getBalance($id){
	if(intval($id)<=0){
		$id=session('user_id');
	}
	$map['user_id']=$id;
	$_map['pay_way']=1;//余额支付
	$_map['type']=array('in','0,1,2,3');//充值   提现 退款 取消提现
	$_map['_logic']='or';
	$map['_complex']=$_map;
	$list=get_result('deal',$map);
	$total=0;
	foreach($list as $key=>$val){
		/*充值*/
		if($val['type']==1&&$val['pay_way']!=1){
			$total+=$val['money'];
		}
		/*提现 */
		if($val['type']==2&&$val['status']==1||$val['status']==0){
			$total-=$val['money'];	
		}
		/*消费*/
		if($val['type']==0){
			$total-=$val['money'];
		}
			/*退款*/
		if($val['type']==3){
				
			$total+=$val['money'];
		}
	}
	return $total;

}

function str_to_unicode($input, $input_charset = 'utf-8'){
 $input = iconv($input_charset, "gbk", $input);
 preg_match_all("/[\x80-\xff]?./", $input, $ar);
 $b = array_map('utf8_unicode_', $ar[0]);
 $outstr = join("", $b);
 return $outstr;
}

function utf8_unicode_($c, $input_charset = 'gbk'){
 $c = iconv($input_charset, 'utf-8', $c);
 return utf8_unicode($c);
}
// utf8 -> unicode
function utf8_unicode($c) {
 switch(strlen($c)) {
 case 1:
 return $c;
 case 2:
 $n = (ord($c[0]) & 0x3f) << 6;
 $n += ord($c[1]) & 0x3f;
 break;
 case 3:
 $n = (ord($c[0]) & 0x1f) << 12;
 $n += (ord($c[1]) & 0x3f) << 6;
 $n += ord($c[2]) & 0x3f;
 break;
 case 4:
 $n = (ord($c[0]) & 0x0f) << 18;
 $n += (ord($c[1]) & 0x3f) << 12;
 $n += (ord($c[2]) & 0x3f) << 6;
 $n += ord($c[3]) & 0x3f;
 break;
 }
 return "&#$n;";
}

/**
 * 将unicode字符转换成普通编码字符
 *
 * @param string $str
 * @param string $out_charset
 * @return string
 */
function str_from_unicode($str, $out_charset = 'gbk'){
 $str = preg_replace_callback("|&#([0-9]{1,5});|", 'unicode2utf8_', $str);
 $str = iconv("UTF-8", $out_charset, $str);
 return $str;
}

function unicode2utf8_($c){
 return unicode2utf8($c[1]);
}
function unicode2utf8($c){
 $str="";
 if ($c < 0x80) {
 $str.=$c;
 } else if ($c < 0x800) {
 $str.=chr(0xC0 | $c>>6);
 $str.=chr(0x80 | $c & 0x3F);
 } else if ($c < 0x10000) {
 $str.=chr(0xE0 | $c>>12);
 $str.=chr(0x80 | $c>>6 & 0x3F);
 $str.=chr(0x80 | $c & 0x3F);
 } else if ($c < 0x200000) {
 $str.=chr(0xF0 | $c>>18);
 $str.=chr(0x80 | $c>>12 & 0x3F);
 $str.=chr(0x80 | $c>>6 & 0x3F);
 $str.=chr(0x80 | $c & 0x3F);
 }
 return $str;
}