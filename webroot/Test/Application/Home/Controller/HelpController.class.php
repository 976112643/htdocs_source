<?php
namespace Home\Controller;
use Home\Controller\HomeController;
class HelpController extends HomeController {
	protected $table="faq";
	/**
	* 	帮助问答列表
	* 	@流程
	* 	1、搜索条件处理
	* 	2、分页参数处理
	* 	3、取结果集，并把answer答案转义解码
	* 	4、判断是否ajax请求，并返回不同的值，有p参数时，为ajax请求
	* 	@time 2016-5-25
	* 	@author 邹义来
	*/
	public function index(){
		$id=intval(I('ids'));
        $data['cid']=$id;
		/*1、搜索条件处理*/
		$title=trim(I('title'));
		$map['title']=array('like',"%$title%");
		$data['title']=$title;
		$map['is_del']=0;
		$map['is_hid']=0;
		/*2、分页参数处理*/
		$p=trim(I('p'));
		$p=I('p')?I('p'):'0';
		/*3、取结果集，并把answer答案转义解码*/
	  	$list=M($this->table)->field('title,answer,sort')->where($map)->order('sort')->limit($p*5,5)->select();
	  	foreach ($list as $key => $value) {
	  		//为什么用htmlspecialchars_decode2次，在后端I方法默认转义1次，但是不够完整，因此在I方法之后再转义1一次，
	  		$value['answer']=htmlspecialchars_decode(htmlspecialchars_decode($value['answer']));
	  		$res[]=$value;
	  	}
	  	/*4、判断是否ajax请求，并返回不同的值*/
	  	if($p=='0'){
	  		$data['res']=$res;
        	$this->assign($data);
        	$this->display();
	  	}else{
	  		$this->ajaxReturn($res);
	  	}
        
    }
    /**
    *	用户意见反馈
    * 	@return [type] [description]
    */
    public function feedback(){
    	$post=I('post.');
    	$mobile=trim($post['mobile']);
    	$content=trim($post['content']);
    	$rules=array(
    		array('mobile','/^1[3578][0-9]{9}$/','手机号格式错误！'),
    		array('content','require','内容不能为空！'),
    	);
    	$_POST['mobile']=$mobile;
    	$_POST['content']=$content;
    	$_POST['addtime']=time();
    	$res=update_data('feedback',$rules);
    	if(is_numeric($res)){
    		$this->success('反馈成功！',U('index'));
    	}else{
    		$this->error($res);
    	}
    }
    public function messages(){
    	$title=I('title');
    	switch ($title) {
    		case '1':
    			$title='传道小秘书';
    			break;
    		case '2':
    			$title='产品建议';
    			break;
    		default:
    			$title='传道小秘书';
    			break;
    	}
    	$data['title']=$title;

    	$this->assign($data);
    	$this->display();
    }
}