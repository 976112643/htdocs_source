<?php
namespace App\Controller\AppCommon;
use       Common\Org\Check;
use       Common\Org\Database;
class BackController extends BaseController {
	
	protected $table = 'user';
	
	 /*
	 * 找回密码
	 *		需求分析
	 *			发送短信,找回密码
	 *		流程分析
	 *			1、 接收数据,并验证数据
	 *			2、 验证验证码 
	 *          3、 验证通过更新session表
	 *          4、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-08-24
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppCommon/Back
	 * 方式提交 post
		 request  参   数	 
				  apptype    APP_KEY    Y      //密钥
			      mobile     string     Y      //用户手机号
				  code       string     Y      //验证码
				  code_id	 string     Y      
				  
		 response 参   数   'info'=>     消息字符串    
   		 
		 优化: 逻辑简化
	 */
	public function index(){
		
		/* 1、接收数据,并验证数据 */
		$posts    = I();
		$mobile   = $posts['mobile'];
		$code     = $posts['code'];
		$code_id  = intval($posts['code_id']);
		if(!$mobile || !$code)             				  $this->apiReturn(array('status'=>'-1','msg'=>'参数错误'));
	    if(empty($mobile)) 			  					  $this->apiReturn(array('msg'=>'手机号不能为空'));
	    if(empty($code)) 			  					  $this->apiReturn(array('msg'=>'请输入验证码'));
	    if(empty($code_id)) 			  				  $this->apiReturn(array('msg'=>'参数错误'));
	    if(!Check::is_mobile($posts['mobile']))           $this->apiReturn(array('msg'=>'手机号格式不正确'));
		
		/* 2、验证验证码 */
  		$flag = false;
		$arr_info  = get_result('session',array('id'=>$code_id),true,$order='add_time desc',$limit=1);
		$code_info = json_decode($arr_info[0]['session_info'],true);
		
		if($code == $code_info['get_code'] && $code_info['get_account'] == $mobile && $code_info['type'] == 2){
			$flag = true;  
		}else{
			$flag = false;
		} 

		if(!$flag) $this->apiReturn(array('msg'=>'验证码错误')); 
		
		/* 3、 验证通过更新session表 */
		$_POST = array(
			'id'    =>$code_id,
			'status'=>2,
		);

		$result = update_data('session');
		
		/* 4、 设置信息并返回 */
		if(is_numeric($result)){
			$this->apiReturn(array('status'=>'1','msg'=>'操作成功','info'=>$code_id));
		}else{
			$this->apiReturn(array('msg'=>'用户信息获取失败！'));
		}
		
    
	}
	
	
	/*
	 * 设新密码
	 *		需求分析
	 *			验证短信短信,设置新密码
	 *		流程分析
	 *			1、 接收数据,并验证数据
	 *			2、 验证验证码 
	 *          3、 验证通过更新用户密码
	 *          4、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-08-24
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppCommon/Back/set_password
	 * 方式提交 post
		 request  参   数	 
				  apptype    APP_KEY    Y      //密钥
			      password   string     Y      //新密码
				  comfirm    string     Y      //确认密码
				  code_id	 string     Y      //验证码id
				  
		 response 参   数   'info'=>     消息字符串    305459
   		 优化: 1、逻辑简化
			   2、增加手机号,增强验证参数
	 */
	public function set_password(){
		
		/* 1、 接收数据,并验证数据 */
		$posts = I();
		$password = $posts['password'];
		$comfirm  = $posts['comfirm'];
		$code_id  = intval($posts['code_id']);
		
		if(!$password || !$comfirm)  	 	$this->apiReturn(array('status'=>'-1','msg'=>'提交参数错误！'));
		if($comfirm    !=  $password)       $this->apiReturn(array('msg'=>'两次输入不一致！'));
		if(!Check::check_length($password)) $this->apiReturn(array('msg'=>'请输入长度为6~15位！'));
		
		/* 2、 验证验证码  */
		$password  = md5(md5($password));
		$arr_info  = get_info('session',array('id'=>$code_id,'status'=>2));
		
		if(!$arr_info) $this->apiReturn(array('msg'=>'验证码错误，请重新获取'));
		$code_info = json_decode($arr_info['session_info'],true);
		
		/* 3、 验证通过更新用户密码 */
		$sql      = "update sr_user set password='{$password}'  where status = 1 AND username ='{$code_info['get_account']}'";
		$result   = Database::execute_sql($sql);
		
		/* 4、 设置信息并返回 */
		if(is_numeric($result)){
			delete_data('session',array('id'=>$code_id));
			$this->apiReturn(array('status'=>'1','msg'=>'操作成功'));
		}else{
			$this->apiReturn(array('msg'=>'操作失败'));
		}
	}

}