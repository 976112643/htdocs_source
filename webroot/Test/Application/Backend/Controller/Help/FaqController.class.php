<?php 
namespace Backend\Controller\Help;
use Backend\Controller\Base\MillerController;
use Common\Plugin\Sql;
class FaqController extends MillerController {
	
	protected $table="faq";
	/**
	*	帮助中心问答列表展示
	*	流程：
	*	1、接收查询条件执行搜索
	*	@time 2016-5-24
	*	@author 邹义来
	*/
	public function index(){
		$map['is_del']=0;
		$_REQUEST['r']=10;
		$keywords=trim(I('keywords'));
		$map['title']=array('like',"%$keywords%");
		$data['keywords']=$keywords;
		$res=$this->page($this->table,$map,$order=" sort",$field=array('id,title,answer,sort,is_hid'));
		$data['res']=$res;
		$this->assign($data);
		$this->display();
	}
	/**
	*	添加问答
	* 	@time 2016-5-24
	*	@author 邹义来
	*/
	public function add(){
		if(IS_POST){
			$this->update();
		}else{
			$this->display('operate');
		}
	}
	/**
	*	修改问答
	* 	@time 2016-5-24
	*	@author 邹义来
	*/
	public function edit (){
		if(IS_POST){
			$this->update();
		}else{
			$id=intval(I('get.ids'));
			$map['id']=$id;
			$res=get_info($this->table,$map,$field=array('id,title,answer,sort,is_hid'));
			$data['res']=$res;
			$this->assign($data);
			$this->display('operate');
		}
	}

	public function ajax_get_answer(){
		$id=intval(I('get.ids'));
		$map['id']=$id;
		$res=get_info($this->table,$map,$field=array('id,title,answer'));
		$answer=htmlspecialchars_decode(htmlspecialchars_decode($res['answer']));
		$this->ajaxReturn($answer);
	}
	/**
	*	添加/修改 问答处理
	* 	@time 2016-5-24
	*	@author 邹义来
	*/
	public function update(){
		$post=I('post.');
		$_POST['title']=trim($post['title']);
		$_POST['answer']=htmlspecialchars(trim($post['answer']));

		$_POST['sort']=intval($post['sort']);
		$_POST['addtime']=time();
		
		$rules=array(
			array('title','require','问题不能为空！'),
			array('answer','require','答案不能为空！'),
		);
		$map['is_del']=0;
		$map['title']=$_POST['title'];
		$this->check_info_exist($this->table,$map,$post['id'],$errorinfo="该问题已存在！");
		
		$res=update_data($this->table,$rules);
		if (is_numeric($res)) {
			$this->success("添加成功！",U('index'));
		}else{
			$this->error($res);
		}
	}
}
 ?>