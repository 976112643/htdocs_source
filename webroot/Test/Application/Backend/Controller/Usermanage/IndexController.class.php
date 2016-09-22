<?php
namespace Backend\Controller\Usermanage;
use Backend\Controller\Base\MillerController;
use Common\Plugin\Sql;
use Common\Plugin\Html;
class IndexController extends MillerController {
	protected $table = 'member';//用户表
	/**
	* 	查询用户信息
	* 	@流程分析：
	* 	1、接收关键字并生成搜索条件
	* 	2、调用分页方法查询结果集
	* 	3、传递结果集到试图页面
	* 	@author 邹义来
	* 	@time 2016-05-16
	*/
	
	public function __autoload() {
		parent::__autoload();
		$this->html = new Html();
	}	

	/**
 	* 	用户列表
 	*/
	public function index(){
		/*搜索条件生成*/
		$map=$this->search_map();
		/*分页条数*/
		$_REQUEST['r']=10;
		/*查询结果集*/
		$result=$this->page($this->table,$map,$order='id desc',$field=array('id','icon','mobile','nickname','is_hid','is_recommend','qq_open_id','sina_open_id','weixin_open_id','role_id'));
		
		// $data ['group_html'] = $this->html->group_html();/*权限组下拉框*/
		$data['result'] = $result;
		$this->assign($data);
		$this->display();
	}
	/**
 	* 	搜索条件处理
 	*/
	public function search_map(){
		/*获取用户分组列表*/
		$data['role']=$this->role();
		
		$keywords = trim(I('get.keywords'));
		$search = I('get.search');
		$role_id=trim(I('role_id'));/*分组搜索*/
		if($role_id){
			if(is_numeric($role_id)){
				$map['role_id']=$role_id;
				$data['roleid']=$role_id;
			}else{
				$role_id=explode(',',$role_id);
				$map['role_id']=array('not in',$role_id);
				$data['roleid']=0;
			}
		}
		$is_recommend=I('get.is_recommend');/*推荐搜索*/
		if(is_numeric($is_recommend)){
			$map['is_recommend']=$is_recommend;
			$data['com']=$is_recommend;
		}
		$map["$search"]=array('like',"%$keywords%");/*手机号和电话*/
		$data['search'] = $search;
		$data['keywords'] = $keywords;
		$map['is_del'] = 0;
		$this->assign($data);
		return $map;
	}
	
	/**
	* 	查看用户详情
	* 	@流程分析：
	* 	1、获取要查看的用户id
	* 	2、查看对应id的用户
	*	3、查询用户的标签
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function see(){
		$id = I('ids');
		//查看对应id的用户
		$sql=Sql::user_info_sql($id);
		$res = $this->query_sqls($sql);
	
		$data['res'] = $res[0];
		$this->assign($data);		
		//查询此id下的标签的id集合
		$this->label();
		
		$this->display();
	}
	/**
	* 	查看用户文章列表
	* 	@流程分析：
	* 	1、获取要查看的文章分类
	* 	2、查看对应id的用户
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function article(){
		//此功能暂定
		$ids = I('get.');
		$id = $ids['ids'];
		if(empty($id)){
			$this->error('该用户不存在');
		}
		//直接跳转前台
		$url="http://baidu.com";
		header('location:'.$url);

	}
	/**
	* 	查看用户标签列表
	* 	@流程分析：
	* 	1、获取要查看的用户id
	* 	2、查看对应id的用户标签
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function label(){
		$id = I('ids');
		$map['uid'] = $id;
		$lable_id_list = get_info('member_lable',$map,$field=array('lable_id'));
		
		$lable_id = explode(',',$lable_id_list['lable_id']);
		$maps['id'] = array('in',$lable_id);
		$maps['is_del'] = 0;
	
		$lable_res = $this->page('lable',$maps,$order,$field=array('id','name','is_hid'));
		$lable['lable'] = $lable_res;
		
		$this->assign($lable);
	}
	/**
	* 	添加用户
	* 	@流程分析：
	* 	1、判断是否为post提交
	* 	2、如果是则进行添加操作，否则输出到模板
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function add(){
		if(IS_POST){
			$post = I('post.');
			$pass_length=strlen(trim(I('post.password')));
			
			$rules = array(
				array('nickname','require','用户名不能为空'),
				array('nickname','','用户名已经存在！',0,'unique',1),
				array('rpassword','/^([\w\W]){6,16}$/i','请输入6-16位密码'),
				array('mobile','/^1[34578]{1}[0-9]{9}$/','请输入正确的手机号！'),
				array('mobile','','该手机号已被注册！',0,'unique',1),
			);
			
			/**敏感词汇验证*/
			$this->sensitive_judge($data['nickname']);
			
			$_POST = array(
				'nickname'=>$post['nickname'],
				'password'=>MD5(MD5($post['password'])),
				'mobile'=>trim($post['mobile']),
				'rpassword' => $post['password'],
			);
			
			$result = update_data($this->table,$rules);
			if(is_numeric($result)){
				$this->success('添加成功',U('index'));
			}else{
				$this->error($result);
			}
		}else{
			$this->display();
		}
	}
	/**
	*	推荐达人/取消达人
	*/
	public function is_recommend(){
		$id=I('ids');
		
		$recommend=I('get.recommend');

		if(empty($id)){
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST [ 'id' ]=array('in',$id);
		}else{
			$_POST [ 'id' ]=$id;
		}
		
		$_POST['is_recommend']=$recommend;
		
		$res=update_data($this->table);

		if($res){
			$this->success('操作成功');
		}else{
			$this->error($res);
		}
	}
	
	/**
	*	获取分组列表
	*/
	public function role(){
		$map['is_del']=0;
		$map['is_hid']=0;
		$res=get_result('member_role',$map,$field=array('id,title'));
		return $res;
	}
	
	/**
	*	修改分组列表
	*/
	public function update_role(){
		$id=I('ids');
		if(empty($id)){
			$this->error("没有选择条目！");
		}
		$id=explode(',',$id);
		$_POST['id']=array('in',$id);
		$_POST['role_id']=intval(I('post.role_id'));
		$res=update_data($this->table);
		if($res){
			$this->success("修改成功！",U('index'));
		}else{
			$this->error($res);
		}
	}

}