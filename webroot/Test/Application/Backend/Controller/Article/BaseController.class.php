<?php
namespace Backend\Controller\Article;
use Backend\Controller\Base\MillerController;
use Common\Plugin\Sql;
class BaseController extends MillerController {
	public function __autoload() {
		parent::__autoload();
	}

	/**
	*	获取分组的信息
	*	@param  $id 分组的id
	*	@流程：
	*	1、有分组id获取单个分组的信息。
	*	2、无分组id则获取所有启用的分组。
	*/
	public function  get_group_info($id=''){
		if(!empty($id)){
			$newid=explode(',',$id);
			$map['id']=array('in',$newid);
		}
		
		$map['is_del']=0;
		$map['is_hid']=0;
		$res=get_result('member_role',$map,$field=array('id','title'));
		return $res;
	}
	
	
	/**
	*	查看该文章的详细内容,用于测试
	*	@param $feed_id 文章的id
	*	@流程：
	*	1、获取文章的信息
	*	2、获取评论信息
	*	3、判断请求来源，查看更多或者ajax基本信息
	*/
	public function get_art_info($feed_id){
		
		// 1、根据文章id获取文章的相关信息
		$article_res = $this->query_sqls(Sql::get_article_detail($feed_id));	
		if($article_res[0]['style']=='2'){
			$maps['feed_id']=$article_res[0]['id'];
			$data['image']=get_result('feed_image',$maps,$field=array('image'));
		}
		$data['article']=$article_res[0];
		
		// 2、根据文章id获取该文章下所有的评论
		$comment_res=$this->query_sqls(Sql::get_comment_detail($feed_id));
		$data['comment']=$comment_res;

		// 3、判断请求来源，查看更多或者ajax基本信息
		$md=I('get.md');
		if($md=='more'){
			$this->assign($data);
		}else{
			$this->assign($data);
			$dat['content'] = $this->fetch('Article/Base/detail');
			$this->ajaxReturn($dat);
		}
	}

	public function del_art(){
		$id=intval(I('get.ids'));
		if(empty($id)){
			$this->error("没有选择条目！");
		}
		$_POST['id']=$id;
		$_POST['is_del']=1;
		$_POST['addtime']=time();
		$res=update_data('feed');
	
		if(is_numeric($res)){
			$this->success("删除成功！");
		}else{
			$this->error($res);
		}
	}
}