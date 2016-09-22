<?php
namespace Backend\Controller\Article;
use Backend\Controller\Article\BaseController;
use Common\Plugin\Sql;
class IndexController extends BaseController {
	protected $table = 'feed ';//文章基础信息表
	/**
	* 	文章列表
	* 	@流程分析：
	* 	1、获取传入的值
	* 	2、若没有值则直接获取文章标题
	* 	@time 2016-05-16
	* 	@author 邹义来
	*/
	public function index(){
		/*分页参数*/
		$p = I('get.p')?I('get.p'):1;
		$num = 10;
		$pages = ($p-1)*$num;
		/*组合查询条件*/
		$map=$this->search_map();
		/*排序*/
		$order=I('order')?"order by ".I('order')." desc ":"order by id desc ";
		$data['order']=I('order');
		/*列表结果*/
		$res = $this->query_sqls(Sql::get_article_sql($map,$order,$pages,$num));
		$data['result'] = $res;
		/*分页处理*/
		$count = $this->query_sqls(Sql::count_article_sql($map));
		$count = $count[0]['num'];
		$data['page'] = $this->millerpage($count,$num);
		$this->assign($data);
		$this->display();
	}

	/**
	*	搜索条件处理
	*/
	public function search_map(){
		$get = I('get.');
		$style = $get['style'];
		$status= $get['status'];
		$title=trim($get['title']);
		$map=" and sr_feed.admin_id<='0' ";
		if(is_numeric($style)){
			$map.=" and  sr_feed.style ='".$style."' ";
			$data['style']=$style;
		}
		if(is_numeric($status)){
			$map.=" and  sr_feed.status ='".$status."' ";
			$data['status']=$status;
		}
		if(!empty($title)){
			$map.=" and  (sr_feed_content.feed_title  like '%".$title."%' or sr_feed_content.feed_content like '%".$title."%') ";
			$data['titles']=$title;
		}
		$this->assign($data);
		return $map;
	}

	/**
	*	首页推荐 管理员可以推荐文章至首页  
	*	允许推荐多篇，但是前台展示最多显示4条数据
	* 	@time 2016-05-20
	* 	@author 刘巧
	*/
	public function home_recommond(){
		$status = I('get.status');
		if(!I('get.id')) $this->error('参数错误');
		switch($status){
			case 1:
				$change_status = '2';
				break;
			case 2:
				$change_status = '1';
				break;
			default:;
		}
		$result = $this->home_recommond_update($change_status);
		if(is_numeric($result)){
			$this->success('操作成功');

		}else{
			$this->error($result);
		}
	}
	
	
	/*首页推荐实现方法*/
	public function home_recommond_update($change_status){
		if(!$change_status) return ;
		$map = array(
			'feed.is_del'	=> '0',
			'feed.is_hid' 	=>	'0',
			'feed.id'		=> I('get.id')
		);
		$info = get_info(D('FeedView'),$map);
		if(!$info) return '请查看文章是否被禁用或者删除！';
		$_POST = array(
			'id'     => I('get.id'),
			'status' => $change_status,
		);
		$result = update_data('feed');
		if($info['style']=='2'){
			$image_info = get_info('feed_image',array('feed_id'=>$info['id']));
			$image = $image_info['image'];
		}
		if($change_status=="2"){
			$data = array(
				'uid' 	    => $info['id'],
				'title'     => $info['feed_title'],
				'addtime'   => time(),
				'image'		=> $image,
			);
			$result_1 = update_data('home_recommond','','',$data);
		}else{
			$data = array(
				'is_del' => '1'
			);
			$result_1 = M('home_recommond')->where(array('uid'=>$info['id']))->save($data);
		}
		if(is_numeric($result)&&is_numeric($result_1)){
			return 1;
		}else{
			return '操作失败';
		}

		
	}
	/**
 	* 	查看文章的内容及评论
 	*/
	public function see(){
		$id=I('get.ids');
		$this->get_art_info($id);
		$this->display();
	}
}