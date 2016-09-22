<?php
	/*
	 * 功能函数汇总
	 * */
namespace Common\Org;
class Operate {
	/*
	 * IP转地址
	 * @time 2015-08-15
	 * @author 秦晓武  <525249206@qq.com>
	 * */
	static function ip_to_location($p = '127.0.0.1'){
	// 导入IpLocation类
		$ip = new \Org\Net\IpLocation ();
		$area = $ip->getlocation($p);
		$location = iconv("gbk", "utf-8", $area['country']);
		if ($location == 'IANA') {
			return "本地登陆";
		} else {
			return $location;
		}
	}/**
	* 转换IPv6地址为bin
	* @param string $ip 返回类型 0 数字 1 返回False
	* @return mixed
	*/
	function ip2bin($ip) 
	{ 
	if(filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4) !== false) 
	return base_convert(ip2long($ip),10,2); 
	if(filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6) === false) 
	return false; 
	if(($ip_n = inet_pton($ip)) === false) return false; 
	$bits = 15; // 16 x 8 bit = 128bit (ipv6) 
	while ($bits >= 0) 
	{ 
	$bin = sprintf("%08b",(ord($ip_n[$bits]))); 
	$ipbin = $bin.$ipbin; 
	$bits--; 
	} 
	return $ipbin; 
	} 
	/**
	* 转换bin地址为IPv6 或IPv4
	* @param long $bin 返回类型 0 IPv4 IPv6地址
	* @return mixed
	*/
	function bin2ip($bin) 
	{ 
	if(strlen($bin) <= 32) // 32bits (ipv4) 
	return long2ip(base_convert($bin,2,10)); 
	if(strlen($bin) != 128) 
	return false; 
	$pad = 128 - strlen($bin); 
	for ($i = 1; $i <= $pad; $i++) 
	{ 
	$bin = "0".$bin; 
	} 
	$bits = 0; 
	while ($bits <= 7) 
	{ 
	$bin_part = substr($bin,($bits*16),16); 
	$ipv6 .= dechex(bindec($bin_part)).":"; 
	$bits++; 
	} 
	return inet_ntop(inet_pton(substr($ipv6,0,-1))); 
	} 
	/**
	* 获取客户端IP地址
	* @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
	* @return mixed
	*/
	function get_client_ip6($type = 0) {
	$type = $type ? 1 : 0;
	static $ip = NULL;
	if ($ip !== NULL) return $ip[$type];
	if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	$arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
	$pos = array_search('unknown',$arr);
	if(false !== $pos) unset($arr[$pos]);
	$ip = trim($arr[0]);
	}elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
	$ip = $_SERVER['HTTP_CLIENT_IP'];
	}elseif (isset($_SERVER['REMOTE_ADDR'])) {
	$ip = $_SERVER['REMOTE_ADDR'];
	}
	// IP地址合法验证
	$long = sprintf("%u",self::ip2bin($ip));
	$ip = $long ? array($ip, $long) : array('0.0.0.0', 0);
	return $ip[$type];
	}
}