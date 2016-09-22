<?php
namespace Common\Plugin;

/*
 *	数据处理类
 * */
class Data {
	
		
	/*
	 * 返回真实路径  主要用于APP
	 */
	public function assUrl($url) {
		if(!$url) return '';
		$menu ['url'] = $url;
		$chars = "/((^http)|(^https)|(^ftp)):\/\/(\S)+\.(\w)+/";
		if (! preg_match ( $chars, $menu ['url'] )) {
			$return_url = DOMAIN_PATH.__ROOT__ . '/' . $url;
		} else {
			$return_url = $url;
		}
		return $return_url;
	}
	
	
}