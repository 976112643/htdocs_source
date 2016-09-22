<?php
namespace App\Controller\AppUser;
use   Common\Org\Check;

class UserInfoController extends BaseController {
	
	
	protected $table = 'user';
	
	
	/*
	 * app 修改用户信息
	 *		需求分析
	 *			app 用户修改
	 *		流程分析
	 *          1、数据接收
	 *			2、数据验证
	 *          3、更新数据
	 *			4、设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-11-09
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppUser/UserInfo?user_id=198
	 * 方式提交 GET
		request  参   数	
				 apptype  		     APP_KEY  Y      //密钥
				 user_key   		 string   Y      //用户密钥
				 
				 user_id    		 string   Y      //用户ID
				 nicename			 string   N      //昵称
				 mobile              string   N      //联系手机号 -- 紧急联系手机号
				 card_no             string   N      //身份证号
				 //address
				 
		response 参   数   'msg'=>  string    Y		 消息字符串
				  
	 */
	public function index(){
		
		/* 1、数据接收 */
		$posts     = I();
		$user_id   = intval($posts['user_id']);
		$nickname  = $posts['nickname'];
		$mobile    = $posts['mobile'];
		$card_no   = $posts['card_no'];
		
		/* 2、数据验证 */
		if(!$user_id) $this->apiReturn(array('status'=>'0','msg'=>'参数错误'));
		
		if($nickname && empty($nickname))     		 $this->apiReturn(array('msg'=>'昵称不能为空'));
		if($mobile   && empty($mobile))  		 	 $this->apiReturn(array('msg'=>'手机号不能为空'));
		if($card_no  && empty($card_no))      	     $this->apiReturn(array('msg'=>'身份证号不能为空'));
		if(!Check::check_length($nickname,1,15) && !empty($nickname)) $this->apiReturn(array('msg'=>'请输入姓名 1~15位'));
		if(!Check::check_length($card_no,15,18) && !empty($card_no))  $this->apiReturn(array('msg'=>'请输入身份证号 15~18位'));
		
		/* 3、更新数据 */
		$_POST = array();
		if(isset($nickname))  $_POST['nickname'] = $nickname;
		if(isset($mobile))    $_POST['mobile']   = $mobile;
		if(isset($card_no))   $_POST['card_no']  = $card_no;
		
		if(empty($_POST)) 	  $this->apiReturn(array('msg'=>'无修改提交'));
		$_POST['id'] = $user_id;
		$result = update_data('user');
		
		/* 4、设置信息并返回 */
		if(is_numeric($result)){
			$this->apiReturn(array('status'=>'1','msg'=>'设置成功'));
		}else{
			$this->apiReturn(array('msg'=>'操作失败'));
		}
		
		
	}
	
}