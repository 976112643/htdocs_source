<?php
return array(

	/* '配置项'=>'配置值' */
	
	'LOG_TYPE'              =>  'File', 
	
	/* 模块相关配置 */
	'AUTOLOAD_NAMESPACE'    => array('Addons' => ONETHINK_ADDON_PATH), /* 扩展模块列表 */
	
	/* Ucenter配置 */	
	'BBS_SITE'=>'http://192.168.1.198:81',
	
	/* 设置禁止访问的模块列表 */
	'MODULE_DENY_LIST'      =>  array('Common','Runtime','Api'),
	
	/* 关闭多模块访问 */
	/* 	'MULTI_MODULE'      =>  false, */
	'DEFAULT_MODULE'        =>  'App',
	
	/* '配置项'=>'配置值' */
	"API_KEY" =>'13b965a497aef546f2139003444ee8f1', /* 接口访问密钥  */
	
	/* http://www.haoservice.com/  HAO SERVICE KEY */
	'HS_KEY'            =>'c91864d827ab4a5a9a6fa940220bad95',
	'GD_WEB_ADDRESS_KEY'=>'681cfc42ebf02ecbb0f8b437e27a22cd',    /* 高德逆地址WEBAPI 密钥*/
	'GD_WIFILBS_KEY'	=>'bc34e0ecbcee86715a8153d0b57839a3',    /* 高德WiFi加基站定位接口密钥 */
	
	/* 加载扩展配置文件 */
	'LOAD_EXT_CONFIG'=>'db',
	'SESSION_PREFIX' =>'front_',

	/* 模板相关配置 */
	'TMPL_PARSE_STRING' => array(
		'__STATIC__'	=> __ROOT__ . '/Public/Static',
		'__IMG__'		=> __ROOT__ . '/Public/App/img',
		'__CSS__'		=> __ROOT__ . '/Public/App/css',
		'__JS__'		=> __ROOT__ . '/Public/App/js',
		'__WR__'		=> __ROOT__ . '/Public/App/wgtRes',
		'__PLUGIN__'	=> __ROOT__ . '/Public/Plugins',
		'__IMGG__'		=> __ROOT__ . '/Public/App/img',
		'__CSSS__'		=> __ROOT__ . '/Public/App/css',
		'__JSS__'		=> __ROOT__ . '/Public/App/js',
	),
	/* 调试模式开关 */
	'SHOW_PAGE_TRACE'	=>  true,
	
	/* 时区设置 */
	/* 'DEFAULT_TIMEZONE'		=>'America/New_York', */
	
	/* 数据缓存设置 */
	'DATA_CACHE_PREFIX'		=> 'sr_',  /* 缓存前缀 */
	'DATA_CACHE_TYPE'		=> 'File', /* 数据缓存类型,支持:File|Db|Apc|Memcache|Shmop|Sqlite|Xcache|Apachenote|Eaccelerator */

	'CONTROLLER_LEVEL'		=> 2,      /* 设置1级目录的控制器层 */
	
	/* URL配置 */
	'URL_CASE_INSENSITIVE' => false,   /* 默认false 表示URL区分大小写 true则表示不区分大小写 */
	'URL_MODEL'            => 2,       /* URL模式 */
	'VAR_URL_PARAMS'       => '',      /* PATHINFO URL参数变量 */
	'URL_PATHINFO_DEPR'    => '/',     /* PATHINFO URL分割符   */

	'PWD_TIME_LIMIT'		=>30,      /* 找回密码时间限制，单位为分钟 */
	
	/* 'TMPL_ACTION_ERROR'     =>  'Common/View/Plugins/error.html',     */ /* 默认错误跳转对应的模板文件 */
	/* 'TMPL_ACTION_SUCCESS'   =>  'Common/View/Plugins/success.html',   */ /* 默认成功跳转对应的模板文件 */
	/* 'TMPL_EXCEPTION_FILE'   =>  'Common/View/Plugins/exception.html', */ /* 异常页面的模板文件 */


	/* 图片上传相关配置 */
	'IMG_UPLOAD' => array(
		'mimes'    => '', 					  /* 允许上传的文件MiMe类型 */
		'maxSize'  => 2*1024*1024, 			  /* 上传的文件大小限制 (0-不做限制) */
		'exts'     => 'jpg,gif,png,jpeg,bmp', /* 允许上传的文件后缀 */
		'autoSub'  => true,                   /* 自动子目录保存文件 */
		'subName'  => '',                     /* 子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组 */
		'rootPath' => './Uploads/ImgTemp/',   /* 保存根路径 */
		'savePath' => '',                     /* 保存路径 */
		'saveName' => array('uniqid', ''),    /* 上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组 */
		'saveExt'  => '', 					  /* 文件保存后缀，空则使用原后缀 */
		'replace'  => false, 				  /* 存在同名是否覆盖 */
		'hash'     => true, 				  /* 是否生成hash编码 */
		'callback' => false, 				  /* 检测文件是否存在回调函数，如果存在返回文件信息数组 */
	),										  /* 图片上传相关配置（文件上传类配置） */

	/* 文件上传相关配置 */
	'FILE_UPLOAD' => array(
		'mimes'    => '',                                               /* 允许上传的文件MiMe类型 */
		'exts'     => 'jpg,jpeg,bmp,png,rar,zip,7z,doc,docx,rtf,txt',   /* 允许上传的文件后缀 */
		'autoSub'  => true,                                             /* 自动子目录保存文件 */
		'subName'  => '',                                               /* 子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组 */
		'rootPath' => './Uploads/FileTemp/',                            /* 保存根路径 */
		'savePath' => '',                                               /* 保存路径 */
		'saveName' => array('uniqid', ''),                              /* 上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组 */
		'saveExt'  => '',                                               /* 文件保存后缀，空则使用原后缀 */
		'replace'  => false,                                            /* 存在同名是否覆盖 */
		'hash'     => true,                                             /* 是否生成hash编码 */
		'callback' => false,                                            /* 检测文件是否存在回调函数，如果存在返回文件信息数组 */
	),                                                                  /* 下载模型上传配置（文件上传类配置） */
	/* 设置默认模块 */
	/* 'MODULE_ALLOW_LIST'    =>    array('Home','Backend','User'), */
	/* 'DEFAULT_MODULE'       =>    'Home', */
	
	

	
	
);