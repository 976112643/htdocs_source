<?php
// =========== 数据增删改查操作 start ==========//
// 获取数据集
function get_result($Model, $map = array(), $field = array(), $order = '', $limit = 0, $group = '', $having = '') {
	if (is_string ( $Model )) {
		$Model = M ( $Model );
	}
	if ($limit == 0) {
		$limit = '';
	}
	$result = $Model->where ( $map )->field ( $field )->order ( $order )->group ( $group )->having ( $having )->limit ( $limit )->select ();
	if (C ( 'SESSION_SQL' )) {
		session ( 'sql', $Model->getLastSql () );
	}
	return $result;
}

// 获取单条数据
function get_info($Model, $map = array(), $field = array(), $order = '') {
	if (is_string ( $Model )) {
		$Model = M ( $Model );
	}
	$result = $Model->where ( $map )->field ( $field )->order ( $order )->find ();
	if (C ( 'SESSION_SQL' )) {
		session ( 'sql', $Model->getLastSql () );
	}
	return $result;
}
// 添加、更新数据
function update_data($Model, $rules = array(), $map = array(), $data = array()) {
	if (is_string ( $Model )) {
		$Model = M ( $Model );
	}
	if(empty($data)) {
		$data = $_POST;
	}
	$data = $Model->validate ( $rules )->create ($data);
	if (! $data) { // 数据对象创建错误
		return $Model->getError ();
	}
	if (empty ( $map ) && (empty ( $data ['id'] ) || $data ['id'] == 0)) {
		$data ['add_time'] = time();
		$result = $Model->add ( $data );
	} else {
		$data ['update_time'] = time();
		if (! empty ( $map )) {
			$result = $Model->where ( $map )->save ( $data );
		} else {
			$result = $Model->save ( $data );
		}
		if (is_numeric ( $result ) && empty($map)) {
			$result = $data ['id'];
		}
		
	}
	if (C ( 'SESSION_SQL' )) {
		session ( 'sql', $Model->getLastSql () );
	}
	return $result;
}
// 添加数据
function add_data($Model, $rules = array(), $map = array()) {
	if (is_string ( $Model )) {
		$Model = M ( $Model );
	}
	// 创建数据对象
	$data = $Model->validate ( $rules )->create ();
	if (! $data) { // 数据对象创建错误
		return $Model->getError ();
	}
	$res = $Model->add ( $data );
	if (C ( 'SESSION_SQL' )) {
		session ( 'sql', $Model->getLastSql () );
	}
	return $res;
}
// 删除数据
function delete_data($Model, $map = array()) {
	if (is_string ( $Model )) {
		$Model = M ( $Model );
	}
	$Model->where ( $map )->delete ();
	if (C ( 'SESSION_SQL' )) {
		session ( 'sql', $Model->getLastSql () );
	}
	return true;
}
// 统计数据
function count_data($Model, $map = array(), $field = 'id') {
	if (is_string ( $Model )) {
		$Model = M ( $Model );
	}
	$count = $Model->where ( $map )->count ( $field );
	if (C ( 'SESSION_SQL' )) {
		session ( 'sql', $Model->getLastSql () );
	}
	return $count;
}
/*
 * 查询数据的sql操作
 */
function query_sql($sql) { // 查询数据的sql操作
	$result = M ()->query ( $sql );
	session ( 'sql', $Model->getLastSql () );
	return $result;
}

/*
 * 更新和写入数据的sql操作
 */
function execute_sql($sql) { // 更新和写入数据的sql操作
	$result = M ()->execute ( $sql );
	session ( 'sql', $Model->getLastSql () );
	return $result;
}

/*
 * 创建数据缓存
 * @time 2014-01-16
 * @author 郭文龙 <2824682114@qq.com>
 */
function get_cache_data($result, $cache_name, $by_filed) {
	if ($cache_name != '') {
		if (! F ( $cache_name )) {
			$cache_data = array ();
			foreach ( $result as $row ) {
				if ($by_filed == '') {
					$cache_data [$row ['id']] = $row;
				} else {
					$cache_data [$row [$by_filed]] [] = $row;
				}
			}
			F ( $cache_name, $cache_data );
		}
		return F ( $cache_name );
	}
}

// =========== 数据增删改查操作 end ==========//

/*
 * 产生面包屑导航
 */
function get_crumbs($crumbs=array(),$delimiter=' &gt; '){
	$str='';
	foreach($crumbs as $val){
		$href_str='';
		if($val['url']!=''){
			$href_str='href="'.$val['url'].'"';
		}
		$str.='<a '.$href_str.'>'.$val['title'].'</a>'.$delimiter;
	}
	$str=rtrim($str,$delimiter);
	return $str;
}
function list_to_tree($list, $pk = 'id', $pid = 'pid', $child = '_child', $root = 0, $key = '') {
	// 创建Tree
	$tree = array ();
	if (is_array ( $list )) {
		// 创建基于主键的数组引用
		$refer = array ();
		foreach ( $list as $k => $data ) {
			$refer [$data [$pk]] = & $list [$k];
		}
		foreach ( $list as $k => $data ) {
			// 判断是否存在parent
			$parentId = $data [$pid];
			if ($root == $parentId) {
				if ($key != '') {
					$tree [$data [$key]] = & $list [$k];
				} else {
					$tree [] = & $list [$k];
				}
			} else {
				if (isset ( $refer [$parentId] )) {
					$parent = & $refer [$parentId];
					if ($key != '') {
						$parent [$child] [$data [$key]] = & $list [$k];
					} else {
						$parent [$child] [] = & $list [$k];
					}
				}
			}
		}
	}
	return $tree;
}
function int_to_string($data, $map = array('status'=>array(1=>'正常',-1=>'删除',0=>'禁用'))) {
	if ($data === false || $data === null) {
		return $data;
	}
	$data = ( array ) $data;
	foreach ( $data as $key => $row ) {
		foreach ( $map as $col => $pair ) {
			if (isset ( $row [$col] ) && isset ( $pair [$row [$col]] )) {
				$data [$key] [$col . '_text'] = $pair [$row [$col]];
			}
		}
	}
	return $data;
}
// 根据字段的值进行数组过滤
function assoc_unique($arr, $key) {
	$tmp_arr = array ();
	foreach ( $arr as $k => $v ) {
		if (in_array ( $v [$key], $tmp_arr )) { // 搜索$v[$key]是否在$tmp_arr数组中存在，若存在返回true
			unset ( $arr [$k] );
		} else {
			$tmp_arr [] = $v [$key];
		}
	}
	return $arr;
}

/*
 * 多图上传
 * $picture_ids 临时图片ID
 * $folder 上传目录
 * $table 图片保存数据表
 * $table_key_field 图片保存数据表对应字段名ID
 * $table_key_value 图片保存数据表的ID值
 * $image_field
 */
function multi_file_upload($picture_ids, $folder, $table, $table_key_field, $table_key_value, $image_field = 'image') {
	$return = false;
	if ($picture_ids != '') {
		$new_folder = mk_dir ( $folder );
		if ($new_folder == true) {
			$new_folder = $folder;
		} else if ($new_folder == false) {
			return '目录创建失败';
		}
		if (is_array ( $picture_ids )) {
			$picture_ids = implode ( ',', $picture_ids );
		}
		$picture_ids = addslashes ( $picture_ids );
		
		if ($picture_ids == '') {
			$picture_ids = '0';
		}
		$result = get_result ( "file", array (
				'id' => array (
						'in',
						$picture_ids 
				) 
		), "file_name,save_path" );
		$msg = '';
		foreach ( $result as $row ) {
			$path = ltrim ( $row ['save_path'], '/' );
			$file_name = basename ( $path );
			$new_path = $new_folder . '/' . $file_name;
			copy ( $path, $new_path );
			@unlink ( $path );
			$_POST = null;
			$_POST ['file_name'] = $row ['file_name'];
			$_POST [$image_field] = $new_path;
			$_POST [$table_key_field] = $table_key_value;
			$return = update_data($table);
		}
		delete_data ( "file", array (
				'id' => array (
						'in',
						$picture_ids 
				) 
		) );
	}
	return $return;
}
/*
 * 创建目录
 * 可循环创建
 */
function mk_dir($dir, $mode = 0777) {
	if(is_dir($dir) || @mkdir($dir, $mode, true)) {
		return true;
	}
	if(!mk_dir(dirname($dir), $mode)) {
		return false;
	}
}

/*
 * 生成缩略图
 * $image 传入的图片路径
 * $width 宽度
 * $height 高度
 * $prefix 前缀 l-large / m-middle / s-small
 * $thumb_path 缩略图保存位置
 * $default 没有图片时，默认返回图片
 */
function thumb($image, $width = 200, $height = 200, $prefix = 'S', $default_pic = '/Public/Home/img/default_pic/list_pic.png') {
	if (! in_array ( $prefix, array (
			'L',
			'M',
			'S' 
	) )) {
		return "缩略图前缀只能使用L、M、S";
	}
	if (file_exists ( $image )) {
		$name = basename ( $image );
		
		$new_image = dirname ( $image ) . '/' . $prefix . $name;
		
		if (! file_exists ( $new_image ) && file_exists ( $image )) {
			$think_image = new \Think\Image ();
			$think_image->open ( $image );
			// 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.jpg
			$think_image->thumb ( $width, $height )->save ( $new_image );
		}
		return __ROOT__ . '/' . $new_image;
	} else {
		return __ROOT__ . $default_pic;
	}
}

/*
 * 删除缩略图
 * $image 传入的图片路径
 */
function delThumb($image) {
	if (file_exists ( $image )) {
		@unlink ( $image );
	} else {
		return false;
	}
	$name = basename ( $image );
	$thumb_l = dirname ( $image ) . '/L' . $name;
	if (file_exists ( $thumb_l )) {
		@unlink ( $thumb_l );
	}
	$thumb_m = dirname ( $image ) . '/M' . $name;
	if (file_exists ( $thumb_m )) {
		@unlink ( $thumb_m );
	}
	$thumb_s = dirname ( $image ) . '/S' . $name;
	if (file_exists ( $thumb_s )) {
		@unlink ( $thumb_s );
	}
	return true;
}
/**
 * 字符串截取，支持中文和其他编码
 * 
 * @static
 *
 * @access public
 * @param string $str
 *        	需要转换的字符串
 * @param string $start
 *        	开始位置
 * @param string $length
 *        	截取长度
 * @param string $charset
 *        	编码格式
 * @param string $suffix
 *        	截断显示字符
 * @return string
 */
function msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = true) {
	if (function_exists ( "mb_substr" )) {
		$slice = mb_substr ( $str, $start, $length, $charset );
	} elseif (function_exists ( 'iconv_substr' )) {
		$slice = iconv_substr ( $str, $start, $length, $charset );
		if (false === $slice) {
			$slice = '';
		}
	} else {
		$re ['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
		$re ['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
		$re ['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
		$re ['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
		preg_match_all ( $re [$charset], $str, $match );
		$slice = join ( "", array_slice ( $match [0], $start, $length ) );
	}
	if (strlen ( $str ) < $length) {
		$suffix = false;
	}
	return $suffix ? $slice . '...' : $slice;
}

// 截取摘要的主要函数
function msubstr_tag($text, $length = 150, $allowd_tag = '') {
	// 获取并整理所有内容
	$text = $text;
	$text = str_replace ( ']]>', ']]&gt;', $text );
	$text = trim ( $text );
	
	$suffix = '';
	if ($length < mb_strlen ( strip_tags ( $text ), 'utf-8' )) {
		$suffix = '...';
	}else{
		return $text;
	}
	// 获取选项
	if ($allowd_tag == '') {
		$allowd_tag = '<a><b><blockquote><br><cite><code><dd><del><div><dl><dt><em><h1><h2><h3><h4><h5><h6><i><li><ol><p><pre><span><strong><ul>';
	}
	
	// 去除标签
	$text = strip_tags ( $text, $allowd_tag );
	$text = trim ( $text );
	// 计算字数，截取摘要
	$num = 0;
	$in_tag = false;
	for($i = 0; $num < $length || $in_tag; $i ++) {
		if (mb_substr ( $text, $i, 1 ) == '<')
			$in_tag = true;
		elseif (mb_substr ( $text, $i, 1 ) == '>')
			$in_tag = false;
		elseif (! $in_tag)
			$num ++;
	}
	$text = mb_substr ( $text, 0, $i, 'utf-8' );
	$text = trim ( $text );
	$text = force_balance_tags ( $text );
	return $text . $suffix;
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
 *           1.1 Fixed handling of append/stack pop order of end text
 *           Added Cleaning Hooks
 *           1.0 First Version
 *          
 * @param string $text
 *        	Text to be balanced.
 * @return string Balanced text.
 */
function force_balance_tags($text) {
	$tagstack = array ();
	$stacksize = 0;
	$tagqueue = '';
	$newtext = '';
	// 已知自关闭标签
	$single_tags = array (
			'area',
			'base',
			'basefont',
			'br',
			'col',
			'command',
			'embed',
			'frame',
			'hr',
			'img',
			'input',
			'isindex',
			'link',
			'meta',
			'param',
			'source' 
	);
	// 标签可以直接嵌套在自己
	$nestable_tags = array (
			'blockquote',
			'div',
			'object',
			'q',
			'span' 
	);
	
	// WP bug fix for comments - in case you REALLY meant to type '< !--'
	$text = str_replace ( '< !--', '<    !--', $text );
	// WP bug fix for LOVE <3 (and other situations with '<' before a number)
	$text = preg_replace ( '#<([0-9]{1})#', '&lt;$1', $text );
	
	while ( preg_match ( "/<(\/?[\w:]*)\s*([^>]*)>/", $text, $regex ) ) {
		$newtext .= $tagqueue;
		
		$i = strpos ( $text, $regex [0] );
		$l = strlen ( $regex [0] );
		
		// clear the shifter
		$tagqueue = '';
		// Pop or Push
		if (isset ( $regex [1] [0] ) && '/' == $regex [1] [0]) { // End Tag
			$tag = strtolower ( substr ( $regex [1], 1 ) );
			// if too many closing tags
			if ($stacksize <= 0) {
				$tag = '';
				// or close to be safe $tag = '/' . $tag;
			}			// if stacktop value = tag close value then pop
			elseif ($tagstack [$stacksize - 1] == $tag) { // found closing tag
				$tag = '</' . $tag . '>'; // Close Tag
				                          // Pop
				array_pop ( $tagstack );
				$stacksize --;
			} else { // closing tag not at top, search for it
				for($j = $stacksize - 1; $j >= 0; $j --) {
					if ($tagstack [$j] == $tag) {
						// add tag to tagqueue
						for($k = $stacksize - 1; $k >= $j; $k --) {
							$tagqueue .= '</' . array_pop ( $tagstack ) . '>';
							$stacksize --;
						}
						break;
					}
				}
				$tag = '';
			}
		} else { // Begin Tag
			$tag = strtolower ( $regex [1] );
			
			// Tag Cleaning
			
			// If it's an empty tag "< >", do nothing
			if ('' == $tag) {
				// do nothing
			}			// ElseIf it presents itself as a self-closing tag...
			elseif (substr ( $regex [2], - 1 ) == '/') {
				// ...but it isn't a known single-entity self-closing tag, then don't let it be treated as such and
				// immediately close it with a closing tag (the tag will encapsulate no text as a result)
				if (! in_array ( $tag, $single_tags ))
					$regex [2] = trim ( substr ( $regex [2], 0, - 1 ) ) . "></$tag";
			}			// ElseIf it's a known single-entity tag but it doesn't close itself, do so
			elseif (in_array ( $tag, $single_tags )) {
				$regex [2] .= '/';
			} 			// Else it's not a single-entity tag
			else {
				// If the top of the stack is the same as the tag we want to push, close previous tag
				if ($stacksize > 0 && ! in_array ( $tag, $nestable_tags ) && $tagstack [$stacksize - 1] == $tag) {
					$tagqueue = '</' . array_pop ( $tagstack ) . '>';
					$stacksize --;
				}
				$stacksize = array_push ( $tagstack, $tag );
			}
			
			// Attributes
			$attributes = $regex [2];
			if (! empty ( $attributes ) && $attributes [0] != '>')
				$attributes = ' ' . $attributes;
			
			$tag = '<' . $tag . $attributes . '>';
			// If already queuing a close tag, then put this tag on, too
			if (! empty ( $tagqueue )) {
				$tagqueue .= $tag;
				$tag = '';
			}
		}
		$newtext .= substr ( $text, 0, $i ) . $tag;
		$text = substr ( $text, $i + $l );
	}
	
	// Clear Tag Queue
	$newtext .= $tagqueue;
	
	// Add Remaining text
	$newtext .= $text;
	
	// Empty Stack
	while ( $x = array_pop ( $tagstack ) )
		$newtext .= '</' . $x . '>'; // Add remaining tags to close
			                             
	// WP fix for the bug with HTML comments
	$newtext = str_replace ( "< !--", "<!--", $newtext );
	$newtext = str_replace ( "<    !--", "< !--", $newtext );
	
	return $newtext;
}
/**
 * 系统邮件发送函数
 * 
 * @param string $to
 *        	接收邮件者邮箱
 * @param string $name
 *        	接收邮件者名称
 * @param string $subject
 *        	邮件主题
 * @param string $body
 *        	邮件内容
 * @param string $attachment
 *        	附件列表
 * @return boolean
 */
function send_mail($to, $name, $subject = '', $body = '') {
	vendor ( 'PHPMailer.class#phpmailer' ); // 从PHPMailer目录导class.phpmailer.php类文件
	
	$mail = new PHPMailer (); // PHPMailer对象
	$mail->CharSet = 'UTF-8'; // 设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
	$mail->IsSMTP (); // 设定使用SMTP服务
	$mail->SMTPDebug = 0;
	// $mail->SMTPDebug = 1; // 关闭SMTP调试功能
	// 1 = errors and messages
	// 2 = messages only
	$mail->SMTPAuth = true; // 启用 SMTP 验证功能
	                        // $mail->SMTPAuth = false; // 启用 SMTP 验证功能 如果为false则不用填写用户名密码也可以发送Email
	                        // $mail->SMTPSecure = 'ssl'; // 使用安全协议
	$mail->Host = C ( 'SMTP_HOST' ); // SMTP 服务器
	$mail->Port = C ( 'SMTP_PORT' ); // SMTP服务器的端口号
	$mail->Username = C ( 'SMTP_USER' ); // SMTP服务器用户名
	$mail->Password = C ( 'SMTP_PASS' ); // SMTP服务器密码
	
	$mail->SetFrom ( C ( 'FROM_EMAIL' ), C ( 'FROM_NAME' ) );
	
	$mail->FromName = C ( 'FROM_NAME' );
	$mail->From = C ( 'FROM_EMAIL' );
	
	$mail->Subject = $subject;
	$mail->MsgHTML ( $body );
	
	$mail->AddAddress ( $to, $name );
	
	$return_info = $mail->Send () ? true : $mail->ErrorInfo;
	
	return $return_info;
}

/**
 * 返回路径中的参数
 * 
 * @author 康利民 <3027788306@qq.com> 2015-01-30
 *        
 * @param $add array
 *        	需要添加的参数
 * @param $del string
 *        	需要过滤掉的参数，使用逗号分隔
 * @return 参数数组
 * @example 说明：给url添加排序条件sort，同时删除掉url中的category和author参数及它们的值
 *          I("index",param(array('sort'=>'id'),'category,author'))
 */
function param($add = array(), $del = '') {
	$arr = array_merge ( I ( 'get.' ), $add );
	$delArr = explode ( ',', $del );
	foreach ( $delArr as $val ) {
		unset ( $arr [$val] );
	}
	return $arr;
}
/*
 * 返回真实路径
 */
function assUrl($url) {
	$menu ['url'] = $url;
	$chars = "/((^http)|(^https)|(^ftp)):\/\/(\S)+\.(\w)+/";
	if (! preg_match ( $chars, $menu ['url'] )) {
		$return_url = __ROOT__ . '/' . $url;
	} else {
		$return_url = $url;
	}
	return $return_url;
}
/**
 * 系统加密方法
 * 
 * @param string $data
 *        	要加密的字符串
 * @param string $key
 *        	加密密钥
 * @param int $expire
 *        	过期时间 单位 秒
 * @return string
 */
function think_encrypt($data, $key = '', $expire = 0) {
	$key = md5 ( empty ( $key ) ? C ( 'SECURITY_AUTHKEY' ) : $key );
	$data = base64_encode ( $data );
	$x = 0;
	$len = strlen ( $data );
	$l = strlen ( $key );
	$char = '';
	
	for($i = 0; $i < $len; $i ++) {
		if ($x == $l)
			$x = 0;
		$char .= substr ( $key, $x, 1 );
		$x ++;
	}
	
	$str = sprintf ( '%010d', $expire ? $expire + time () : 0 );
	
	for($i = 0; $i < $len; $i ++) {
		$str .= chr ( ord ( substr ( $data, $i, 1 ) ) + (ord ( substr ( $char, $i, 1 ) )) % 256 );
	}
	return str_replace ( array (
			'+',
			'/',
			'=' 
	), array (
			'-',
			'_',
			'' 
	), base64_encode ( $str ) );
}

/**
 * 系统解密方法
 * 
 * @param string $data
 *        	要解密的字符串 （必须是think_encrypt方法加密的字符串）
 * @param string $key
 *        	加密密钥
 * @return string
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function think_decrypt($data, $key = '') {
	$key = md5 ( empty ( $key ) ? C ( 'SECURITY_AUTHKEY' ) : $key );
	$data = str_replace ( array (
			'-',
			'_' 
	), array (
			'+',
			'/' 
	), $data );
	$mod4 = strlen ( $data ) % 4;
	if ($mod4) {
		$data .= substr ( '====', $mod4 );
	}
	$data = base64_decode ( $data );
	$expire = substr ( $data, 0, 10 );
	$data = substr ( $data, 10 );
	
	if ($expire > 0 && $expire < time ()) {
		return '';
	}
	$x = 0;
	$len = strlen ( $data );
	$l = strlen ( $key );
	$char = $str = '';
	
	for($i = 0; $i < $len; $i ++) {
		if ($x == $l)
			$x = 0;
		$char .= substr ( $key, $x, 1 );
		$x ++;
	}
	
	for($i = 0; $i < $len; $i ++) {
		if (ord ( substr ( $data, $i, 1 ) ) < ord ( substr ( $char, $i, 1 ) )) {
			$str .= chr ( (ord ( substr ( $data, $i, 1 ) ) + 256) - ord ( substr ( $char, $i, 1 ) ) );
		} else {
			$str .= chr ( ord ( substr ( $data, $i, 1 ) ) - ord ( substr ( $char, $i, 1 ) ) );
		}
	}
	return base64_decode ( $str );
}
// 获取传递过来的字符中的所有本地图片
function getImgs($content, $order = '') {
	$pattern = "/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/";
	preg_match_all ( $pattern, $content, $match );
	if (isset ( $match [1] ) && ! empty ( $match [1] )) {
		if ($order != '' && is_numeric ( $order ) && isset ( $match [1] [$order] )) {
			return $match [1] [$order];
		} else {
			return $match [1];
		}
	}
	return '';
}
// 删除传递过来的字符中的所有本地图片
function delStrImgs($content) {
	// 获取字符中的所有图片
	$img_list = getImgs ( $content );
	foreach ( $img_list as $key => $val ) {
		if (file_exists ( $val )) {
			@unlink ( $val );
		}
	}
	return '';
}
// 替换/还原本地图片路径
function replaceStrImg($str, $type = "") {
	if ($type == "replace") {
		$str = str_replace ( 'http://' . $_SERVER ['SERVER_NAME'], '', $str );
		$str = str_replace ( 'https://' . $_SERVER ['SERVER_NAME'], '', $str );
		$str = str_replace ( __ROOT__ . '/Uploads', 'Uploads', $str );
	} else {
		$str = str_replace ( 'Uploads', __ROOT__ . '/Uploads', $str );
	}
	return $str;
}
/*
 * 文件上传（单个|多个）
 * $md5			临时文件md5
 * $folder 		上传目录
 * $table 		图片保存数据表
 * $field 		图片保存数据表对应字段名ID
 * $value 		图片保存数据表的ID值
 * $file_field	文件路径保存字段
 */
function file_upload_multi($md5, $folder, $table, $field, $value, $file_field = 'image') {
	$return = '';
	if($md5 != '') {
		$new_folder = mk_dir($folder);
		if($new_folder == true) {
			$new_folder = $folder;
		}elseif($new_folder == false) {
			return '目录创建失败';
		}
		if(is_array($md5)) {
			$md5 = implode(',', $md5);
		}
		$md5 = addslashes($md5);
		if($md5 == '') {
			$md5 = '0';
		}
		$map = array(
			'md5'=> array('IN', $md5)	
		);
		$result = get_result('file', $map, 'file_name,save_path');
		$msg = '';
		foreach($result as $row) {
			$path = ltrim($row['save_path'], '/');
			$file_name = basename($path);
			$new_path = $new_folder . '/' . $file_name;
			copy($path, $new_path);
			@unlink($path);
			$data = array(
				'file_name'=> $row['file_name'],
				$file_field=> $new_path,
				$field=> $value,
			);
			$return = update_data($table, array(), array(), $data);
		}
		delete_data('file', $map);
	}
	return $return;
}