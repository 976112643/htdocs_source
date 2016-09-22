<?php
$SITE_URL = "http://test.cnsunrun.com/zzypt/User/";/*TODO:上线前请更改回调地址*/
define('URL_CALLBACK', "" . $SITE_URL . "Public/callback?type=");
return array (
	/* 模板相关配置 */
	'TMPL_PARSE_STRING' => array(
		'__STATIC__'	=> __ROOT__ . '/Public/Static',
		'__IMG__'		=> __ROOT__ . '/Public/Home/img',
		'__CSS__'		=> __ROOT__ . '/Public/Home/css',
		'__JS__'		=> __ROOT__ . '/Public/Home/js',
		'__PLUGIN__'	=> __ROOT__ . '/Public/Plugins',
		'__Seller__'	=> __ROOT__ . '/Public/Seller/js',
	),
	
	// 加载扩展配置文件
	'LOAD_EXT_CONFIG' => 'db,regex',
	'SESSION_PREFIX' => 'front_',
	// '配置项'=>'配置值'
	
	'SHOW_PAGE_TRACE' => true,
	
	/* 数据缓存设置 */
	'DATA_CACHE_PREFIX' => 'sr_', // 缓存前缀
	'DATA_CACHE_TYPE' => 'File', // 数据缓存类型,支持:File|Db|Apc|Memcache|Shmop|Sqlite|Xcache|Apachenote|Eaccelerator
	
	'CONTROLLER_LEVEL' => 1, // 设置1级目录的控制器层
	
	'DEFAULT_MODULE' => 'Home',
	/* URL配置 */
	'URL_CASE_INSENSITIVE' => true, // 默认false 表示URL区分大小写 true则表示不区分大小写
	'URL_MODEL' => 2, // URL模式
	'VAR_URL_PARAMS' => '', // PATHINFO URL参数变量
	'URL_PATHINFO_DEPR' => '/', // PATHINFO URL分割符
	                               
	// 'TMPL_ACTION_ERROR' => MODULE_PATH.'View/Base/Public/error.html', // 默认错误跳转对应的模板文件
   // 'TMPL_ACTION_SUCCESS' => MODULE_PATH.'View/Base/Public/success.html', // 默认成功跳转对应的模板文件
   // 'TMPL_EXCEPTION_FILE' => MODULE_PATH.'View/Base/Public/exception.html',// 异常页面的模板文件
	
	/* 图片上传相关配置 */
	'IMG_UPLOAD' => array (
		'mimes' => '', // 允许上传的文件MiMe类型
		'maxSize' => 2 * 1024 * 1024, // 上传的文件大小限制 (0-不做限制)
		'exts' => 'jpg,gif,png,jpeg,bmp', // 允许上传的文件后缀
		'autoSub' => true, // 自动子目录保存文件
		'subName' => '', // 子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
		'rootPath' => './Uploads/ImgTemp/', // 保存根路径
		'savePath' => '', // 保存路径
		'saveName' => array ('uniqid','' ), // 上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
		'saveExt' => '', // 文件保存后缀，空则使用原后缀
		'replace' => false, // 存在同名是否覆盖
		'hash' => true, // 是否生成hash编码
		'callback' => false 
	), // 检测文件是否存在回调函数，如果存在返回文件信息数组
		
	/* 文件上传相关配置 */
	'FILE_UPLOAD' => array (
		'mimes' => '', // 允许上传的文件MiMe类型
		'exts' => 'jpg,jpeg,bmp,png,rar,zip,7z,doc,docx,rtf,txt', // 允许上传的文件后缀
		'autoSub' => true, // 自动子目录保存文件
		'subName' => '', // 子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
		'rootPath' => './Uploads/FileTemp/', // 保存根路径
		'savePath' => '', // 保存路径
		'saveName' => array ('uniqid',''), // 上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
		'saveExt' => '', // 文件保存后缀，空则使用原后缀
		'replace' => false, // 存在同名是否覆盖
		'hash' => true, // 是否生成hash编码
		'callback' => false 
	), // 检测文件是否存在回调函数，如果存在返回文件信息数组
	
	/*支付接口参数配置*/
	'payment' => array(
		/*支付宝配置*/
		'alipay' => array (
			'email' => '1182209951@qq.com',										/* 收款账号邮箱*/
			'key' => '88tck3h7ta4tsvti9qmyjxvealattoh8',						/* 加密key，开通支付宝账户后给予*/
			'partner' => '2088911997056539',									/* 合作者ID，支付宝有该配置，开通易宝账户后给予*/
			'ali_public_key_path'=> CONF_PATH.'Certs/alipay_public_key.pem'
		),
	),
	'URL_ROUTER_ON' => true,
    'URL_ROUTE_RULES' => array(
        '/^login/' => 'Login/lists',
    ),
    //腾讯QQ登录配置
    'THINK_SDK_QQ' => array(
        'APP_KEY' => '101302312', //应用注册成功后分配的 APP ID
        'APP_SECRET' => '7608c8c2ec7815b63c9c5f1a77ce3f54', //应用注册成功后分配的KEY
        'CALLBACK' => URL_CALLBACK . 'qq',
    ),
    //新浪微博配置
    'THINK_SDK_SINA' => array(
        'APP_KEY' => '658732111', //应用注册成功后分配的 APP ID
        'APP_SECRET' => '14a0cae7cfc981699f46e02ddfb5f7c5', //应用注册成功后分配的KEY
        'CALLBACK' => URL_CALLBACK . 'sina',
    ),
    //人人网配置
    'THINK_SDK_RENREN' => array(
        'APP_KEY' => '', //应用注册成功后分配的 APP ID
        'APP_SECRET' => '', //应用注册成功后分配的KEY
        'CALLBACK' => URL_CALLBACK . 'renren',
    ),
	//微信登录
    'THINK_SDK_WEIXIN' => array(
        'APP_KEY'    => 'wx43f262f06f91762e', //应用注册成功后分配的 APP ID
        'APP_SECRET' => 'da19130bf58465cbf91a92fe0ab8a36a', //应用注册成功后分配的KEY
        'CALLBACK'   => URL_CALLBACK . 'weixin',
    ),
);