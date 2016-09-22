<?php
namespace App\Controller\AppCommon;
use       Common\Org\Check;
use       Common\Org\Common;
class LoginController extends BaseController {
	
    /* 直接继承公共模块 成为公共操作模块 */
	protected $table = 'user'; 
	 /*
	 * app 用户登陆
	 *		需求分析
	 *			app 用户登陆
	 *		流程分析
	 *			1、 接收数据,处理数据
	 *			2、 验证手机号是否正确
	 *			3、 验证手机号
	 *			4、 验证密码
	 *			5、 身份验证成功,用户信息持久化 
	 *			6、 获取用户信息 以及用户相关的信息
	 *			7、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-08-24
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppCommon/Login?mobile=13377850432&password=111111
	 * 方式提交	post 
		request  参   数   类 型   是否必须  
				
				apptype    APP_KEY    Y      //密钥
				mobile     string     Y    	 //用户手机号
				password   string     Y      //密码
				  
		response 参   数   
			'status' =>  '1'-登陆成功  '0'-登陆失败提示错误  '-1'-系统错误 
			'msg'    =>  '消息字符串'
			'info'   =>  当前用户信息
						{ 
							id                     //用户id     home_member_id 参数
							username               //用户名     app端注册时的手机            
							nickname               //昵称       
							card_no                //身份证
							mobile                 //手机号     默认为注册时使用的 
							last_login_time        //用户上次登陆时间
							last_login_ip          //用户上次等陆的ip
							login_ip               //用户登陆id
							login_time             //登陆时间
							user_key               //本次登陆生成的登陆密钥用于限制多登陆 
						}
				 
	 */
	public function index(){
		
		/* 1、接收数据,处理数据 */
		$posts    = I();
		$mobile   = $posts['mobile'];
		$password = $posts['password'];
		
		if(empty($mobile) || empty($password))	$this->apiReturn(array('msg'=>'您输入的账号或密码不正确！'));
		
		/* 2、验证手机号是否正确 */
		if(!Check::is_mobile($posts['mobile']))	$this->apiReturn(array('msg'=>'您输入的账号或密码不正确'));
		if(!Check::check_length($posts['password'])) $this->apiReturn(array('msg'=>'密码在6-15位！'));
		
		     
		$mobile		= addslashes($posts['mobile']);  
		$login_type	= 0; 									/* 使用用户名登陆 */
		
		$map = array(
			'username'=>$mobile,
			'password'=>md5(md5($password)),
		);
		$user_result = get_info('user',array('username'=>$mobile),array('id'));
		if(!$user_result)  $this->apiReturn(array('msg'=>'用户不存在，可先进行注册！'));
		
		$info = get_info('user',$map);
				
		/* 3、更新登录时间和登录IP */
		$_POST	= null;
		$map	= array('id' => $info['id']);
		
		$_POST['login_time']	= date('Y-m-d H:i:s');
		$_POST['login_ip']		= get_client_ip();
		
		if($info){
			/* 判断帐号是否被禁用 */
			if($info['status'] != 1)    $this->apiReturn(array('msg'=>'账号已被禁用!'));
			$_POST['id']				= $info['id'];
			$_POST['last_login_time']	= $info['login_time'];
			$_POST['last_login_ip']		= $info['login_ip'];
			
			$result = update_data('user',$map);
		}
		/* 获取更新过后的用户信息 */
		$field = array('id','username','nickname','mobile','default_imei','card_no','last_login_time','last_login_ip','login_ip','login_time','deal_password');
		$info  = get_info('user',array("id"=>$info['id']),$field);
		
		if(is_numeric($result) && $info){
				
			/* 获取默认设备 */
			$wear_info	= get_info('device',array('status'=>array('gt',0),'vins_no'=>$info['default_imei']),array('imsi','version'));
			$cheack		= get_info('device_relation',array('vins_no'=>$info['default_imei']),array('vins_no'));
			if($wear_info && $cheack){
				$info['vins_no']	= $info['default_imei'];
				$info['imsi']		= $wear_info['imsi'];
				$info['version']	= $wear_info['version'];
			}else{
				$info['vins_no']	= '';
				$info['imsi']		= '';
				$info['version']	= '';
			}
			/* 生成md5的本次登陆时间 key  */
			$info['user_key'] = md5($info['login_time']);
			
			/* 返回登录用户头像 */
			$info['img_head']  = C("BBS_SITE").'/uc_server/avatar.php?uid='.$info['id'].'&type=virtual&size=big&rand='.date('ymdhis',time());
			
			/* 是否设置了交易密码 */
			$info['deal_password'] === '' ?  $info['is_set'] = '0' : $info['is_set'] = '1';
			unset($info['deal_password']);
			
			/* 登陆成功返回用户信息 */
			$this->apiReturn(array('status'=>'1','msg'=>'登录成功！','info'=>$info));
		}else{
			$this->apiReturn(array('msg'=>'用户名或密码错误！'));
		}
		
	}

}