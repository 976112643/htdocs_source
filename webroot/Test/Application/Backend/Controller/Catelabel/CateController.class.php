<?php
namespace Backend\Controller\Catelabel;
use Backend\Controller\Base\MillerController;
class CateController extends MillerController {
	protected $table = 'sensitive_words ';//敏感词表
	/**
	* 	查看敏感词
	* 	@流程分析：
	* 	1、获取传入的值
	* 	2、若没有值则获取所有敏感词
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function index(){
		$keywords = I('keywords');
		$map['title'] = array('like',"%$keywords%");
		$map['is_del'] = 0;
		$result = $this->page($this->table,$map,$order,$field=array('id','title','is_hid'));
		$data['keywords'] = $keywords;
		$data['result'] = $result;
		$this->assign($data);
		$this->display();
	}
	/**
	* 	修改敏感词
	* 	@流程分析：
	* 	1、获取传入的敏感词id
	* 	2、修改敏感词
	* 	@time 2016-5-16
	* 	@author 邹义来
	*/
	public function edit(){
		if(IS_POST){
			$this->update();
		}else{
			$id = I('get.ids');
			$map['id'] = $id;
			$res = get_info($this->table,$map,true);
			$data['res'] = $res;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	* 	添加敏感词
	* 	@流程分析：
	* 	1、判断是否为post提交
	* 	2、如果是则进行添加操作，否则输出到模板
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function add(){
		if(IS_POST){
			$this->update();
		}else{
			$this->display('operate');
		}
	}
	/**
	* 	修改与添加标签共用函数
	*/
	public function update(){
		$post=I('post.');
		$rules = array(
			array('title','require','敏感词不能为空'),
		);
		$maps['is_del']=0;
		$maps['title']=trim($post['title']);
		$this->check_info_exist($this->table,$maps,$post['id'],"该敏感词已存在");
		
		$result = update_data($this->table,$rules);
		if(is_numeric($result)){
			$this->success('添加成功',U('index'));
		}else{
			$this->error($result);
		}
	}
}