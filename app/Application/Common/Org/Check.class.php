<?php
	/*
	* 常用验证集合
	* 与业务逻辑无关
	*/
namespace Common\Org;
class Check {
	
	
	
	/**
	* 验证是否为空
	* @static
	* @access public
	* @param  string/int 	$str 需要转换的字符串
	* @return bool
	* @author 陆龙飞
	* @date   2015-12-20
	*/
    static function is_empty($str) 
    { 
        if (!is_string($str)) 	return false;  
        if (empty($str)) 	  	return false;   
        if ($str=='') 			return false;   
        return true;   
    }
	/**
	* 验证是否是邮箱
	* @static
	* @access public
	* @param  string/int 	$str 需要转换的字符串
	* @return bool
	* @author 陆龙飞
	* @date   2015-12-20
	*/
	function is_postcode($str) 
    { 
        if(ereg("^[0-9]{4,6}$",$str)) 
            return true; 
        return false; 
    } 
    /**
	* 验证是否是手机号
	* @static
	* @access public
	* @param  string/int 	$mobile 需要转换的字符串
	* @return bool
	* @author 陆龙飞
	* @date   2015-10-20
	*/
	static function is_mobile($mobile){
		$mobile_str  = strval($mobile);
		return  preg_match('/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$/',$mobile_str);
	}
	
	/**
	* 验证字符串长度范围
	* @static
	* @access public
	* @param  string 	$str 需要验证的字符串
	* @param  int 	    $min 最小长度值(包括)
	* @param  int 	    $max 最大长度值(包括)
	* @return bool
	* @author 陆龙飞
	* @date   2015-10-20
	*/
	static function check_length($str,$min=6,$max=15){
		$leng  = mb_strlen($str,'utf-8');
		if($min <= $leng && $max >= $leng){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	* 验证身份证(中国) 
	* @static
	* @access public
	* @param  string/int 	$str 需要转换的字符串
	* @return bool
	* @author 陆龙飞
	* @date   2015-12-20
	*/
    static function id_card($str) 
	{ 
		$str=self::strTrim($str); 
		if(preg_match("/^([0-9]{15}|[0-9]{17}[0-9a-z])$/i",$str)) 
		{ 
			return true; 
		}else{ 
			return false; 
		} 
	} 
	
	 
}