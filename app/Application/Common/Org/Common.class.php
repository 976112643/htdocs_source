<?php
	/*
	 * 常用函数汇总
	 * */
namespace Common\Org;
use  PDO;

class Common {

	/*
	 * 获取首页广告数据
	 * @time 2016-01-05
	 * @author llf <3027788306@qq.com>
	 */
	static function getBanner($type) {
		$cache_name = $type . '_banner';
		/* 判断缓存是否存在 */
		if (! F ( $cache_name )) {
			$cur_date = date ( "Y-m-d H:i:s", time () );
			$map ['page'] = $cache_name;
			$map ['start_time'] = array (
					"elt",
					$cur_date 
			);
			$map ['end_time'] = array (
					"egt",
					$cur_date 
			);
			$map ['status'] = 1;
			$cache_result = get_result ( "banner", $map, '', 'sort desc,id asc' );
			$result = get_cache_data ( $cache_result, $cache_name );
		} else {
			$result = F ( $cache_name );
		}
		return $result;
	}
	/*  删除当前传递过来的图片（包括自动生成的三种型号的缩略图） */
	static function delImgAll($path) {
		$dir = dirname ( $path );
		$imgLarge = $dir . '/L' . basename ( $path );
		$imgMiddle = $dir . '/M' . basename ( $path );
		$imgSmall = $dir . '/S' . basename ( $path );
		@unlink ( $path );
		@unlink ( $imgLarge );
		@unlink ( $imgMiddle );
		@unlink ( $imgSmall );
	}
	/*
	 * 获取分类数据
	 * $type string 分类类型
	 * @time 2016-01-05
	 * @author llf <3027788306@qq.com>
	 */
	static function getCategory($type) {
		$cache_name = $type . '_category_result';
		/* 判断缓存是否存在 */
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
	/*
	 * 短信发送接口
	 */
	static function sms($mobile,$content) {
		
		$config = Cache::db_table('config');
		$sn 	  = $config['MESSAGE_NAME'];
		$password = $config['MESSAGE_PASSWORD'];

		
		$target = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		$post_data = "account=$sn&password=$password&mobile=".$mobile."&content=".$content;
		
		//密码可以使用明文密码或使用32位MD5加密
		$gets =  self::xml_to_array(self::Post($post_data, $target));
		// var_dump($gets);
		// die();
		return $gets['SubmitResult']['code'];
	
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
	 * CURL get 提交数据
	 * */
	static function curl_get($url){
		/* 初始化 */
		$ch = curl_init();
		/* 设置选项，包括URL */
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		/* 执行并获取HTML文档内容 */
		$output = curl_exec($ch);
		/* 释放curl句柄 */
		curl_close($ch);
		/* 返回获得的数据 */
		return $output;
	}
	/*
	 * 地区数据缓存
	 * @time 2015-01-21
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	static function get_area_cache(){
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
	static function getLocationByIp($ip = '127.0.0.1') {
		return Common\Org\Operate::ip_to_location($ip);
	}
	/**
	 * 将二维数组的键值转换为子数组的中ID值
	 * @param array  $array			待转换的二维数组
	 * @return array				键值为数组中ID值的数组
	 * 
	 * @author						李东
	 * @date						2015-07-08
	 */
	static function array_id_key($array){
		$temp_arr = array();
		foreach($array as $val){
			$temp_arr[$val['id']] = $val;
		}
		$array = $temp_arr;
		return $array;
	}
	/**
	 * 将path链接在一起
	 * 
	 * @param string $path			需要获取的信息path
	 * @return array()				返回path中包含的所有ID的信息
	 * 
	 * @author						刘巧
	 * @date						2015-08-21
	 */
	static function get_detail_address($address_info){
		$area = self::get_area_cache();
		$area_id_key = self::array_id_key($area);
		foreach($address_info as $key=>$row){
			$address_arr = explode('-',$row['area_path']);
			$new_address = $area_id_key[$address_arr['2']]['title'].$area_id_key[$address_arr['3']]['title'].$area_id_key[$address_arr['4']]['title'];
			$address_info[$key]['new_address'] = $new_address;
		}
		return $address_info;
	}
	/**
	 * 提供地址选择信息
	 * 	
	 * 
	 * @author						刘巧
	 * @date						2015-08-24
	 */

	static function  get_select_address($member_id,$address_id=''){
		$area = slef::get_area_cache();
		if(empty($address_id)&&!empty($member_id)){
			$adress_info=get_info('address' ,array('member_id'=>$member_id));
		}else{
			$adress_info=get_info('address' ,array('id'=>$address_id));
		}
		if(!empty($adress_info)){
			$res = get_info('address' ,array('id'=>$adress_info['id']));
		}
		//获取地址的分类路径并拆分成数组
		$ret = explode('-',$res['area_path']);
		foreach ($area as $value){
			if ($value['id'] == $ret[2]){
				$province_data['province'] = $value['title'];
				$province_data['id'] = $value['id'];
				$province_data['path'] = $value['path'];
			}
			if ($value['id'] == $ret[3]){
				$city_data['city'] = $value['title'];
				$city_data['id'] = $value['id'];
				$city_data['path'] = $value['path'];
			}
			if ($value['id'] == $ret[4]){
				$area_data['area'] = $value['title'];
				$area_data['id'] = $value['id'];
				$area_data['path'] = $value['path'];
			}
		}
		$data['username']=$adress_info['username'];
		$data['telephone']=$adress_info['telephone'];
		$data['postalcode']=$adress_info['postalcode'];
		$data['detailed_address']=$adress_info['detailed_address'];
		$data['province_data']=$province_data;
		$data['city_data']=$city_data;
		$data['area_data']=$area_data;
		return $data;
	}
	/*
	 * 判断二维数组获取的数据有没有null，如果为null就将其变成空数组
	 * @param     array   $filed_array		待处理的字段
	 * @param     array   $data_array    待处理的数据
	 * @author    赵群
	 * @date      2015-08-10
	 * @return    json
	 * */
	static function transform_arr($filed_array,$data_array){
		$f_list = array();
		foreach($data_array as $vo){
			$f_list_2 = array();
			foreach($filed_array as $f_vo){
				if($vo[$f_vo]==null){
					$f_list_2[$f_vo]="";
				}else{
					$f_list_2[$f_vo]=$vo[$f_vo];
				}
			}
			$f_list[] = $f_list_2;
		}
		return $f_list;
	}
	/*
	 * 判断一维数组获取的数据有没有null，如果为null就将其变成空数组
	 * @param     array   $filed_array		待处理的字段
	 * @param     array   $data_array    待处理的数据
	 * @author    赵群
	 * @date      2015-08-11
	 * @return    json
	 * */
	static function transform_arr_2($filed_array,$data_array){
	   $f_list = array();
		foreach($filed_array as $f_vo){
			if($data_array[$f_vo]== null){
				$f_list[$f_vo]="";
			}else{
				$f_list[$f_vo]=$data_array[$f_vo];
			}
		}
		return $f_list;
	}
	/*
	 * 将常用时间格式(2015-08-11)转化成简单时间格式(15/8/11)
	 * @param     string   $time		待处理时间格式
	 * @author    陆龙飞
	 * @date      2015-08-26
	 * @return    string
	 * */
	static function briefTime($time){    
		return substr(str_replace('-','/',$time),2,9);
	}
	/*
	 * 获取银行卡
	 * @author    刘巧
	 * @date      2015-08-27
	 * @return    array
	*/
	static function get_bank_cache(){
		$cache_name = 'bank_cache';
		if(!F($cache_name)){
			$result = get_result('bank',array('status'=>1),'',' sort desc'); //查询所有正常状态的分类
			F($cache_name,$result);
		}else{
			$result=F($cache_name);
		}
		return $result;
	}
	/*
	 * 生成订单号
	 * @param     string   $time		待处理时间格式

	 * @author    刘巧
	 * @date      2015-08-27
	 * @return    string
	 * */
	static function getOrderNo() {
		$order_no=date('YmdHis').rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
		return $order_no;
	}
	
	
	/*
	 * 获取地区分类信息
	 * @author  龚双喜
	 * @date    2015-07-25
	 * */
	static function getAreaInfo($pid=0){

		$Model = "area";
		$map=array(
			"pid" =>$pid,
			"status" =>1
		);
		$area_info=get_result($Model,$map,true,'sort desc');
		return $area_info;
	}

	/**
	 * 生成随机字符串
	 * @param  int       $length  要生成的随机字符串长度
	 * @param  string    $type    随机码类型：0，数字+大小写字母；1，数字；2，小写字母；3，大写字母；4，特殊字符；-1，数字+大小写字母+特殊字符
	 * @return string  
	 * @author  陆龙飞
	 * @date    2015-08-29
	 */
	static function randCode($length = 5, $type = 0) {
		
		$arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
		if ($type == 0) {
			array_pop($arr);
			$string = implode("", $arr);
		} elseif ($type == "-1") {
			$string = implode("", $arr);
		} else {
			$string = $arr[$type];
		}
		$count = strlen($string) - 1;
		$code = '';
		for ($i = 0; $i < $length; $i++) {
			$code .= $string[rand(0, $count)];
		}
		return $code;
	}
	
	/**
	 * 	判断数组是否为数字
	 *	
	 * @author						刘巧
	 * @date						2015-8-29
	 * @return  					返回ture  false
	 */
	static function  is_num($arry){
		if(is_array($arry)){
			foreach($arry as $v){
				$status=is_numeric($v);						/* 循环判断数组值是不是数字 */
				if($status==false){
					$ret= false;
					break;								    /* 如果不是数字，跳出循环，并返回false */
				}else{
					$ret=true;								/* 都是数字返回true */
				}
			};
			return   $ret;
		}else{
			return	true;
		}	
	}
	
	/**
	 * 新建文件并写入内容，
	 * 功能说明，
	 * 		判断一个文件是否存在，不存在则创建，存在则创建文件名为定义的文件名后面加1，
	 * 		如(文件名为：file，如果该文件存在，则创建file1,如果file1存在则创建file2...以此类推)
	 * @param string $a				需要写入文件中的内容
	 * @param string $b				文件名(不带后缀)
	 * @param int    $c				创建的文件后面的数字后缀从哪一个数字开始
	 * @param string $d				文件的后缀名(不需要带"."，默认为'txt'后缀)
	 * @author						李东
	 * @date						2015-06-03
	 */
	static function open_file($a,$b,$c='',$d='txt'){
		@$open = fopen($b.$c.'.'.$d,'r');
		if($open){
			if(intval($c)){
				$c++;
			}else{
				$c=1;
			}
			self::open_file($a,$b,$c,$d);
		}else{
			$file=fopen($b.$c.'.'.$d,'w');
			$str = fwrite($file,"<?php \n".var_export($a, TRUE)."\n ?>");
			fclose($file);
		}
	}
	static function unicode2utf8($str){
			if(!$str) return $str;
			$decode = json_decode($str);
			if($decode) return $decode;
			$str = '["' . $str . '"]';
			$decode = json_decode($str);
			if(count($decode) == 1){
					return $decode[0];
			}
			return $str;
	}

	/*
	 *
	 * 截取
	 * @time    2015-09-09
	 * @author  陆龙飞
	 * @date    2015-09-8  
	 */
	static function substr_cut($user_name){
		$strlen      = mb_strlen($user_name, 'utf-8');
		$firstStr    = mb_substr($user_name, 0, 1, 'utf-8');
		$lastStr     = mb_substr($user_name, -1, 1, 'utf-8');
		return $strlen == 2 ? $firstStr . str_repeat('*', mb_strlen($user_name, 'utf-8') - 1) : $firstStr . str_repeat("*", $strlen - 2) . $lastStr;
	}
	
	
	 /*
	 * 检查用户支付密码  是否存在 是否正确 
	 * @param   int/string    $user_id     用户id
	 * @param   string        $password    交易密码
	 * @return  bool          
	 * @author  陆龙飞
	 * @date    2015-09-8  
	*/
	static function checkDealPassWord($user_id,$password){
		$user_id  = intval($user_id);
		$password = md5(md5($password));
		$map = array(
			'id'=>$user_id,
			'status' =>1,
		);
		$field  = array('id','deal_password');
		
		$result = get_info('user',$map,$field);      //关于表中有 id 为 -1的情况  异常
		if(!$result)                                return  array('status'=>'-2','info'=>'用户不存在或禁用！');
		if('' === $result['deal_password'])         return  array('status'=>'-1','info'=>'支付密码未设置!');
		if($password !=  $result['deal_password'])  return  array('status'=>'0','info'=>'支付密码不正确！');
		if($password === $result['deal_password'])  return  array('status'=>'1','info'=>'支付密码正确！');
		return array('status'=>'-3','info'=>'系统错误！');
	}
	
	/**
	* 对查询结果集进行排序
	* @access public
	* @param array $list 查询结果
	* @param string $field 排序的字段名
	* @param array $sortby 排序类型
	* asc正向排序 desc逆向排序 nat自然排序
	* @return array
	*/
	static function list_sort_by($list,$field, $sortby='asc') {
	   if(is_array($list)){
		   $refer = $resultSet = array();
		   foreach ($list as $i => $data)
			   $refer[$i] = &$data[$field];
		   switch ($sortby) {
			   case 'asc': // 正向排序
					asort($refer);
					break;
			   case 'desc':// 逆向排序
					arsort($refer);
					break;
			   case 'nat': // 自然排序
					natcasesort($refer);
					break;
		   }
		   foreach ( $refer as $key=> $val)
			   $resultSet[] = &$list[$key];
		   return $resultSet;
	   }
	   return false;
	}

	static function address_analytic($address_path,$area=array()){
			
		if(empty($area)) $area = self::get_area_cache();
		$str   = '';
		$arr   = explode('-',$address_path);
		$str  .= $area[$arr[2]]['title'];
		$str  .= $area[$arr[3]]['title'];
		$str  .= $area[$arr[4]]['title'];
		
		return $str;
	}
	/**
	 * 字符串截取，支持中文和其他编码
	 * @static
	 * @access public
	 * @param string $str 需要转换的字符串
	 * @param int $start 开始位置
	 * @param int $length 截取长度
	 * @param string $charset 编码格式
	 * @param string $suffix 截断显示字符
	 * @return string
	 */
	static function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
		if(function_exists("mb_substr")){
			$slice = mb_substr($str, $start, $length, $charset);
		}elseif(function_exists('iconv_substr')) {
			$slice = iconv_substr($str,$start,$length,$charset);
			if(false === $slice) {
				$slice = '';
			}
		}else{
			$re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
			$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
			$re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
			$re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
			preg_match_all($re[$charset], $str, $match);
			$slice = join("",array_slice($match[0], $start, $length));
		}
		if(strlen($str)<$length){
			$suffix=false;
		}
		return $suffix ? $slice.'...' : $slice;
	}

	//截取摘要的主要函数
	static function msubstr_tag($text,$length=150,$allowd_tag='') {
		//获取并整理所有内容
		$text = $text;
		$text = str_replace(']]>', ']]&gt;', $text);
		$text = trim($text);

		$suffix='';
		if($length > mb_strlen(strip_tags($text), 'utf-8')){
			$suffix='';
		}
		//获取选项
		if($allowd_tag==''){
			$allowd_tag='<a><b><blockquote><br><cite><code><dd><del><div><dl><dt><em><h1><h2><h3><h4><h5><h6><i><li><ol><p><pre><span><strong><ul>';
		}

		//去除标签
		$text = strip_tags($text, $allowd_tag);
		$text = trim($text);
		//计算字数，截取摘要
		$num = 0;
		$in_tag = false;
		for ($i=0; $num<$length || $in_tag; $i++) {
			if(mb_substr($text, $i, 1) == '<')
				$in_tag = true;
			elseif(mb_substr($text, $i, 1) == '>')
				$in_tag = false;
			elseif(!$in_tag)
				$num++;
		}
		$text = mb_substr($text,0,$i, 'utf-8');    
		$text = trim($text);
		$text = self::force_balance_tags($text);
		return $text.$suffix;
	}
	/**
	 * 标签自动补全（代码来源：wordpress）
	 *
	 * @since 2.0.4
	 *
	 * @author Leonard Lin <leonard@acm.org>
	 * @license GPL
	 * @copyright November 4, 2001
	 * @version 1.1
	 * @todo Make better - change loop condition to $text in 1.2
	 * @internal Modified by Scott Reilly (coffee2code) 02 Aug 2004
	 *		1.1  Fixed handling of append/stack pop order of end text
	 *			 Added Cleaning Hooks
	 *		1.0  First Version
	 *
	 * @param string $text Text to be balanced.
	 * @return string Balanced text.
	 */
	function force_balance_tags( $text ) {
		$tagstack = array();
		$stacksize = 0;
		$tagqueue = '';
		$newtext = '';
		// 已知自关闭标签
		$single_tags = array( 'area', 'base', 'basefont', 'br', 'col', 'command', 'embed', 'frame', 'hr', 'img', 'input', 'isindex', 'link', 'meta', 'param', 'source' );
		// 标签可以直接嵌套在自己
		$nestable_tags = array( 'blockquote', 'div', 'object', 'q', 'span' );

		// WP bug fix for comments - in case you REALLY meant to type '< !--'
		$text = str_replace('< !--', '<    !--', $text);
		// WP bug fix for LOVE <3 (and other situations with '<' before a number)
		$text = preg_replace('#<([0-9]{1})#', '&lt;$1', $text);

		while ( preg_match("/<(\/?[\w:]*)\s*([^>]*)>/", $text, $regex) ) {
			$newtext .= $tagqueue;

			$i = strpos($text, $regex[0]);
			$l = strlen($regex[0]);

			// clear the shifter
			$tagqueue = '';
			// Pop or Push
			if ( isset($regex[1][0]) && '/' == $regex[1][0] ) { // End Tag
				$tag = strtolower(substr($regex[1],1));
				// if too many closing tags
				if( $stacksize <= 0 ) {
					$tag = '';
					// or close to be safe $tag = '/' . $tag;
				}
				// if stacktop value = tag close value then pop
				elseif ( $tagstack[$stacksize - 1] == $tag ) { // found closing tag
					$tag = '</' . $tag . '>'; // Close Tag
					// Pop
					array_pop( $tagstack );
					$stacksize--;
				} else { // closing tag not at top, search for it
					for ( $j = $stacksize-1; $j >= 0; $j-- ) {
						if ( $tagstack[$j] == $tag ) {
						// add tag to tagqueue
							for ( $k = $stacksize-1; $k >= $j; $k--) {
								$tagqueue .= '</' . array_pop( $tagstack ) . '>';
								$stacksize--;
							}
							break;
						}
					}
					$tag = '';
				}
			} else { // Begin Tag
				$tag = strtolower($regex[1]);

				// Tag Cleaning

				// If it's an empty tag "< >", do nothing
				if ( '' == $tag ) {
					// do nothing
				}
				// ElseIf it presents itself as a self-closing tag...
				elseif ( substr( $regex[2], -1 ) == '/' ) {
					// ...but it isn't a known single-entity self-closing tag, then don't let it be treated as such and
					// immediately close it with a closing tag (the tag will encapsulate no text as a result)
					if ( ! in_array( $tag, $single_tags ) )
						$regex[2] = trim( substr( $regex[2], 0, -1 ) ) . "></$tag";
				}
				// ElseIf it's a known single-entity tag but it doesn't close itself, do so
				elseif ( in_array($tag, $single_tags) ) {
					$regex[2] .= '/';
				}
				// Else it's not a single-entity tag
				else {
					// If the top of the stack is the same as the tag we want to push, close previous tag
					if ( $stacksize > 0 && !in_array($tag, $nestable_tags) && $tagstack[$stacksize - 1] == $tag ) {
						$tagqueue = '</' . array_pop( $tagstack ) . '>';
						$stacksize--;
					}
					$stacksize = array_push( $tagstack, $tag );
				}

				// Attributes
				$attributes = $regex[2];
				if( ! empty( $attributes ) && $attributes[0] != '>' )
					$attributes = ' ' . $attributes;

				$tag = '<' . $tag . $attributes . '>';
				//If already queuing a close tag, then put this tag on, too
				if ( !empty($tagqueue) ) {
					$tagqueue .= $tag;
					$tag = '';
				}
			}
			$newtext .= substr($text, 0, $i) . $tag;
			$text = substr($text, $i + $l);
		}

		// Clear Tag Queue
		$newtext .= $tagqueue;

		// Add Remaining text
		$newtext .= $text;

		// Empty Stack
		while( $x = array_pop($tagstack) )
			$newtext .= '</' . $x . '>'; // Add remaining tags to close

		// WP fix for the bug with HTML comments
		$newtext = str_replace("< !--","<!--",$newtext);
		$newtext = str_replace("<    !--","< !--",$newtext);

		return $newtext;
	}
	/*
	*结果集数组格式化
	*参数说明：$result 数据库查询结果集，$by_filed 格式化后数组的key
	*@time 2015-05-20
	*@author 郭文龙 <2824682114@qq.com>
	*/
	static function array_format($result,$by_filed = ''){
		$format_array=array();
		foreach ($result as $row){
			if($by_filed==''){
				$format_array[$row['id']]=$row;
			}else{
				$format_array[$row[$by_filed]][]=$row;
			}
		}
		return $format_array;
	}
	/*
	 * 两个多维数组合并（后面值覆盖前面值）
	 **/
	static function array_overlay($a1=array(),$a2=array())
	{
		$diff = array_diff_key($a2,$a1);
		foreach($diff as $k => $v){
			$a1[$k] = $v;
		}
		foreach($a1 as $k => $v) {
			if (isset($a2[$k]) && $a2[$k]==="delete"){
				unset($a1[$k]);
				continue;
			};
			if(!array_key_exists($k,$a2)) continue;
			if(is_array($v) && is_array($a2[$k])){
				$a1[$k] = self::array_overlay($v,$a2[$k]);
			}else{
				$a1[$k] = $a2[$k];
			}
			
		}
		return $a1;
	}
	

	
	/*
	 * 判断远程文件图片是否存在
	 * @param   string	$url	服务地址
	 * @return	bool	    	判断结果   CURL有缓存效果
	 * @time 2015-09-16
	 * @author	陆龙飞  <747060156@qq.com>
	 * URL ：'http://'.$_SERVER['SERVER_NAME'].'/'.__ROOT__.'/''Uploads/ImgTemp/xxx.jpg'
	 **/
	static function check_remote_file_exists($url) {
		$curl = curl_init($url);
		/* 不取回数据 */
		curl_setopt($curl, CURLOPT_NOBODY, true);
		/* 发送请求 */
		$result = curl_exec($curl);
		$found  = false;
		/* 如果请求没有发送失败 */
		if ($result !== false) {
			/* 再检查http响应码是否为200 */
			$statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);  
			if ($statusCode == 200) {
				$found = true;   
			}
		}
		curl_close($curl);
	 
		return $found;
	}
	
	 /*
	 * 给app返回获取不同尺寸的图片
	 * @param   string	$save_path	保存路劲      'Uploads/ImgTemp/xxx.jpg'
	 * @return	string  $type       获取图片大小  'L','M','S'
	 * @time 2015-09-16
	 * @author	陆龙飞  <747060156@qq.com>
	 **/
	static function get_img_url($save_path,$width=120,$height=120,$type='M'){
		
		$save_path = strval($save_path);
		$path_arr  = explode('/',$save_path);
		$img_name = array_pop($path_arr);

		$path_arr[] =  $type.$img_name;
		$root=__ROOT__;
		if($root!=''){
				$host = DOMAIN_PATH.'/'.__ROOT__.'/';
		}else{
				$host = DOMAIN_PATH.'/';
		}
		$save_type_url=implode('/',$path_arr);
		if(file_exists($save_type_url)){
				 return $host.$save_type_url;             
		}else{
			thumb($save_path,$width,$height,$type);
			/* 如果出现图片确实不存在，thumb会生成默认图片地址  ！*/
			return $host.$save_type_url;
		}

	}
	
	static function  sub_string($content,$num){
		if(strlen($content)>$num*3){
			$content=mb_substr($content, 0, $num, 'utf-8').'....';
		}
		return $content;
	}
	static function  sub_telphone($telephone){
		$telephone=substr($telephone, 0, 3).'****'.substr($telephone, 7);
		return $telephone;
	}
	
	/*
	 * 根据id解析地址中文名称
	 *
	 * @author    刘巧
	 * @param     $province 省  $city 市  $area  区 
	 * @
	 * @date      2015-09-10
	 * @return    String
	*/
	static function analysis_address($province='',$city='',$area=''){
		$data = Cache::db_table('area');
		if(F($file)) return F($file);
		if(!F($file)){
			foreach($data as $v){
				$data_key[$v['id']]=$v;
			}
			F('data_key', $data_key);
		}
		$data_key=F('data_key');
		$str  .= $data_key[$province]['title'];
		$str  .= $data_key[$city]['title'];
		$str  .= $data_key[$area]['title'];
		return $str;
	}
	
	/*
	 * 获取设备默认配置缓存信息
	 * @time 2015-12-07
	 * @author llf <747060156@qq.com>
	 */
	static function get_device_config_cache() {
		
		$cache_name = 'device_default_config_cache';
		/* 判断缓存是否存在 */
		if (! F($cache_name)) {
			$map = array(
				'type'  =>1,  /* 设备配置 */
				'status'=>1,
				'version'=>1,
			);
			$field = array('title','key','value');

			$result = get_result ("device_config",$map,$field);
			$cache_result = array();
			foreach($result as $k=>$v){
				$cache_result[$v['key']] = json_decode($v['value'],true);
			}
			F($cache_name, $cache_result);
		}
		return F ( $cache_name );
	}
	
	/*
	 * 获取设备APP默认配置缓存信息
	 * @time 2015-12-07
	 * @author llf <747060156@qq.com>
	 */
	static function get_device_app_config_cache() {
		
		$cache_name = 'device_app_config_cache';
		/* 判断缓存是否存在 */
		if (!F($cache_name)){
			$map = array(
				'type'  =>2,  /* 设备配置 */
				'status'=>1,
			);
			$field = array('title','key','value');

			$result = get_result ("device_config",$map,$field);
			$cache_result = array();

			foreach($result as $k=>$v){
				$cache_result[$v['key']] = json_decode($v['value'],true);
			};
			F($cache_name, $cache_result);
		}
		return F($cache_name);
	}
	
	/*
		 二代系统配置
	*/
	static function get_device_app_config_cache_2() {
		
		$cache_name = 'device_app_config_cache_2';
		/* 判断缓存是否存在 */
		if (!F($cache_name)){
			$map = array(
				'type'  =>2,  /* 设备配置 */
				'status'=>1,
				'version'=>2,
			);
			$field = array('title','key','value');

			$result = get_result ("device_config",$map,$field);
			$cache_result = array();

			foreach($result as $k=>$v){
				$cache_result[$v['key']] = json_decode($v['value'],true);
			};
			F($cache_name, $cache_result);
		}
		return F($cache_name);
	}
	
	/* 二代缓存配置 非全局配置设备配置 */
	static function get_device_config_cache_2_0() {
		
		$cache_name = 'device_default_config_cache_2_0';

		/* 判断缓存是否存在 */
		if (!F($cache_name)) {
			$map = array(
				'type'  =>1,  	/* 设备配置 */
				'status'=>1,
				'version'=>2,
				'global'=>0,
			);
			$field = array('title','key','value');

			$result = get_result ("device_config",$map,$field);
			$cache_result = array();
			foreach($result as $k=>$v){
				$cache_result[$v['key']] = json_decode($v['value'],true);
			}
			F($cache_name, $cache_result);
		}
		return F ( $cache_name );
	}
	
	/* 二代缓存配置 全局配置设备配置 */
	static function get_device_config_cache_2_1() {
		
		$cache_name = 'device_default_config_cache_2_1';
		
		/* 判断缓存是否存在 */
		if (! F($cache_name)) {
			$map = array(
				'type'  =>1,  	/* 设备配置 */
				'status'=>1,
				'version'=>2,
				'global'=>1,
			);
			$field = array('title','key','value');

			$result = get_result ("device_config",$map,$field);
			$cache_result = array();
			foreach($result as $k=>$v){
				$cache_result[$v['key']] = json_decode($v['value'],true);
			}
			F($cache_name, $cache_result);
		}
		return F ( $cache_name );
	}
	/*
	 * 替换中文/数字为unicode,只替换一遍
	 * @time 2015-12-10
	 * @author llf <747060156@qq.com>
	 */
	static function rep_unicode($value){
		
		$replace = array(
			' '=>'0020',
			'0'=>'0030',
			'1'=>'0031',
			'2'=>'0032',
			'3'=>'0033',
			'4'=>'0034',
			'5'=>'0035',
			'6'=>'0036',
			'7'=>'0037',
			'8'=>'0038',
			'9'=>'0039',
			','=>'002c',
			'a'=>'0061',
			'b'=>'0062',
			'c'=>'0063',
			'd'=>'0064',
			'e'=>'0065',
			'f'=>'0066',
			'g'=>'0067',
			'h'=>'0068',
			'i'=>'0069',
			'j'=>'006a',
			'k'=>'006b',
			'm'=>'006d',
			'n'=>'006e',
			'o'=>'006f',
			'p'=>'0070',
			'q'=>'0071',
			'r'=>'0072',
			's'=>'0073',
			't'=>'0074',
			'u'=>'0075',
			'v'=>'0076',
			'w'=>'0077',
			'x'=>'0078',
			'y'=>'0079',
			'z'=>'000a',
			'A'=>'0041',
			'B'=>'0042',
			'C'=>'0043',
			'D'=>'0044',
			'E'=>'0045',
			'F'=>'0046',
			'G'=>'0047',
			'H'=>'0048',
			'I'=>'0049',
			'J'=>'004a',
			'K'=>'004b',
			'M'=>'004d',
			'N'=>'004e',
			'O'=>'004f',
			'P'=>'0050',
			'Q'=>'0051',
			'R'=>'0052',
			'S'=>'0053',
			'T'=>'0054',
			'U'=>'0055',
			'V'=>'0056',
			'W'=>'0057',
			'X'=>'0058',
			'Y'=>'0059',
			'Z'=>'005a',
			'~'=>'007e',
			'！'=>'ff01',
			'@'=>'0040',
			'#'=>'0023',
			'￥'=>'ffe5',
			'%'=>'0025',
			'&'=>'0026',
			'*'=>'002a',
			'（'=>'ff08',
			'）'=>'ff09',
			'('=>'0028',
			')'=>'0029',
			'-'=>'002d',
			'='=>'003d',
			'【'=>'3010',
			'】'=>'3011',
			'['=>'005b',
			']'=>'005d',
			':'=>'003a',
			';'=>'003b',
			'‘'=>'2019',
			'’'=>'2018',
			'“'=>'201d',
			'”'=>'u201d',
			'；'=>'ff1b',
			'：'=>'ff1a',
			','=>'002c',
			'.'=>'002e',
			'/'=>'002f',
			'?'=>'003f',
			'|'=>'007c',
			'`'=>'0060',
			'!'=>'0060',
			'…'=>'2026',
			'》'=>'300a',
			'《'=>'300b',
			'，'=>'ff0c',
			'、'=>'3001',
			'。'=>'3002',
			'^' =>'005e',
		);
		$temp = array();

		foreach(str_split($value) as $key=>$val){
			if(isset($replace[$val])){
				$temp[] = $replace[$val];
			}else{
				$temp[] = $val;
			}
		}
		$str = implode('',$temp);
		return str_replace('\\u', '', trim(json_encode($str), '"'));
	}
	
	
	/**
	 * 
	 * @param string $latlngs	需要查询的经度与纬度 格式(纬度,经度;纬度,经度;)最多支持100组经纬度组合
	 * @return array()			返回地址信息
	 * 							formatted_addressd	地址名称
	 * 							addressComponent	地址信息拆分组合
	 * 							pois				周边信息
	 * @author					llf
	 * @date					2015-11-25
	 */
	static function getaddresdetail($latlngs){
		
		$_url    = sprintf('http://api.map.baidu.com/geocoder/v2/?ak=1ymhpQR4DO51gDQAdb1rUZh3&location='.$latlngs.'&output=json&pois=1');
		$_result = false;
		if($_result = file_get_contents($_url)) {
			$_result = json_decode($_result,true);
			$_coords = $_result['result'];
		}
		return $_coords;
	}
	
	static function get_time($time){
		$t = str_split(trim($time));
		return $t[0].$t[1].$t[2].$t[3].'-'.$t[4].$t[5].'-'.$t[6].$t[7].' '.$t[8].$t[9].':'.$t[10].$t[11].':'.$t[12].$t[13]; 
	}
	
	
	/*
	 * 记录日志
	 * @time 2015-08-06
	 * @param string $file_path 文件目录（基于Runtime/Logs/Class）
	 * @param string $content 内容
	 * @return boolean 状态
	 * @author	秦晓武  <525249206@qq.com>
	 * */
	static function write_log($file_path="",$content=""){
		
		if(!$content || !$file_path){
			return false;
		}    
		$dir = RUNTIME_PATH . 'Logs' . DIRECTORY_SEPARATOR . 'Class';
		if(!is_dir($dir)){ 
				if(!mkdir($dir)){
					return false;
				}
		}
		$file_path = str_replace('/','_',$file_path);
		$file_path = str_replace('\\','_',$file_path);
			$dir = $dir . DIRECTORY_SEPARATOR . $file_path;
		if(!is_dir($dir)){ 
				if(!mkdir($dir)){
					return false;
				}
		}
		$filename = $dir . DIRECTORY_SEPARATOR . date("Ymd",time()) . '.log.php';   
		$logs = include $filename;
		if($logs && !is_array($logs)){
		  unlink($filename);
		  return false;
		}
		$logs[] = date("Y-m-d H:i:s") . ' : ' . $content;
		$str = "<?php \r\n return " . var_export($logs, true) . ";";
		if(!$fp = @fopen($filename,"wb")){
		  return false;
		}           
		if(!fwrite($fp, $str))return false;
		fclose($fp);
		return true;
   }
  
  static function get_query($sql){
	  
 	 	$pdo = new PDO("mysql:host=192.168.1.197;port=3306;dbname=device","llf","llf");
		// die($sql);
 	    $res = $pdo->query($sql);
	    return $res->fetchAll(PDO::FETCH_ASSOC);
  }
  
  static function get_query_insert($sql){
	   
 	 	$pdo = new PDO("mysql:host=192.168.1.197;port=3306;dbname=device","llf","llf");
 	    $res = $pdo->exec($sql);
		if(!$res) die($pdo->errorCode()); 
	    return $res;
  }
  
}
