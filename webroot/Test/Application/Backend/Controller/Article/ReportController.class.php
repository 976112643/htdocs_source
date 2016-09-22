<?php
namespace Backend\Controller\Article;
use Backend\Controller\Article\BaseController;
use Common\Plugin\Sql;
class ReportController extends BaseController {
	protected $table="feed_report";
	/**
	*	举报文章管理列表
	*	@流程：
	*	1、分页参数
	*	2、搜索条件
	*	@time 2016-05-17
	*	@author 邹义来
	*/
	public function index(){
		/*分页参数*/
		$p = I('get.p')?I('get.p'):1;
		$num = 10;
		$pages = ($p-1)*$num;
		/*组合查询条件*/
		$map=$this->search_map();
		
		$res=$this->query_sqls(Sql::report_info_sql($map,$pages,$num));
		$count = $this->query_sqls(Sql::count_report_sql($map));
		$count = $count[0]['num'];
		$data['page'] = $this->millerpage($count,$num);
		$data['result']=$res;
		$this->assign($data);
		$this->display();
	}
	
	/**
	*	搜索条件处理
	*/
	public function search_map(){
		$get = I('get.');
		$keywords = $get['keywords'];
		$data['keywords'] = $keywords;
		$fenlei=$get['fenlei'];
		$data['fenlei'] = $fenlei;
		$map="";
		switch($fenlei){
			case 'nickname':
				$map.=" and sr_member.nickname like '%".$keywords."%'";
				break;
			case 'title':
				$map.=" and (sr_feed_content.feed_title like '%".$keywords."%' or sr_feed_content.feed_content like '%".$keywords."%') ";
				break;
			default :
				$map.="";
				break;
		}
		$status=$get['status'];
		if(is_numeric($status)){
			$map.=" and sr_feed_report.status =".$status;
			$data['status']=$status;
		}
		$this->assign($data);
		return $map;
	}
	
	/**
	*	删除数据
	*/
	public function deldata(){
		$id=I('ids');
		if(empty($ids)){
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST['feed_id']=array('in',$id);
		}else{
			$_POST['feed_id']=intval($id);
		}
		$_POST['is_del']=1;
		$res=M($this->table)->save($_POST);

		if($res){
			$this->success("删除成功！",U('index'));
		}else{
			$this->error($res);
		}
	}
	
	/**
	*	标记已处理/取消标记已处理
	*	@流程：
	*	1、接收id和要改的值
	*	2、数据验证
	*	3、标记处理
	*	@time 2016-05-17
	*	@author 邹义来
	*/
	public function setstatus(){
		$id=I('ids');
		if(empty($id)){
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST['feed_id']=array('in',$id);
		}else{
			$_POST['feed_id']=intval($id);
		}
		$status=I('get.status');
		$_POST['status']=$status;
		$res=M($this->table)->save($_POST);
		if(is_numeric($res)){
			$this->success("标记成功！");
		}else{
			$this->error($res);
		}
	}
	
	/**
	* 	查看举报文章
	*/

	public function see(){
		$id=I('get.ids');
		$this->get_art_info($id);
	}
}