<?php
function _OK($info = '[]', $msg = '成功') {
	return array (
			'status' => 1,
			'info' => $info,
			'msg' => $msg 
	);
}
function _FAIL($info = '[]', $msg = '失败') {
	return array (
			'status' => 0,
			'info' => $info,
			'msg' => $msg 
	);
}
/**
 * 检查元素是否在数组中,多维数组递归检查
 * 待判定的值 $value
 * 目标数组 $arr
 * 是否检查'key'是否相等,默认不检查 $checkKey
 * return 如果包含,则返回包含该元素的数组
 */
function contains($value, $arr, $checkKey = false) {
	if (is_array ( $arr )) {
		foreach ( $arr as $key => $val ) {
			$temp = contains ( $value, $val, $checkKey );
			if (is_array ( $val ) && $temp) {
				return $temp;
			} else if ($val == $value || ($checkKey && $key == $value)) {
				return $arr;
			}
		}
	}
	return false;
}
/**
 * 判断数组是否为索引数组
 */
function is_assoc($arr) {
	return array_keys ( $arr ) !== range ( 0, count ( $arr ) - 1 );
}
function splitUrl($url) {
	$arr = explode ( '?', $url, 2 );
	$params = array ();
	if (count ( $arr ) >= 2) {
		$ps = explode ( '&', $arr [1] );
		foreach ( $ps as $i => $value ) {
			$kv = explode ( '=', $value );
			if (count ( $kv ) >= 2) {
				$params [$kv [0]] = $kv [1];
			}
		}
	}
	return array (
			'url' => $arr [0],
			'params' => $params 
	);
}

/**
 * * 发送HTTP请求方法 *
 *
 * @param string $url
 *        	请求URL
 * @param array $params
 *        	请求参数 *
 * @param string $method
 *        	请求方法GET/POST
 * @return array $data 响应数据
 */
function http($url, $params = array(), $method = 'GET', $header = array(), $multi = false) {
	$opts = array (
			CURLOPT_TIMEOUT => 30,
			CURLOPT_RETURNTRANSFER => 1,
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_SSL_VERIFYHOST => false,
			CURLOPT_HTTPHEADER => $header 
	); /* 根据请求类型设置特定参数 */
	switch (strtoupper ( $method )) {
		case 'GET' :
			$opts [CURLOPT_URL] = $url . '?' . http_build_query ( $params );
			break;
		case 'POST' :
			
			// 判断是否传输文件
			$params = $multi ? $params : http_build_query ( $params );
			$opts [CURLOPT_URL] = $url;
			$opts [CURLOPT_POST] = 1;
			$opts [CURLOPT_POSTFIELDS] = $params;
			break;
		default :
			throw new Exception ( '不支持的请求方式！' );
	} /* 初始化并执行curl请求 */
	$ch = curl_init ();
	curl_setopt_array ( $ch, $opts );
	$data = curl_exec ( $ch );
	$error = curl_error ( $ch );
	curl_close ( $ch );
	if ($error) {
		return null;
		// throw new Exception ( '请求发生错误：' . $error );
	}
	return $data;
}
/**
 * 获得当前毫秒数表示的时间
 *
 * @return string
 */
function getMillisecond() {
	$temps = explode ( ' ', microtime () );
	list ( $t1, $t2 ) = $temps;
	// var_dump($temps);
	return "" . ( float ) sprintf ( '%.0f', (floatval ( $t1 ) + floatval ( $t2 )) * 1000 );
}
/**
 * 获取访问者IP
 */
function getIP() {
	if (! empty ( $_SERVER ["HTTP_CLIENT_IP"] )) {
		$cip = $_SERVER ["HTTP_CLIENT_IP"];
	} elseif (! empty ( $_SERVER ["HTTP_X_FORWARDED_FOR"] )) {
		$cip = $_SERVER ["HTTP_X_FORWARDED_FOR"];
	} elseif (! empty ( $_SERVER ["REMOTE_ADDR"] )) {
		$cip = $_SERVER ["REMOTE_ADDR"];
	} else {
		$cip = "无法获取！";
	}
	return $cip;
}