<?php
/*用户登录注册类*/

namespace Common\Plugin;
use Common\Org\Database;
use Common\Plugin\Rules;
use Common\Plugin\Sql;
use Common\Org\Request;

class User {
	
	protected $table='member';
	
	protected $table_1='notice_count';
	
	protected $table_2='member_count';
	
	protected $table_3='feed_shield';					/*用户屏蔽列表*/
	protected $table_4='member_lable';					/*用户常用列表*/
	
	protected $map = array();							/*传递查询条件*/
	
	protected $_post = array();							/*传递数组*/
	
	protected $rules = array();							/*验证规则*/
	
	
	public function __construct() {
		
		$this->rule = new Rules();
		$this->sql = new Sql();
	}
	
	
	
	
	/*
	 * 登录注册
	 * type 1:网站注册用户登录  2：QQ 登录  3： 微信登录  4：微博登录
	 * @author Do
	 * @time 2016-05-03
	 * */
	public  function login(){
		$post = $_POST;
		
		$type = $post['type'];
		switch($type){
			case '1':
				$this->map = array(
					'mobile'   => $post['mobile'],
					'password' => md5(md5($post['password']))
				);
				break;
			case '2':
				$this->map = array(
					'qq_open_id'   => $post['uid'],
				);
				$this->_post['qq_open_id'] = $post['uid'];
				break;
			case '3':
				$this->map = array(
					'weixin_open_id' => $post['uid'],
				);
				$this->_post['weixin_open_id'] = $post['uid'];
				break;
			case '4':
				$this->map = array(
					'sina_open_id' => $post['uid'],
				);
				$this->_post['sina_open_id'] = $post['uid'];
				break;
			default :;
		}
		$info  =  $this->get_info();
		if($info['icon']){
			$info['icon'] = Data::assUrl($info['icon']);
		}
		/*如果是第三方登录那么需要*/
		
		if($post['type']!='1'&&!$info){
			/*注册 APP */
			
			/*事务*/
			$flag = Database::trans(M($this->table),function() use ($post){
				$result_1 =  $this->update($post);
				$result[] = $result_1;
				$result[] = Database::update_data($this->table_1,'','',array('uid'=>$result_1));
				$result[] = Database::update_data($this->table_2,'','',array('uid'=>$result_1));
				$result[] = Database::update_data($this->table_3,'','',array('uid'=>$result_1));
				$result[] = Database::update_data($this->table_4,'','',array('uid'=>$result_1));
				return $result;
			});
			if(empty($flag)){
				
				$info = Database::get_info($this->table,$this->map);
				/*注册成功后推送消息 产生消息列表*/
				$info['first_login'] = '1';
				/*初次登录添加好友*/
				$fids = Database::get_result('member',array('is_recommend'=>1),'id','','10');
				Database::execute_sql($this->sql->add_follow_list($fids,$info['id']));
				if($info['icon']){
					$info['icon'] = Data::assUrl($info['icon']);
				}
				return $info;
			}else{
				return '登录失败';
			}
			
		}else{
			return $this->return_error_info($info);
		}
	
		
	}
	
	public  function register(){
		/*提交信息验证*/
		$this->input_check();
		$_POST['password'] = md5(md5($_POST['password']));
		$_POST['login_time'] = time();
		/*事务*/
		$flag = Database::trans(M($this->table),function(){
			$result_1 = Database::update_data($this->table,$this->rules);
			$result[] = $result_1;
			$result[] = Database::update_data($this->table_1,'','',array('uid'=>$result_1));
			$result[] = Database::update_data($this->table_2,'','',array('uid'=>$result_1));
			$result[] = Database::update_data($this->table_3,'','',array('uid'=>$result_1));
			$result[] = Database::update_data($this->table_4,'','',array('uid'=>$result_1));
			return $result;
		});
		if(empty($flag)){ 
			return $_POST['mobile'];
		}else{
			return $flag;
		}
		
	}
	
	/*
	 * 用户信息查询
	 * @author Do
	 * @time 2016-05-03
	 * */
	 
	public  function get_info(){
		$default_map = array(
			'is_del' => '0'
		);
		$this->map = array_merge($this->map,$default_map);
		return Database::get_info($this->table,$this->map);
	}

	/*
	 * 返回信息
	 * @author Do
	 * @time 2016-05-03
	 * */
	 
	public  function return_error_info($info){
		if(!$info) {
			return '用户名或密码错误！';
		}else{
			if($info['is_hid']=='1'){
				return '由于您的账号存在异常，已被后台禁用！';
			}else{
				return $info;
			}
		}
		
	}
	
	
	
	/*
	 * 验证输入的信息是否合法
	 * @author Do
	 * @time 2016-05-03
	 * */
	 
	public  function input_check(){

		foreach($_POST as $key=> $value) {

			call_user_func(array($this, 'check_'.$key), $key);
			
		}
		
	}
	
	/*
	 * 验证输入的手机信息是否合法
	 * @author Do
	 * @time 2016-05-03
	 * */
	 
	public function check_mobile($field){
		$this->rules[] = array($field,'require','请填写手机号!');
		$this->rules[] = array($field,$this->rule->rules['mobile'],'请填写正确手机号!');
		$this->rules[] = array($field,'','手机号已存在！',1,'unique',1);
		$this->rules[] = array($field,session('mobile'),'手机号码已变更！',0,'equal');
	}
	
	
	/*
	 * 验证输入的密码信息是否合法
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function check_password($field){
		
		$this->rules[] = array($field,'require','请填写密码!');
	}
	
	public function check_repassword($field){
		
		
		$this->rules[] = array($field,'password','两次密码输入不一致',0,'confirm');
	}
	
	/*判断是否勾选协议*/
	public function check_protocol($field){

		$this->rules[] = array($field,'require','请勾选协议!');
		$this->rules[] = array($field,'1','手机号码已变更！',0,'equal');
	}
	
	/*
	 * 验证输入的验证码信息是否合法
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function check_code($field){
		$this->rules[] = array($field,'require','请填写验证码!');
		$this->rules[] = array($field,session('code'),'验证码错误',0,'equal');
		
	}
	
	
	/*
	 * 验证输入的昵称信息是否合法
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function check_nickname(){
		
	}
	
	
	
	/*
	 * 用户信息插入更新  APP注册的数据
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function update($post){
		$_POST = array(
			'nickname'    => $post['nickname'],
			'icon'		  => $post['icon'],
			'login_time'  => time()
		);
		
		$_POST = array_merge($this->_post,$_POST);
		return Database::update_data($this->table);
	}
	
	
	/*
	 * 发送验证码
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function send_code(){
		return Request::send_mobile_code($_POST['mobile']);
	}
	
	/*
	 * 找回密码 第一步
	 * @author Do
	 * @time 2016-05-03
	 * */
	
	public function find_password(){
		$post = $_POST;
		$result = 1;
		
		if($post['mobile']!=session('mobile')){
			$result = '手机号码已变更！';
		}
		if($post['code']!=session('code')){
			$result = '验证码错误！';
		}
		return $result;
		
	}
	
	
	/*
	 * 找回密码 第二步
	 * @author Do
	 * @time 2016-05-03
	 * */
	public function find_password_2(){
		$this->input_check();
		$info = Database::get_info($this->table,array('mobile'=>session('mobile')),'id');
		$_POST['password'] = md5(md5($_POST['password']));
		$_POST['repassword'] = md5(md5($_POST['repassword']));
		$_POST['id'] = $info['id'];
		return Database::update_data($this->table,$this->rules);
	}
	
	
	
	
	
}