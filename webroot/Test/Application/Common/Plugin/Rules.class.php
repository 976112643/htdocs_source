<?php
namespace Common\Plugin;

/*
 *	数据规则处理类
 * */
class Rules {
	
	public $rules = array(
		'mobile' => '/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$|17[0-9]{9}$/'
	);
	
	
	
}