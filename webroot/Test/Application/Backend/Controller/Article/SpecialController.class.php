<?php
namespace Backend\Controller\Article;
use Backend\Controller\Article\BaseController;
class SpecialController extends BaseController {
	/**
	*	@param $table 专题表
	*/
	protected  $table = 'special';
	protected  $cache_data = 'special';
	/**
	* 	专题列表
	* 	@流程分析：
	* 	1、获取传入的值
	* 	2、若没有值则直接获取所有专题
	* 	@time 2016-05-17
	* 	@author 邹义来
	*/
	public function index(){
		$keywords = trim(I('get.keywords'));
		$map['title'] = array('like',"%$keywords%");
		$data['keywords'] = $keywords;

		$type=I('type');
		if($type){
			$map['type']=$type;
			$data['type'] = I('type');
		}

		$map['is_del'] = 0;
		$_REQUEST['r']=20;
		$result = $this->page($this->table,$map,$field=array('id,title,talent_title,role_uid,sort,type,description,group_id'));
		$data['result'] = $result;
		$this->assign($data);
		$this->display();
	}
	/**
	* 	添加专题
	* 	@流程分析：
	* 	1、判断是否为post提交
	* 	2、如果是则进行添加操作，否则输出到模板
	* 	@time 2016-05-17
	* 	@author 邹义来
	*/
	public function add(){
		if(IS_POST){
			$this->update();
		}else{
			$group=$this->get_group_info();
			$data['res']=$group;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	* 	修改专题
	* 	@流程分析：
	* 	1、获取传入的专题id
	* 	2、修改专题
	*	@time 2016-05-17
	* 	@author 邹义来
	*/
	public function edit(){
		if(IS_POST){
			$this->update();
		}else{
			$id = I('get.ids');
			$map['id'] = $id;
			$info = get_info($this->table,$map);
			$data['info'] = $info;
			$group=$this->get_group_info();
			$data['res']=$group;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	* 	修改与添加专题共用函数
	*/
	public function update(){
		$post = I('post.');
		$rules = array(
			array('title','require','专题名称不能为空'),
			array('talent_title','require','达人称号不能为空'),
			// array('title','','专题名称已经存在！',0,'unique',1),//有bug
			// array('talent_title','','达人名称已经存在！',0,'unique',1),//有bug
		);

		//验证专题名称是否存在
		$maps['is_del']=0;
		$maps['title']=$post['title'];
		$this->check_info_exist($this->table,$maps,$post['id'],"专题名称已经存在！");
		unset($maps['title']);
		//验证达人名称是否存在
		$maps['talent_title']=$post['talent_title'];
		$this->check_info_exist($this->table,$maps,$post['id'],"达人名称已经存在！");
		
		$_POST['group_id']=implode($post['group_id'],',');	
		$_POST['addtime']=time();
		$result = update_data($this->table,$rules);
		if(is_numeric($result)){
			$this->success('添加成功',U('index'));
		}else{
			$this->error($result);
		}
	}
	/**
	*	查看分组下的具体情况
	*	
	*/
	public function see(){
		$id=intval(I('get.ids'));
		$map['id']=$id;
		$res=get_info($this->table,$map,$field=array('id','title','talent_title','description','role_uid','type','group_id'));
		
		if($res['type']=='2'){
			if($res['group_id']!='0'){
				$res['group']=$this->get_group_info($res['group_id']);
			}else{
				$res['group']="0";
			}
		}
		$data['res']=$res;
		$this->assign($data);
		$this->display();
	}
	/**
	*	获取参与人的昵称
	*	@param  $id 用户的id 
	*/
	public function get_role_info(){
		$id=intval(I('id'));
		$map['role_id']=$id;
		/*获取总数*/
		$data['count']=count_data('member' , $map, $field = 'id' );
		/*分页参数设置*/
		$p=trim(I('post.p'))?intval(I('post.p')):'0';
		$num=10;
		$data['num']=$num;
		/*获取结果集*/
		$res=M('member')->field('id,nickname')->where($map)->limit($p*$num,$num)->select();
		$data['res']=$res;
		echo json_encode($data);
	}

	/**
	*	移除用户组
	*/
	public function move_out_group(){
		$id=I('ids');
		if(empty($id)){
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST['id']=array('in',$id);
		}else{
			$_POST['id']=$id;
		}
		$_POST['role_id']=0;
		$res=update_data('member');
		if($res){
			$this->success("已成功移除分组！");
		}else{
			$this->error("移除失败！");
		}
	} 
}