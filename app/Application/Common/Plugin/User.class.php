<?php

	/*
	 * 前台用户插件
	 * @需求：
	 * 后台可以用户
	 * 前台注册登录
	 * @time 2015/08/12
	 * @author 秦晓武
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;
use Common\Org\Operate;

class User extends Main{
	const TABLE = 'user';
	const LIST_LIMIT = 4;
	const URL_LOGIN = 'User/Login/login';
	const URL_REGISTER = 'User/Login/register';
	const URL_FORGETPASSWORD = 'User/Login/forgetpassword';
	const URL_PERSONAL = 'User/Personal/index';
	const URL_LOGINOUT = 'User/Login/loginout';
	
	/*
	 * 登录
	 * @需求：
	 * 页面显示，登录验证
	 * @time 2015/08/15
	 * @author 秦晓武
	 * 修订记录：
	 * 		1、增加Discuz论坛同步登录功能
	 *		修订时间：2015/08/27
	 * 		修订人：康利民 <496651923@qq.com>
	 * */
	function login(){
		if(!IS_POST){
			parent::ext_display('login');
			return '';
		}
		//提前定义登录状态提示
		$error_array=array(
			10=>'成功!',
			1=>'用户不存在,或者被删除!',
			2=>'密码错误!',
			3=>'未定义错误!',
			4=>'添加数据出错!'
		);

		$posts = $_POST;
		//UCenter登录
		new \Ucenter\Client\Client();
		//$login_type为0，表示使用用户名登录
		$login_type=0;
		/*
		//判断登录帐号是否为邮箱
		$pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
		if ( preg_match($pattern,$posts['username'])){
			//$login_type为2，表示使用邮箱登录
			$login_type=2;
		}
		*/
		list($uid,$username, $password, $email)=uc_user_login($posts['username'],$posts['password'],$login_type);
		if($uid > 0) {
			//根据UCenter接口返回的信息判断该站点是否存在该用户
			$info=get_info(self::TABLE,array("id"=>$uid));
					
			//更新登录时间和登录IP
			$_POST = null;
			$_POST['id'] = $uid;
			$_POST['username']=$username;
			$_POST['email']=$email;
			$_POST['password']=md5(md5($posts['password']));
			$_POST['login_time'] = date('Y-m-d H:i:s');
			$_POST['login_ip'] = get_client_ip();
			//每次登录将UC中的用户信息同步到主站，同时将登录时间和登录IP同步更新与添加
			if($info){
				//判断帐号是否被禁用
				if($info['status'] != 1){
					$this->error("账号已被冻结，不允许登录");
				}
				$_POST['last_login_time'] = $info['login_time'];
				$_POST['last_login_ip'] = $info['login_ip'];

				$result=update_data(self::TABLE);
			}else{
				$_POST['id']=$uid;
				$_POST['last_login_time'] = date('Y-m-d H:i:s');
				$_POST['last_login_ip'] = get_client_ip();
				$result=add_data(self::TABLE);
			}
			//获取更新过后的用户信息
			$info=get_info(self::TABLE,array("id"=>$uid));
			
			if(is_numeric($result)){
				//将用户ID、登录帐号、登录信息存入session
				self::update_session($info);
				/*
					说明：将同步登录关键代码存入session，然后在前台共用头部输出该session
					使用方法：
						//判断同步登录代码是否存在，存在则给论坛发出登录通知，然后将同步登录代码session清空，避免第二次刷新页面时重复发送登录通知
						if(session("synlogin")){
							echo session("synlogin");
							session("synlogin",null);
						}
				*/
				session("synlogin",uc_user_synlogin($uid));
				$error_status=10;
			}else{
				$error_status=4;
			}
		} elseif($uid == -1) {
			$error_status=1;
		} elseif($uid == -2) {
			$error_status=2;
		} else {
			$error_status=3;
		}
		if($error_status==10){
			if(session('login_url')==''){
				session('login_url',U('/'));
			}
			$this->success('登录成功！',U('User/Personal/index'));
		}else{
			$this->error($error_array[$error_status]);
		}
	}
	
	/*
	 * 注册
	 * @需求：
	 * 页面显示，注册
	 * @time 2015/08/15
	 * @author 秦晓武
	 * 修订记录：
	 * 		1、增加UCenter同步注册功能
	 *		修订时间：2015/08/27
	 * 		修订人：康利民 <496651923@qq.com>
	 * */
	function register(){
		if(!IS_POST){
			$this->display('register');
			return '';
		}
		$posts=$_POST;
		//提前定义登录状态提示
		$error_array=array(
			10=>'成功!',
			1=>'用户不存在,或者被删除!',
			2=>'密码错误!',
			3=>'未定义错误!'
		);
		/*
		* 1、验证用户名合法性
		* 2、验证密码合法性
		* 3、验证确认密码合法性
		* 4、验证验证码合法性
		* 5、验证全部通过后对密码加密并更新数据库（同时做唯一性验证）
		**/
		if(!I('agree')){
			return $this->error('不同意平台服务条款不能注册!');
		}
		if(I('code') != session('mobile_code')){
			$this->error('验证码错误!');
		}
		if(I('mobile') != session('mobile')){
			$this->error('手机已变更!');
		}
		


		/*
			需要将插入该站点时的数据验证移到这里
			1、手机号码验证
			2、密码验证、两次密码一致性验证
		*/


		//UCenter注册，UCenter注册成功后才能将用户信息插入站点用户表
		new \Ucenter\Client\Client();
		$ucresult = uc_user_register(I('mobile'),I('password'));

		switch ($ucresult) {
			case 0:
				$this->error('未定义');
				break;
			case -1:
				$this->error('用户名不合法!');
				break;
			case -2:
				$this->error('包含不允许注册的词语!');
				break;
			case -3:
				$this->error('用户名已经存在!');
				break;
			case -4:
				$this->error('Email 格式有误!');
				break;
			case -5:
				$this->success('Email 不允许注册!');
				break;
			case -6:
				$this->error('该 Email 已经被注册!');
				break;
			default:

		
				$cur_ip = get_client_ip();
				$cur_time = date('Y-m-d H:i:s');
				$_POST = array(
					'id'		=> $ucresult,
					'password'	=> md5(md5(I('password'))),
					'password1' => I('password'),
					'password2' => I('password2'),
					'add_ip'	=> $cur_ip,
					'login_ip'	=> $cur_ip,
					'last_login_ip' => $cur_ip,
					'add_time'	=> $cur_time,
					'login_time'=> $cur_time,
					'last_login_time' => $cur_time,
					'username'	=> I('mobile'),
					'mobile'	=> I('mobile'),
				);
				/*
				 * 验证条件需要移植到UCenter注册之前，否则会出现不论是否条件符合，只要符合UCenter的条件即可注册成功，移植完成后即可将以下验证条件删除
				 */
				$rules=array(
					array('mobile','require','请填写正确手机号!'),
					array('username','','用户名已存在',1,'unique',1),
					array('mobile','/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$/','请填写正确手机号!'),
					array('password1','require','请填写密码!'),
					array('password1','/^\w{6,15}$/','密码在6-15位!'),
					array('password2','require','请填写密码!'),
					array('password2','password1','两次填写的密码不一致!',1,'confirm'),
				);
				$result = add_data(self::TABLE,$rules);
				if(!is_numeric($result)) $this->error($result);
				//UCenter登录
				new \Ucenter\Client\Client();
				list($uid,$username, $password, $email)=uc_user_login($posts['mobile'],$posts['password']);
				if($uid > 0) {
					self::update_session($_POST);
					session("synlogin",uc_user_synlogin($uid));
					$error_status=10;
				} elseif($uid == -1) {
					$error_status=1;
				} elseif($uid == -2) {
					$error_status=2;
				} else {
					$error_status=3;
				}
				if($error_status==10){
					if(session('login_url')==''){
						session('login_url',U('/'));
					}
					$this->success('注册成功！',U('User/Personal/index'));
				}else{
					$this->error($error_array[$error_status]);
				}
		}
	}
	
	function update_session($info = array()){
		//注册成功清空旧的注册验证码
		session('mobile_code',null);
		session('mobile',null);
		//注册成功后将用户ID、登录帐号、登录信息存入session
		session('nickname',$info['nickname']);
		session("user_id",$info['id']);
		session("username",$info['username']);
		session("last_login_time",$info['last_login_time']);
		session("last_login_ip",$info['last_login_ip']);
		session("login_time",$info['login_time']);
		session("login_ip",$info['login_ip']);
	}
	/*
	 * 验证账号是否存在，是否被使用，格式是否正确
	 * 当$account为空时，表示该方法为ajax验证请求
	 * */
	function account_valid($is_ajax=true){
		$account=$_POST['account'];
		if(!$is_ajax){
			if(session('get_account')!=$account){
				$this->error("帐号已更换，请重新发送验证码!");
			}
			if(session('get_code')!=$_POST['code']){
				$this->error("验证码错误!");
			}
		}

		$is_telephone=0;
		$is_email=0;
		//判断用户填写的是否是手机号码
		if(preg_match('/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$/', $account)){
			$_POST['telephone']=$account;
			$is_telephone=1;
			//当填写的为手机号码时 判断是否被使用，如果被使用要求更换手机号码
			$info=get_info('member',array('telephone'=>$account));
			if($info){
				$this->error('手机号已被使用!');
			}
		}
		
		//判断用户填写的是否是邮箱
		if ( preg_match( '/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i', $account ) ){ 
			$_POST['email']=$account;
			$is_email=1;
			//当填写的为邮箱时 判断是否被使用，如果被使用要求更换邮箱
			$info=get_info('member',array('email'=>$account));
			if($info){
				$this->error('邮箱已被使用!');
			}
		}
		if($is_telephone==0 && $is_email==0){
			$this->error('请输入正确的手机号/邮箱！');
		}
		if(!$is_ajax){
			$this->success('账户验证通过!');
		}
	}
}