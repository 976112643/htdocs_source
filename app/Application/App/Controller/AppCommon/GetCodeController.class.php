<?php
namespace App\Controller\AppCommon;
use       Common\Org\Common;
use       Common\Org\Check;

class GetCodeController extends BaseController {
	
	protected $table = 'session';
	
	 /*
	 * app 发送验证码
	 *		需求分析
	 *			app发送验证码
	 *		流程分析
	 *          1、 设置默认返回信息
	 *			2、 接收数据,处理数据
	 *          3、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-08-24
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppCommon/GetCode?mobile=13377850432
	 * 方式提交 GET
		 request  参   数	
				  apptype    APP_KEY  Y      //密钥
			      mobile     string   Y      //用户手机号
				  type       string   Y      //类型  1-未注册型 2-已注册型
				 
		 response 参   数   'msg'     =>     验证码ID  消息字符串( 成功或者失败！)
							'info'    =>	 验证码id
	 */
	public function index(){

		/* 1、接收数据,处理数据 */
		$posts    = I();
		$mobile   = $posts['mobile'];
		$type     = intval($posts['type']);
		if(!$mobile || !$type)             		$this->apiReturn(array('status'=>'-1','msg'=>'参数错误'));
	    if(empty($mobile)) 		 				$this->apiReturn(array('msg'=>'手机号不能为空！'));
	    if(empty($type)) 		 				$this->apiReturn(array('msg'=>'类型参数必须'));
		if(!Check::is_mobile($posts['mobile'])) $this->apiReturn(array('msg'=>'手机号格式不正确！'));

		/* 2、发送验证码 */
		$result  = $this->sendCode($mobile,$type,$account_type = 'mobile');
		if($result){
			$this->apiReturn(array('status'=>'1','msg'=>'发送成功！','info'=>$result));
		}else{
			$this->apiReturn(array('msg'=>'发送失败！'));
		}
	}
	
	
	/*
	 * 系统运行消息接口
	 *		需求分析
	 *			将系统运行消息发给指定人员
	 *		流程分析
	 *          1、 接收参数
	 *			2、 发送消息
	 *          3、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-12-21
	 * 接口地址 http://59.175.146.174/smh_crm/app/App/AppCommon/GetCode/api_send_sys_msg?error_msg=错误内容&error_type=error：008
	 * 方式提交 POST
		 request  参   数	
				  key  		   	 APP_KEY  Y      //密钥      (暂不适用)
			      error_msg      string   Y      //错误内容
				  error_type     string   Y      //错误类型
				 
		 response 参   数   {
								"status": "1",       //发送状态  1-成功  2-失败
								"msg": "发送成功！"  //描述
							}
	 */
	public function api_send_sys_msg(){
		
		/* 1、接收参数 */
		$posts 		 = I();
		$error_msg   = $posts['error_msg'];
		$error_type  = $posts['error_type'];
		
		if(!$error_type)  $this->apiReturn(array('msg'=>'错误类型必须'));

		$str_arr    = str_split($error_msg,3);
		$str        = '';
		
		/* 2、消息解码 */
		foreach($str_arr as $v){
			if(intval($v) > 255){
				$this->apiReturn(array('status'=>'0','msg'=>'数据类型解析错误'));
				die();
			}
			$str .= chr(intval($v));
		}
		var_dump();
		die();
		/* 3、发送消息 您的验证码是：【变量】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！ */
		$content     = '[ 错误类型 ：' . $error_type . ']\r\n[错误内容:'. $str . '\r\n[时间:' .date('Y-m-d H:i:s'). '] ]';
		$result  	 = Common::sms('18618499056',$content);
		
		/* 4、返回执行结果 */
		if($result){
			$this->apiReturn(array('status'=>'1','msg'=>'发送成功'));
		}else{
			$this->apiReturn(array('msg'=>'发送失败'));
		}

	}
}