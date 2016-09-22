<?php
namespace Backend\Controller\Article;
use Backend\Controller\Article\BaseController;
use Common\Plugin\Sql;
class CommentController extends BaseController {
	protected $table = 'Comment';//评论表
	/**
	* 	评论列表
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function index(){
		/*分页参数*/
		$p = I('get.p')?I('get.p'):1;
		$num = 10;
		$pages = ($p-1)*$num;
		/*条件处理*/
		$map=$this->search_map();
		/*获取结果集，并分页*/
		$result = $this->query_sqls(Sql::get_comment_sql($map,$pages,$num));
		$count = $this->query_sqls(Sql::count_comment_sql($map));
		$data['result'] = $result;
		$count = $count[0]['num'];
		$data['page'] = $this->millerpage($count,$num);
		$this->assign($data);
		$this->display();
	}
	/**
	*	搜索条件处理
	*/
	public function search_map(){
		$get=I('get.');
		$keywords = trim($get['keywords']);
		$data['keywords'] = $keywords;
		$fenlei=$get['fenlei'];
		$data['fenlei'] = $fenlei;
		$map="";
		switch($fenlei){
			case 'nickname':
				$map.=" and sr_member.nickname like '%".$keywords."%'";
				break;
			case 'content':
				$map.=" and sr_comment.content like '%".$keywords."%'";
				break;
			case 'title':
				$map.=" and sr_feed_content.feed_title like '%".$keywords."%'";
				break;
			default :
				$map.="";
				break;
		}
	
		$audit=I('get.audit');
		if(is_numeric($audit)){
			$data['audit']=$audit;
			$map.=" and sr_comment.is_audit='".$audit."'";
		}
		$this->assign($data);
		return $map;
	}
	/**
	*	通过审核/不通过审核
	*/
	public function is_audit(){
		$id=I('ids');
		if(empty($id)){
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST [ 'id' ]=array('in',$id);
		}else{
			$_POST [ 'id' ]=intval($id);
		}
		$_POST['is_audit']=I('get.audit');
	
		$res=update_data($this->table);
		if($res){
			$this->success('操作成功');
		}else{
			$this->error($res);
		}
	}
	
	/**
	*	查看此文章下所有的评论
	*	@流程
	*	1、根据评论该获取文章的id
	*/
	public function see(){
		$id=I('get.ids');
		// 1、获取文章的id
		$map['id']=intval($id);
		$feed_id=get_info($this->table,$map)['feed_id'];	
		$this->get_art_info($feed_id);
	}
}