<?php
namespace Backend\Controller\Usermanage;
use Backend\Controller\Base\MillerController;
use Common\Plugin\Sql;
class GroupController extends MillerController {
	/**
	*	用户分组管理
	* 	@author 邹义来
	* 	@time 2016-05-16
	*/
	protected $table="member_role";
	public function index(){
		//1、接收关键字并生成搜索条件
		$keywords = I('get.keywords');
		$map["title"]=array('like',"%$keywords%");
		$map['is_del']=0;
		
		$_REQUEST['r']=10;//分页条数
		//2、调用分页方法查询结果集
		$result=$this->page($this->table,$map,$field=array('id','title','description','type','is_hid'));
		
		//3、传递结果集到试图页面
		$data['search'] = $search;
		$data['keywords'] = $keywords;
		$data['result'] = $result;
		$this->assign($data);
		$this->display();
	}
	/**
	*	添加操作
	*	@流程：
	*	1、是否post接收数据，是post数据则添加处理，不是则模版渲染
	* 	@author 邹义来
	* 	@time 2016-05-16
	*/
	public function add(){
		// 1、是否post接收数据，是post数据则添加处理，不是则模版渲染
		if(IS_POST){
			$this->update();
		}else{
			$this->display('operate');
		}
	}
	/**
	*	修改操作
	*	@流程：
	*	1、是post数据则修改处理
	*	2、不是post接收数据，查询该分组的信息，然后模版渲染
	* 	@author 邹义来
	* 	@time 2016-05-16
	*/
	public function edit(){
		// 1、是post数据则修改处理
		if(IS_POST){
			$this->update();
		}else{
			// 2、不是post接收数据，查询该分组的信息，然后模版渲染
			$id = I('get.ids');
			$map['id'] =intval($id);
			$result = get_info($this->table,$map);
			$data['res'] = $result;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	*	添加、修改处理
	*	@流程：
	*	1、接收数据
	*	2、自动验证数据
	*	3、数据处理
	*/
	public function update(){
		// 1、接收数据
		$post=I('post.');
		// 2、自动验证数据
		$rules = array(
			array('title','require','分组名称不能为空!'),
			array('description','require','分组描述不能为空!'),
			// array('title','','分组名称已经存在！',0,'unique',1),//该功能有bug,修改时不能验证是否存在
		);
		
		//验证分组是否存在
		$maps['is_del']=0;
		$maps['title']=$post['title'];
		$this->check_info_exist($this->table,$maps,$post['id'],"分组已存在！");
		
		// 3、数据处理
		$_POST['addtime']=time();
		$result = update_data($this->table,$rules);
		if(is_numeric($result)){
			$this->success('添加成功',U('index'));
		}else{
			$this->error($result);
		}
	}

}