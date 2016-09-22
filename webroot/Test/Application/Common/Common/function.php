<?php
include 'core.php';

/*
 * 导航数据缓存
 * @time 2015-01-21
 * @author 郭文龙 <2824682114@qq.com>
 */
function getNavigation() {
	$cache_name = 'navigation_result';
	// 判断缓存是否存在
	if (! F ( $cache_name )) {
		$cache_result = get_result ( 'navigation', array (
				'status' => 1 
		), '', 'sort desc,id asc' );
		$result = get_cache_data ( $cache_result, $cache_name, 'type' );
	} else {
		$result = F ( $cache_name );
	}
	return $result;
}
/*
 * 获取首页广告数据
 * @time 2015-05-05
 * @author 康利民 <3027788306@qq.com>
 */
function getBanner($type) {
	$cache_name = 'banner_cache';
	// 判断缓存是否存在
	if ( !F ( $cache_name )) {
		$cur_date = date ( "Y-m-d H:i:s", time () );
		$map ['start_time'] = array (
				"elt",
				$cur_date 
		);
		$map ['end_time'] = array (
				"egt",
				$cur_date
		);
		$map ['is_hid'] = 0;
		$map ['is_del'] = 0;
		$cache_result = get_result ( "banner", $map, '', 'sort desc,id asc' );
		$result = get_cache_data ( $cache_result, $cache_name );
	} else {
		$result = F ( $cache_name );
	}
	$type_data =array();
	foreach($result as $key=>$val){
		if($val['page'] === $type) $type_data[] = $val;
	}
	return $type_data;
}
// 删除当前传递过来的图片（包括自动生成的三种型号的缩略图）
function delImgAll($path) {
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

/*
 * CURL get 提交数据
 * */
function curl_get($url,$ssl=false){
	/* 初始化 */
	$ch = curl_init();
	/* 设置选项，包括URL */
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	if($ssl){
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//这个是重点。
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	}
	/* 执行并获取HTML文档内容 */
	$output = curl_exec($ch);
	/* 释放curl句柄 */
	curl_close($ch);
	/* 返回获得的数据 */
	return $output;
}
/*
 * 短信发送接口
 * */
function sms($mobile,$content){
	$name="a15623973029";
	$pwd=md5("xi199410");
	$url="http://106.ihuyi.cn/webservice/sms.php?method=Submit&account=".$name."&password=".$pwd."&mobile=".$mobile."&content=".$content;
	//	$status=curl_get($url);
	$string = curl_get($url);
	$xml = xml_parser_create();
	xml_parse_into_struct($xml, $string, $values);
	xml_parser_free($xml);
	//	if($status!=2 || $status!=''){
	//		return smsReturnTextIhuiyi($status);
	$status = $values[1]['value'];
	if($status != 2){
		return $values[3]['value'];
	}else{
		return $status;
	}
}
/*
 * 地区数据缓存
 * @time 2015-01-21
 * @author 郭文龙 <2824682114@qq.com>
 */
function get_area_cache() {
	$cache_name = 'area_data';
	if (! F ( $cache_name )) {
		$cache_result = get_result ( 'area', array (
				'is_hid' => 0,'is_del'=>0 
		), '', 'sort desc' );
		$result = get_cache_data ( $cache_result, 'area_data' );
	} else {
		$result = F ( $cache_name );
	}
	return $result;
}
/**
 * 导航缓存
 * @param 导航类型  $type
 * @return mixed 
 */
function get_navigation($type){
	$cache_name = 'navigation_'.$type.'_cache';
	if(!F($cache_name)){
		$map['is_del'] = 0;
		$map['is_hid'] = 0;
		$map['type'] = $type;
		$result = get_result('navigation',$map,true,'sort desc,id desc');
		$result = get_cache_data($result,$cache_name);
	}else{
		$result = F ($cache_name);
	}
	return $result;
}
/**
 * 友情链接缓存
 * 1、有缓存读取缓存
 * 2、没缓存生成缓存
 * @return mixed
 */
function get_friend_link(){
	$cache_name = 'friend_link_cache';
	if(!F($cache_name)){
		$map['is_del'] = 0;
		$map['is_hid'] = 0;
		$result = get_result('friend_link',$map,true,'sort desc,id desc');
		$result = get_cache_data($result,$cache_name);
	}else{
		$result = F ($cache_name);
	}
	return $result;
}
/**
 * 推荐新闻缓存
 * @param 要获取数据的条数 $limt
 * @return 推荐新闻的详细信息
 */
function recommend_new_cache ($limt='10'){
	$cache_name = 'recommend_new_cache';
	if(!F($cache_name)){
		$map['is_del'] = 0 ;
		$map['is_hid'] = 0 ;
		$map['recommend'] = 1;
		$result = get_result('article',$map,true,'sort desc,addtime desc',$limt);
		$result = F($cache_name,$result);
	}else{
		$result = F($cache_name);
	}
	return $result;
}
/**
 * 文章分类缓存
 * 1、返回的所有文章的类型
 * @return multitype:
 */
function article_cache($cache_name,$type,$list=''){
	if(!F($cache_name)){
		$map['is_del'] = 0;
		$map['is_hid'] = 0;
		if($type){
			$map['type'] = $type;
		}
		$article = get_result('article_category',$map,'id,title');
		F($cache_name,$article);
	}else{
		$article = F($cache_name);
	}
	if(empty($list)){
		$article = array_column($article,'title','id');
	}
	return $article;
}
/*
 * 根据IP获取对应地址
 * @time 2015-06-11
 * @author 康利民 <3027788306@qq.com>
 */
function getLocationByIp($ip = '127.0.0.1') {
	// 导入IpLocation类
	$ip = new Org\Net\IpLocation ();
	$area = $ip->getlocation ( $p );
	$location = iconv ( "gbk", "utf-8", $area ['country'] );
	if ($location == 'IANA') {
		return "本地登陆";
	} else {
		return $location;
	}
}

/*
 * 距离现在时间
 * @time 2015-06-18
 * @author 周伍
 */
function time_ago($date) {
	$t = time ();
	$a = $t - strtotime ( $date );
	$a = date ( 'Y-m-d H:i:s', $a );
	$b = explode ( ' ', $a );
	$c = explode ( '-', $b [0] );
	$d = explode ( ':', $b [1] );
	if ($c [0] != '1970') {
		$e = (intval ( $c [0] ) - 1970) . '年前';
	} else if ($c [1] != '01') {
		$e = (intval ( $c [1] ) - 1) . '个月前';
	} else if ($c [2] != '01') {
		$e = (intval ( $c [2] ) - 1) . '天前';
	} else if ($d [0] != '08') {
		$e = (intval ( $d [0] ) - 8) . '小时前';
	} else if ($d [0] != '00') {
		$e = (intval ( $d [1] )) . '分钟前';
	} else {
		$e = '1分钟内';
	}
	return $e;
}

/**
 * 获取随机字符串
 * @param number $length	获取随机字符串的长度,默认为6
 * @param string $strPol	备选字符组成的字符串,默认为A-Za-z0-9;
 * @return string		获取的随机字符串
 *
 * @author 李东<947714443@qq.com>
 * @date  2015-11-18
 */
function get_rand_char($length = 6,$strPol=''){
	$str = '';
	$strPol = $strPol==''?"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz":$strPol;
	$max = strlen($strPol)-1;
	for($i=0;$i<$length;$i++){
		$str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
	}
	return $str;
}

 function get_ip(){
	if ($HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"]){
		$ip = $HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"];
	}elseif ($HTTP_SERVER_VARS["HTTP_CLIENT_IP"]){
		$ip = $HTTP_SERVER_VARS["HTTP_CLIENT_IP"];
	}elseif ($HTTP_SERVER_VARS["REMOTE_ADDR"]){
		$ip = $HTTP_SERVER_VARS["REMOTE_ADDR"];
	}elseif (getenv("HTTP_X_FORWARDED_FOR")){
		$ip = getenv("HTTP_X_FORWARDED_FOR");
	}elseif (getenv("HTTP_CLIENT_IP")){
		$ip = getenv("HTTP_CLIENT_IP");
	}elseif (getenv("REMOTE_ADDR")){
		$ip = getenv("REMOTE_ADDR");
	}else{
		$ip = "Unknown";
	}
	return $ip;
}
/**
 * 订单号生成方法
 * @return string	16位订单号
 * 
 * @author	李东<947714443@qq.com>
 * @date	2016-03-21
 */
function build_order_no(){
	return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}

/**
 * 从多个用户名字段中筛选出一个作为显示
 * 1、获取用户名字段优先级
 * 2、按照优先级循环判断获取需要的用户名
 * 
 * @param array $info	用户信息数组(一维数组)
 * @param string $priority	获取名称优先级,使用'>'连接;默认：'nickname>username>mobile>email'
 * @return Ambigous string	获取到的用户名,未获取到为空字符串
 * 
 * @author	李东<947714443@qq.com>
 * @date	2016-03-21
 */
function get_username($info=array(),$priority = 'nickname>username>mobile>email'){
	$name_arr = explode('>', $priority);
	$count = count($name_arr);
	$username='';
	for($i=0;$i<$count;$i++){
		if(!empty($info[$name_arr[$i]])){
			$username = $info[$name_arr[$i]];
			break;
		}
	}
	return $username;
}

/**
 * 时间戳转换成时间
 * @param int $int	待转换时间戳
 * @param string $format	时间格式
 * @return string
 * 
 * @author	李东<947714443@qq.com>
 * @date	2016-03-22
 */
function int_to_date($int,$format='Y-m-d H:i:s'){
	return date($format,$int);
}

/**
 * 标题显示限制字数
 * 中文标题
 * @param string $str			需要截取的字符串
 * @param number $len			截取长度
 * @param number $start			开始位置
 * 
 * @author					李东
 * @date					2015-09-18
 */
function sub_title($str,$len=5,$start=0){
	$suffix = mb_strlen($str,'utf8') > $len ? true : false;
	$new_str = msubstr($str,$start,$len,"utf-8",$suffix);
	return $new_str;
}
/**
 * 店铺分类缓存
 * 1、查询所有店铺分类
 * @return 店铺分类信息
 */
function  get_shop_group_cate(){
	if(!F('shop_group_cache')){
		$map['is_hid'] = 0;
		$map['is_del'] = 0;
		$info =  get_result('shop_category',$map,'id,title');
		F('shop_group_cache',$info);
	}else{
		$info =F('shop_group_cache');
	}
	$info = array_column($info,'title','id');
	return $info;
}
/**
 * 新建文件并写入内容，
 * 功能说明，
 * 		判断一个文件是否存在，不存在则创建，存在则创建文件名为定义的文件名后面加1，
 * 		如(文件名为：file，如果该文件存在，则创建file1,如果file1存在则创建file2...以此类推)
 * @param string $a				需要写入文件中的内容
 * @param string $b				文件名(不带后缀)
 * @param int $c				创建的文件后面的数字后缀从哪一个数字开始
 * @param string $d				文件的后缀名(不需要带"."，默认为'txt'后缀)
 * @author						李东
 * @date						2015-06-03
 */
function open_file($a,$b,$c='',$d='txt'){
	@$open = fopen($b.$c.'.'.$d,'r');
	if($open){
		if(intval($c)){
			$c++;
		}else{
			$c=1;
		}
		open_file($a,$b,$c,$d);
	}else{
		$file=fopen($b.$c.'.'.$d,'w');
		$str = fwrite($file,"<?php \n".var_export($a, TRUE)."\n ?>");
		fclose($file);
	}
}

 /*
 * 根据模块地址获取SEO信息
 * @param string $model_url 模块路径
 * return array(
 *				title		//网页标题
 *				keywords	//网页关键词
 *				description //网页描述
 *				)
 * @time 2016-03-30
 * @author 陆龙飞
 */
function get_page_seo_info($model_url = ''){

	if(empty($model_url)) $model_url = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
	
	$seo = array();
	$map = array(
		'is_hid'=>0,
		'is_del'=>0,
	);
	$field  = array('id','page_title as title','keywords','description','url');
	if(F('seo_page')){
		$result = F('seo_page');
	}else{
		$result = get_result('seo_page',$map,$field);
		F('seo_page',$result);
	}
	foreach($result as $val){
		if(strtolower($model_url) === strtolower($val['url'])){
			$seo['title'] 		= $val['title'];
			$seo['keywords'] 	= $val['keywords'];
			$seo['description'] = $val['description'];
			break;
		}
	}
    !empty($seo['title'])? $seo['title'] .= ' | '.C('SITE_TITLE') : $seo['title'] =  C('SITE_TITLE');
    if(empty($seo['keywords']))  	$seo['keywords']   =C('SITE_KEYWORD');
    if(empty($seo['description']))  $seo['description']=C('SITE_DESCRIPTION');

	return  $seo;
}
/**
 * 获取店铺推荐商品信息
 * 1、获取商品里推荐的商品
 * 2、把推荐商品存入商铺推荐字段里
 * 3、如果传入的id不正确，更新所有的商铺
 * @param 店铺id $shop_id
 */
function get_shop_recommend ($shop_id){
	$Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
	/*获取当前时间*/
	$time= time();
	/*判断当前的传入的ID是否正确*/
	if(is_numeric($shop_id) && $shop_id !=0){
		/*正确执行SQL获取推荐商品*/
		$arr_id = $Model->query("SELECT id FROM sr_product WHERE shop_id = $shop_id AND is_hid = 0 AND is_del = 0 AND is_sale =1 AND end_time>$time ORDER BY recommend DESC,sort DESC ,id DESC LIMIT 0,2");
		$_POST = null ;
		/*获取要最新的推荐商品*/
		$arr_id = array_column($arr_id, 'id'); 
		$_POST['home_recommend_ids'] = implode(',',$arr_id);
		$_POST['id'] = $shop_id;
		/*修改数据库*/
		update_data('shop');
	}else{
		/*传入ID有误就查询所有店铺*/
		$map['is_del'] = 0 ;
		$map['is_hid'] = 0 ;
		$map['status'] = 1 ;
		$ids = get_result('shop',$map,'id');
		if(empty($ids)){
			return 1;
		}
		/*获取店铺ID*/
		$ids_shop = array_column($ids,'id','id');
		$ids =implode(',', array_column($ids,'id'));
		$map = null;
		/*查询所有店铺下的所有商品*/
		$map['shop_id'] = array('in',$ids);
		$map['end_time'] = array('GT',$time);//TODO:上线前记得去掉注释
		$map['is_del'] = 0;
		$map['is_hid'] = 0;
		$map['is_sale'] = 1;
		$result = get_result('product',$map,true,'recommend DESC,sort DESC ,id DESC');
		/*处理商品的结果集，把商铺ID作为键值整理商品*/
		foreach ($result as $value){
			if(!empty($ids_shop[$value['shop_id']])){
				$shop[$value['shop_id']][] = $value;
			}
		}
		//$shop = array_merge($shop,$ids_shop);
		/*循环所有商品ID*/
		foreach ($ids_shop as $key=>$value){
			$_POST = null;
			$_POST['id'] = $key;
			/*判断商品的键值下是否存在商品如果是就取出推荐商品*/
			if($shop[$key] && is_array($shop[$key])){
				/*统计数组个数*/
				$sum = count($shop[$key]);
				$id_product = null;
				/*取数组的前两个元素作为推荐商品*/
				foreach ($shop[$key] as $ke =>$val){
					if(($ke+1 ==$sum && $ke<2) || $ke==1 ){
						$id_product.= $val['id']; 
					}elseif($ke+1<$sum || $key == 0){
						$id_product.=$val['id'].',';
					}
				}
				$_POST['home_recommend_ids'] = $id_product;
			}else{
				/*如果不是推荐商品就为0*/
				$_POST['home_recommend_ids']= 0;
			}
			/*修改数据库*/
			update_data('shop');
		}
	} 
}
/**
 * 统计商品的投诉率
 * @author 王淳熙
 */
function complaints($id=1){
	$Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
	$sql = '';
	if(empty($id)){
		$sql = '';
	}elseif(is_array($id)){
		$id = implode(',', $id);
		$sql = " AND product_id in($id)";
	}else{
		$sql = " AND product_id = $id";
	}
	//dump($sql);exit ;
	/*统计商品的投诉率*/
	$count = $Model->execute("UPDATE sr_product,(SELECT COUNT(id) AS count, product_id FROM sr_complaints WHERE is_del = 0 $sql GROUP BY `product_id` ) AS temp SET sr_product.complaints = temp.count / sr_product.sales WHERE sr_product.id = temp.product_id");
}

/**
 * 获取用户单独的收藏缓存列表
 * 1、根据用户的ID生成单独的缓存收藏列表
 * @param unknown $data
 */
function get_collection($id){
	/*缓存名*/
	$cache_name = "$id.collection_cache";
	/*判断缓存是否存在*/
	if(!F($cache_name)){
		/*查询所有的收藏缓存*/
		$map['is_del'] = 0;
		$map['is_hid'] = 0;
		$map['member_id'] = $id;
		$result = get_result('collect',$map,'type,collect_id');
		/*处理缓存数组，已不同的分类进行整合*/
		foreach ( $result as $row ) {
			if ($row['type'] == '') {
				$collect [$row ['id']] = $row;
			} else {
				$collect [$row ['type']] [] = $row;
			}
		}
		/*把缓存数组改成字符串形式存储方便调用*/	
		foreach ($collect as $key=>$val){
			$sum = count($val);
			foreach ($val as $kes=> $va){
				if($kes+1 == $sum){
					$ids[$key] .= $val[$kes]['collect_id'];
				}else{
					$ids[$key] .= $val[$kes]['collect_id'].',';
				}
			}
		}
		/*生成缓存*/
		F($ids,$cache_name);
	}else{
		/*有缓存就读取缓存*/
		$ids = F ($cache_name);
	}
	return $ids;
}
/**
 * 获取推荐商家的推荐产品
 * 1、获取推荐商家的详情
 * 2、根据商家详情获取推荐的商品
 * 3、整合到一个数据中
 */
function  get_product($relst){
	$time = time();
	/*获取所有店铺的推荐商品集合*/
	$product = array_column($relst,'home_recommend_ids');
	/*把推荐商品的id转化为字符串*/
	$product_id = implode(',', $product);
	/*放入搜索条件*/
	$map['id'] = array('in',$product_id);
	$map['is_del'] = 0;
	$map['is_hid'] = 0;
	$map['is_sale'] = 1;
	$map['end_time'] = array('GT',$time);
	/*获取推荐商品的详细资料*/
	$product_relst = get_result('product',$map,'id,title,selling_price,has_buy,purchases,shop_id','recommend DESC,sort DESC ,id DESC');
	//dump(session());exit();
	/*把推荐商品存入各自的店铺中*/
	foreach ($relst as $key => $value){
		foreach ($product_relst as $val){
			if($value['id'] == $val['shop_id']){
				$relst[$key]['subset'][] = $val;
			}
		}
	}
	return $relst;
}
/**
 * 将二维数组的键值转换为子数组的中ID值
 * @param array  $array			待转换的二维数组
 * @return array				键值为数组中ID值的数组
 *
 */
function array_id_key($array){
	$temp_arr = array();
	foreach($array as $val){
		$temp_arr[$val['id']] = $val;
	}
	$array = $temp_arr;
	return $array;
}
function show_bug($data){
	header("Content-type: text/html; charset=utf-8");
	echo '<pre>';
	var_dump($data);
	echo '</pre>';
}
/*
 * 判断是pc还是wap
 * @time 2015-09-30
 * @author	朱成  <2784384556@qq.com>
 * */
function is_mobile(){
	$useragent=isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';
	$useragent_commentsblock=preg_match('|\(.*?\)|',$useragent,$matches)>0?$matches[0]:'';
	$mobile_os_list=array('Google Wireless Transcoder','Windows CE','WindowsCE','Symbian','Android','armv6l','armv5','Mobile','CentOS','mowser','AvantGo','Opera Mobi','J2ME/MIDP','Smartphone','Go.Web','Palm','iPAQ');
	$mobile_token_list=array('Profile/MIDP','Configuration/CLDC-','160×160','176×220','240×240','240×320','320×240','UP.Browser','UP.Link','SymbianOS','PalmOS','PocketPC','SonyEricsson','Nokia','BlackBerry','Vodafone','BenQ','Novarra-Vision','Iris','NetFront','HTC_','Xda_','SAMSUNG-SGH','Wapaka','DoCoMo','iPhone','iPod');
	$found_mobile=check_substrs($mobile_os_list,$useragent_commentsblock) ||
	check_substrs($mobile_token_list,$useragent);
	if ($found_mobile){
		return true;
	}else{
		return false;
	}
}
function check_substrs($substrs,$text){
   foreach($substrs as $substr)
     if(false!==strpos($text,$substr)){
        return true;
    }
    return false;
}

function get_avatar($member_id='',$size=""){
	if($member_id==""){
		$member_id=session("home_member_id");
	}
	if($size){
		$member_id=$member_id.'_'.$size;
	}
	$file="Uploads/Avatar/".$member_id.".jpg";
	if(!file_exists($file)){
		return '';
	}
	return __ROOT__.'/'.$file.'?'.time();
}
/**
 * 判断剩余的天数
 * @param 要查询的时间 $time
 * @param 转化结果（天、月、年） $day
 * @return 返还对应的时间
 */
function get_time($time,$day='d'){
// 	echo date('Y-m-d H:i:s', 1463709600);
// 	exit();
	if($day == 'd'){
		$day = 24*60*60;
	}elseif($day =='m'){
		$day = 24*60*60*30;
	}elseif($day == 'y'){
		$day = 24*60*60*365;
	}
	$time_day = time();
	$time_end = ($time-$time_day)/$day;
	if($time_end>1){
		return ceil($time_end);
	}elseif($time_end<1 && $time_end >0){
		return '不足1天';
	}
}
/**
 * 对数组指定个数进行处理
 * @param 要处理的数组 $array
 * @param 限制数组不能超出的个数 $num
 * @param 开始截取的位置 $str
 * @param 结束的位置 $end
 * @return 返回处理好的数组
 */
function get_array($array,$num,$str='',$end=""){
	if(empty($str)){
		$str ="0";
	}
	if(empty($end)){
		$end = $num;
	}
	if(!is_array($array)){
		return '';
	}
	$sum = count($array);
	if($sum>$num){
		$array = array_slice($array,$str,$end);
	}
	return $array;
}
/**
 * 判断字段是否存在返回指定值
 * @param 要判断的字段 $field
 * @param 存在的值 $ture
 * @param 不存在的值 $error
 */
function get_set($field,$ture,$error){
	if($field){
		return $ture;
	}else{
		return $error;
	}
}
/**
 * 获取百分比
 * @param unknown $molecule			分子
 * @param unknown $denominator		分母
 * @param number $precision			保留小数
 */
function percentage($molecule, $denominator, $precision = 4) {
	return round($molecule / $denominator, $precision) * 100;
}
/**
 * 获取百分比
 * @param unknown $molecule			分子
 * @param unknown $denominator		分母
 * @param number $precision			保留小数
 */
function percentage_style($molecule, $denominator) {
	$val = round($molecule / $denominator, 2) * 100;
	if($val > 100) {
		$val = 100;
	}
	return $val;
}
function get_address($id){
	$address = get_area_cache();
	$address = $address[$id]['title'];
	return $address;
}
/**
 * 判断昵称是否为空，为空则填写用户名，不为空则填写昵称
 * @param 用户名 $user
 * @param 昵称 $name
 * @return 昵称或者用户名
 */
function get_name($user,$name){
	if($name){
		return $name;
	}else{
		return $user;
	}
}
/**
 * 密码加密方式
 * @param 用户密码  $password
 * @param 加密字符串     $str
 */
function get_md5($password,$str){
	$password = md5(md5($password).$str);
	return $password;
}

function tree_to_list($tree, $child = '_child', $order='id', &$list = array()){
		
		if(is_array($tree)) {
			foreach ($tree as $key => $value) {
				$reffer = $value;
				if(isset($reffer[$child])){
					unset($reffer[$child]);
					tree_to_list($value[$child], $child, $order, $list);
				}
				$list[] = $reffer;
			}
			$list = list_sort_by($list, $order, $sortby='asc');
		}
		return $list;
}

	/*
	* 对查询结果集进行排序
	* @access public
	* @param array $list 查询结果
	* @param string $field 排序的字段名
	* @param array $sortby 排序类型
	* asc正向排序 desc逆向排序 nat自然排序
	* @return array
	*/
  function list_sort_by($list,$field, $sortby='asc') {
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