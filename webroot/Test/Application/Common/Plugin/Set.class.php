<?php
namespace Common\Plugin;
use Common\Plugin\Member;
use Common\Plugin\Error;
use Common\Org\Database;
use Common\Plugin\Sql;
/*
 * 个人中心处理类
 * */
class Set {
	
	protected $table='special';
	
	protected $table_2='member';
	
	protected $table_3='feedback';
	
	protected $view = '';
	
	
	protected $filed = true;
		
	protected $limit = '20';
	
	private $type = 'page';
	
	private $order = 'addtime desc';
	
	private $error = '';
	
	private $rules = array();
	
	private $_post = array();
	
	
	public function __construct() {
		
		$this->errors = new Error();
		$this->member = new Member();
	}
	
	/*获取专题列表*/
	public function publish_special(){
		
		$result = Cache::db_table($this->table,array('order'=>'id desc'));
		
		return $result;
	}
	
	/*添加专题*/
	public function add_special(){

		$post = $_POST;
		if($this->get_rules($post)){
			$_POST['addtime'] = time();
			$result = Database::update_data($this->table);
			if(is_numeric($result)){
				$data = array(
					'id' => $result,
					'sort' => $result,
				);
				return Database::update_data($this->table,'','',$data);
			}
		}else{
			return $this->error;
		}
		
	}
	
	/*编辑专题分类*/
	public function edit_special(){
		
		$post = $_POST;
		if($this->get_rules($post)){
			return Database::update_data($this->table);
		}else{
			return $this->error;
		}
	}
	
	/*专题排序*/
	public  function special_sort(){
		$post = $_POST;
		$sql = Sql::specia_sort_sql($this->table,$post);
		return Database::execute_sql($sql);
	}
	
	/*删除分类*/
	public  function del_special($id){
		$_POST = array(
			'id' => $id,
			'is_del' => 1,
		);
		return Database::update_data($this->table);
	}
	
	/*添加验证*/
	
	public function get_rules($post){
		
		if(!$post['title']){
			$this->error = '标题不能为空';
			return false;
		}else{
			return true;
		}
		
	}
	
	
	/*设置专题的人员列表*/
	public function perason_list(){
		$special_id = I('get.special_id');
		if($special_id){
			$info = get_info($this->table,array('id'=>$special_id));
			$list_ids = explode(',',$info['role_uid']);
		}else{
			$list_ids = array();
		}
		
		$keywords = I('get.keywords') ;
		if($keywords){
			$map = array(
				'nickname' => array('like','%'.trim($keywords).'%'),
			);
		}else{
			$map = array();
		}
		
		$default_map = array(
			'is_hid' => '0',
			'is_del' => '0'
		);
		$map = array_merge($default_map,$map);

		$result = $this->member->get_member_result($map,'id,nickname,icon','page');
		$list = $this->member->get_member_special();
		/*用户参与专题获取*/
		foreach($result['list'] as $k=>$v){
			$result['list'][$k]['special_text'] = ($list[$v['id']]['special_text'])?$list[$v['id']]['special_text']:array();
			
			/*是否选择*/
			$result['list'][$k]['select'] = (in_array($v['id'],$list_ids))?'1':'0';
		}
		
		return $result;
	}
	
	/*编辑专题分类人员列表*/
	public function get_perason_list(){
		$special_id = I('get.special_id');
		$info = get_info($this->table,array('id'=>$special_id));
		$map = array(
			'id' => array('in',$info['role_uid'])
		);
		
		$default_map = array(
			'is_hid' => '0',
			'is_del' => '0'
		);
		$map = array_merge($default_map,$map);

		$result = $this->member->get_member_result($map,'id,nickname,icon','page');
		$list = $this->member->get_member_special();
		/*用户参与专题获取*/
		foreach($result['list'] as $k=>$v){
			$result['list'][$k]['special_text'] = ($list[$v['id']]['special_text'])?$list[$v['id']]['special_text']:array();	
		}
		
		return $result;
	}
	
	/*
	 * 账号管理
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function account_management(){
		$uid = I('get.uid');
		$info = Database::get_info($this->table_2,array('id'=>$uid));
		return $info;
	}
	
	
	
	/*
	 * 更换手机号码
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function change_mobile(){
		
		$this->input_check();
		
		return  Database::update_data($this->table_2,$this->rules);
		
	}
	
	
	
	/*
	 * 编辑个人资料
	 * @author Do
	 * @time 2016-05-05
	 * */
	public function set_data(){
		/*输入数据检测*/
		
		return Database::update_data($this->table_2);
		
		
	}
	
	
	public  function input_check(){
		foreach($_POST as $key=> $value) {

			call_user_func(array($this, 'check_'.$key), $key);
			
		}
		
	}
	
	public function check_mobile($field){
		$this->rules[] = array($field,'require','请填写手机号码!');
		
		$this->rules[] = array($field,'/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$|17[0-9]{9}$/','手机格式不正确');
	}
	
	
	public function check_code($field){
		$this->rules[] = array($field,'require','请填写验证码!');
		$this->rules[] = array($field,session('code'),'验证码错误',0,'equal');
	}
	
	public function check_password($field){
		$this->rules[] = array($field,'require','请设置密码!');
	}
	
	public function check_spassword($field){
		$this->rules[] = array($field,'require','请设置密码!');
		$this->rules[] = array($field,'/^[a-z\d]{6,15}$/i','密码设置长度6~15位');
	}
	
	public function check_content($field){
		$this->rules[] = array($field,'require','请填写反馈内容!');
	}
	
	
	
	public function bind_account($type){
		switch($type){
			case 1:
				return $this->bind_mobile();
				break;
			case 2:
				return $this->bind_sina();
				break;
			case 3:
				return $this->bind_weixin();
				break;
			case 4:
				return $this->bind_qq();
				break;
			default:;
		}
	}
	
	
	
	public function bind_mobile(){
		
		if($_POST){
			$_POST['spassword'] = $_POST['password'];
			$_POST['password'] = md5(md5($_POST['password']));
			$this->input_check();
			return   Database::update_data($this->table_2,$this->rules);
			
		}else{
			return '参数错误';
		}
		
	}
	
	public function bind_qq(){
		
		if($_POST){
			if($_POST['qq_open_id']){
				$info = get_info($this->table_2,array('qq_open_id'=>$_POST['qq_open_id']));
			}
			if($info) return '该QQ账号已绑定';
			Return Database::update_data($this->table_2);
			
		}else{
			return '参数错误';
		}
	}
	
	public function bind_weixin(){
		if($_POST){
			if($_POST['weixin_open_id']){
				$info = get_info($this->table_2,array('qq_open_id'=>$_POST['qq_open_id']));
			}
			if($info) return '该微信账号已绑定';
			return  Database::update_data($this->table_2,$this->rules);
		}else{
			return '参数错误';
		}
	}
	
	public function bind_sina(){
		if($_POST){
			if($_POST['sina_open_id']){
				$info = get_info($this->table_2,array('qq_open_id'=>$_POST['qq_open_id']));
			}
			if($info) return '该新浪账号已绑定';
			return  Database::update_data($this->table_2,$this->rules);
		}else{
			return '参数错误';
		}
	}
	
	
	/*隐私设置*/
	public function set_privacy(){
		$type = I('post.type');
		switch($type){
			case 1:
				/*关注显示*/
				$data = array(
					'id' => I('post.id'),
					'is_attention' => I('post.type_value','0','int')
				);
				break;
			case 2:
				/*关注粉丝*/
				$data = array(
					'id' => I('post.id'),
					'is_fans' => I('post.type_value','0','int')
				);
				break;
			case 3:
				/*关注我喜欢的文章*/
				$data = array(
					'id' => I('post.id'),
					'is_favor' => I('post.type_value','0','int')
				);
				break;
			default:;
		}
		
		return  Database::update_data($this->table_2,'','',$data);
	}
	
	/*
	 * 反馈
	 * @author Do
	 * @time 2016-05-04
	 * */
	public function feedback(){
		$this->input_check();
		return  Database::update_data($this->table_2,$this->rules);
	}

	
	
	
	
	
}