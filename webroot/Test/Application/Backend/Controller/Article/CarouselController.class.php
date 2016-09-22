<?php
namespace Backend\Controller\Article;
use Backend\Controller\Article\BaseController;
use Common\Plugin\Sql;
class CarouselController extends BaseController {
	/**
	 * 	轮播列表
	 *  @time 2016-05-31
	 *  @author 邹义来
	 */
	public function index(){
		$p = I('get.p')?I('get.p'):1;
		$num = 5;
		$pages = ($p-1)*$num;
		$map=$this->search_map();
		/*排序*/
		$order=I('order')?"order by ".I('order')." desc ":"order by id desc ";
		$data['order']=I('order');
		/*列表结果*/
		$result = $this->query_sqls(Sql::get_banner($map,$order,$pages,$num));
		foreach ($result as $key => $value) {
			$maps['feed_id']=$value['id'];
			$value['image']=get_info('feed_image',$maps,$field=array('image'))['image'];
			$res[]=$value;
		}

		$count = $this->query_sqls(Sql::count_banner($map))[0]['count'];
		
		$data['page'] = $this->millerpage($count,$num);
		$data['res'] = $res;
		$this->assign($data);

		$this->display();
	}

	public function search_map(){
		$get = I('get.');
		$map=" and sr_feed.admin_id!='0' ";
		$this->assign($data);
		return $map;
	}
	/**
	 * 	添加轮播图
	 *  @time 2016-05-31
	 *  @author 邹义来
	 */
	public function add(){
		if (IS_POST) {
			$this->update();
		}else{
			$this->display('operate');
		}
	}

	public function edit(){
		if (IS_POST) {
			$this->update();
		}else{
			$id=I('ids');
			$map=" and sr_feed.admin_id!='0' and sr_feed.id=$id ";
			$res = $this->query_sqls(Sql::get_banner_detail($map))[0];
			$maps['feed_id']=$id;
			$res['image']=get_info('feed_image',$maps,$field=array('image'))['image'];
			$data['res']=$res;
			$this->assign($data);
			$this->display('operate');
		}
	}

	public function see(){
		$id=I('ids');
		$map=" and sr_feed.admin_id!='0' and sr_feed.id=$id ";
		$res = $this->query_sqls(Sql::get_banner_detail($map))[0];
		$maps['feed_id']=$id;
		$res['image']=get_info('feed_image',$maps,$field=array('image'))['image'];
		$data['res']=$res;
		$this->assign($data);
		$dat['content']=$this->fetch('Article/Carousel/see');
		$this->ajaxReturn($dat);
	}
	/**
	*	启用、禁用
	*/
	public function able(){
		$hid=I('get.hid');
		$id=I('ids');
		if (empty($id)) {
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST['id']=array('in',$id);
		}else{
			$_POST['id']=$id;
		}
		$_POST['is_hid']=$hid;
		
		$res=update_data('feed');
		if ($res) {
			$this->success("操作成功！",U('index'));
		}else{
			$this->error($res);
		}
	}
	/**
	*	删除
	**/
	public function deldata(){
		
		$id=I('ids');
		if (empty($id)) {
			$this->error("没有选择条目！");
		}
		if(is_array($id)){
			$_POST['id']=array('in',$id);
		}else{
			$_POST['id']=$id;
		}
		$_POST['is_del']=1;
		
		$res=update_data('feed');
		if ($res) {
			$this->success("操作成功！",U('index'));
		}else{
			$this->error($res);
		}
	}
	/**
	* 	添加修改处理
	*/
	public function update(){
		$post=I('post.');
		if (empty(trim($post['title']))) {
			$this->error("文章标题不能为空！");
		}
		if (empty(trim($post['content']))) {
			$this->error("文章内容不能为空！");
		}
		if (empty(trim($post['picName']))) {
			if (empty(trim($post['old_image']))) {
				$this->error("没有选择图片！");
			}else{
				$post['imagePath']=$post['old_image'];
			}
		}else{
			$image = new \Think\Image();
			$image->open($post['picName']);
			$imageName=rand(1,100).basename($post['picName']);
			
			$image->crop($post['w'], $post['h'],$post['x'],$post['y'])->save('./Uploads/banner/'.$imageName);
			$post['imagePath']="Uploads/banner/".$imageName;
			unlink($post['picName']);
		}
		$id=I('id');

		//插入文章feed
		if(!$id){
			/*添加处理*/
			$_POST=array(
        		'style'=>'2',
        		'addtime'=>time(),
        		'admin_id'=>session('member_id'),
        	);
        	$res=update_data('feed');
        	$_POST=array(
				'feed_id'=>$res,
				'image'=>$post['imagePath'],
				'width'=>$post['w'],
				'height'=>$post['h'],
			);
			//插入feed_title
			update_data('feed_image');
			 /*插入feed_content*/
            $_POST=array(
            	'feed_id'=>$res,
            	'feed_title'=>$post['title'],
            	'feed_content'=>$post['content'],
            );
            $content_res=update_data('feed_content');
            if($content_res){
            	$this->success("操作成功！",U('index'));
            }else{
            	$this->error($content_res);
            }
		}else{
			$post['id']=$id;
			$sql=Sql::update_banner($post);
			$res= M()->execute($sql);
			if ($res) {
				$this->success("操作成功！",U('index'));
			}else{
				$this->error($res);
			}
		}
	}


}