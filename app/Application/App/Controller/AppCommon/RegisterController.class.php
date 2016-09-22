<?php
namespace App\Controller\AppCommon;
use       Common\Org\Check;
use       Common\Org\Common;
class RegisterController extends BaseController {
	
	protected $table = 'user';
	
	 /*
	 * app 用户注册
	 *		需求分析
	 *			app 用户注册 同步UC
	 *		流程分析
	 *          1、 设置默认返回信息
	 *			2、 接收数据,处理数据
	 *			3、 验证手机号
	 *			4、 验证密码
	 *          5、 身份验证成功,用户信息持久化 
	 *          6、 获取用户信息 以及用户相关的信息
	 *          7、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-08-24
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppCommon/Register?mobile=13377850432&password=111111&code=660513
	 * 方式提交 post
		 request  参   数	 
				  apptype    APP_KEY    Y      //密钥
			      mobile     string     Y      //用户手机号
				  password   string     Y      //密码
				  code       string     Y      //验证码
				  code_id	 string     Y      //验证码	
				  
		 response 参   数   'info'=>     消息字符串    
		          {
					"status": "2",
					"msg": "登陆成功，并跳转！",
					"info": {
						"id": "197",
						"username": "13377850426",
						"nickname": "13377850426",
						"mobile": "13377850426",
						"last_login_time": "2015-11-09 14:31:29",
						"last_login_ip": "127.0.0.1",
						"login_ip": "127.0.0.1",
						"login_time": "2015-11-09 14:31:29",
						"user_key": "859d02514f79d4f992eb6acaf57f9721"
					}
				  }
				  {
					"status": "0",
					"msg": "登陆失败！", 
				  }
				  {
					"status": "-1",
					"msg": "系统级错误！",    
				  }     		 
	 */
	public function index(){
		
		$this->apiReturn(array('status'=>'0','msg'=>'请升级设备'));
		/* 1、接收数据,处理数据 */
		$posts    = I();
		$mobile   = $posts['mobile'];
		$password = $posts['password'];
		$code     = $posts['code'];
		$code_id  = intval($posts['code_id']);
		if(!$mobile  || !$password || !$code )            $this->apiReturn(array('status'=>'-1','msg'=>'参数错误'));
	    if(empty($mobile)) 			  					  $this->apiReturn(array('msg'=>'手机号不能为空！'));
	    if(empty($password)) 			  				  $this->apiReturn(array('msg'=>'手机号不能为空！'));
	    if(empty($code)) 			  					  $this->apiReturn(array('msg'=>'请输入验证码！'));
		if(empty($code_id)) 			  				  $this->apiReturn(array('msg'=>'参数错误!'));
		
	    if(!Check::is_mobile($posts['mobile']))           $this->apiReturn(array('msg'=>'手机号格式不正确！'));
		if(!Check::check_length($posts['password'],6,15)) $this->apiReturn(array('msg'=>'密码在6-15位'));
		
		/* 验证验证码 */
  		$flag      = false;
		$arr_info  = get_result('session',array('id'=>$code_id),true,$order='add_time desc',$limit=1);
		$code_info = json_decode($arr_info[0]['session_info'],true);

		
		if(!$code_info)$this->apiReturn(array('msg'=>'验证码错误！'));
		if($code == $code_info['get_code'] && $code_info['get_account'] == $mobile &&  $code_info['type'] == 1){
			$flag = true;  
		}else{
			$flag = false;
		}
		if(!$flag)   $this->apiReturn(array('msg'=>'验证码错误！'));

		
		$mobile    = addslashes($mobile);
		
		$cur_ip   = get_client_ip();
		$cur_time = date('Y-m-d H:i:s');
		$_POST = array(
			'id'		=> $ucresult,
			'password'	=> md5(md5($password)),
			'add_ip'	=> $cur_ip,
			'login_ip'	=> $cur_ip,
			'last_login_ip' =>$cur_ip,
			'add_time'	=> $cur_time,
			'login_time'=> $cur_time,
			'last_login_time' => $cur_time,
			'username'	=> $mobile,
			'nickname'  => $mobile,  /* 设置默认注册手机为用户的临时昵称 */
			'mobile'    => $mobile,  /* 设置默认注册手机为用户的手机号 */
		);
		$rules = array(
			array('username','','该手机用户已经存在！',1,'unique',1),
			array('password','require','请填写密码'),
		);
		$result = add_data($this->table,$rules);
		if(!is_numeric($result)) $this->apiReturn(array('msg'=>$result));
		
		/* 获取更新过后的用户信息 */
		$field = array('id','username','nickname','mobile','default_imei','card_no','last_login_time','last_login_ip','login_ip','login_time');
		
		$info  = get_info('user',array("id"=>$result),$field);
		if(!$info) $this->apiReturn(array('status'=>'-1','msg'=>'数据获取错误！'));
		
		/* 获取设备ID和设备识别码 */
		$info['vins_no']   = '';
		$info['imsi']      = '';

		/* 生成md5的本次登陆时间 key  */
		$info['user_key']  =  md5($info['login_time']);
	
		/* 登陆成功返回用户信息 */
		$this->apiReturn(array('status'=>'1','msg'=>'成功！','info'=>$info));
	}

}