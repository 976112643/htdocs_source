<?php
namespace Backend\Controller\Catelabel;
use Backend\Controller\Base\MillerController;
class LabelController extends MillerController {
	protected $table = 'lable';//标签表
	/**
	* 	查看标签
	* 	@流程分析：
	* 	1、获取传入的值
	* 	2、若没有值则获取所有标签
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function index(){
		$keywords = trim(I('get.keywords'));
		$is_recommend=I('get.is_recommend');
		$order=I('get.order');
		if(is_numeric($is_recommend)){
			$map['is_recommend']=$is_recommend;
			$data['is_recommend']=$is_recommend;
		}
		if($order){
			$data['order']=$order;
			$order=I('get.order')." desc";
		}else{
			$order=" id desc";
		}
		
		$map['name'] = array('like',"%$keywords%");
		$map['is_del'] = 0;
		$_REQUEST['r']=10;//分页条数
		$result = $this->page($this->table,$map,$order,$field=array('id','name','is_hid','is_recommend','activity','addtime'));

		$data['keywords'] = $keywords;
		$data['result'] = $result;
		$this->assign($data);
		$this->display();
	}
	/**
	* 	修改标签
	* 	@流程分析：
	* 	1、post提交数据则，修改处理
	* 	2、无post数据，则取该标签的信息，并模版渲染
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function edit(){
		// 1、post提交数据则，修改处理
		if(IS_POST){
			$this->update();
		}else{
			// 2、无post数据，则取该标签的信息，并模版渲染
			$id = I('get.ids');
			$map['id'] = intval($id);
			$res = get_info($this->table,$map);
			$data['res'] = $res;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	* 	添加标签
	* 	@流程分析：
	* 	1、判断是否为post提交
	* 	2、如果是则进行添加操作，否则输出到模板
	*	@time 2016-05-16
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
		$post = I('post.');
		$rules = array(
			array('name','require','标签名称不能为空'),
			// array('sort','/^[0-9]\d?$|^1[012][0-7]$/','排序请输入0~127的数字'),
			// array('name','','标签名称已经存在！',0,'unique',1),//修改时存在bug
		);
		
		//验证标签名称是否存在
		$maps['is_del']=0;
		$maps['name']=trim($post['name']);
		$this->check_info_exist($this->table,$maps,$post['id'],"该标签已存在！");
		//验证是否为敏感词
		$this->sensitive_judge(trim($post['name']));
		
		$_POST['addtime']=time();
		$result = update_data($this->table,$rules);
		if(is_numeric($result)){
			$this->success('添加成功',U('index'));
		}else{
			$this->error($result);
		}
	}
	/**
	*	推荐标签/取消推荐标签
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
			$_POST [ 'id' ]=intval($id);
		}
		$_POST['is_recommend']=$recommend;

		$res=update_data($this->table);

		if($res){
			$this->success('操作成功');
		}else{
			$this->error($res);
		}
	}
}