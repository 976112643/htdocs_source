<?php
namespace App\Controller\Home;

use Common\Controller\AppController;

use Common\Plugin\Lable;
use Common\Plugin\Member;
use Common\Plugin\Find;
use Common\Plugin\Error;
use Common\Plugin\Follow;
use Common\Plugin\Socket;
use Common\Org\Cache;

class FindController extends AppController{
	
	
	/*该页面不需要登录*/
	
	
	
	public function __autoload() {
		$this->lable = new Lable();
		$this->member = new Member();
		$this->find = new Find();
		$this->error = new Error();
		$this->follow = new Follow();
		$this->socket = new Socket();
	}

	
	/*
	 *	1：发现页面的数据信息 
     *	2: 不用登录可以正常的访问，但是不可以进行评论操作
	 *	@time 2016-4-18
	 *	@author	 Do
	 *
	 *	*/
	 
	 
	 
	public function index(){
		$type = I('get.type');
		if($type>0){
			$tips = $this->get_sr_feed($type);
		}else{
			$tips = $this->get_hot_data();
		}
		$this->ajaxReturn($tips,'json');
		
	}
	
	
	/*获取发现页面头部标题*/
	public function get_topic(){
		$list = Cache::db_table('special');
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($list)?$list:array(),
		);
		$this->ajaxReturn($tips,'json');
	}
	
	
	
	
	/*获取热门数据*/
	public function get_hot_data(){
		/*热门标签*/
		$lable_result = $this->get_lable();
		
		$data['lable_result']  = ($lable_result )?$lable_result :array();
		
		/*热门达人*/
		
		$talent_result = $this->get_talent();

		$data['talent_result'] = ($talent_result)?$talent_result :array();
		
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => $data,
		);
		return $tips;
	}
	
	
	/* 获取标签
	 * @parm  $limit 请求条数  $filed  请求字段   $type  请求类型 是查询全部 还是翻页查询 $ordr 排序
	 *
	 * */
	 
	public function get_lable(){
		$filed = array('id','name','activity');
		$limit = '6';
		$type = 'all';
		return $this->lable->get_recommend_lable($limit,$filed,$type,$order);
	}
	
	/* 获取达人
	 * @parm  $limit 请求条数  $filed  请求字段   $type  请求类型 是查询全部 还是翻页查询
	 *
	 * */
	public function get_talent(){
		$filed = 'id,nickname,attention_count,fans_count,feed_count,fond_count,icon';
		$limit = '6';
		$type = 'all';
		$order = 'fans_count desc specia_feed_count desc';
		return $this->member->get_recommend_talent($limit,$filed,$type,$order);
	}
	
	/* 获取更多标签
	 * @parm  $limit 请求条数  $filed  请求字段   $type  请求类型 是查询全部 还是翻页查询
	 *
	 * */
	 
	public function get_more_lable(){
		$type = I('get.type');
		$filed = array('id','name','activity');
		$limit = '20';
		$type_select = 'page';
		$order = 'activity desc';
		if($type){
			$specia_info = get_info('special',array('id'=>$type));
			if($specia_info['special_lable']){
				$map['id'] = array('in',$specia_info['special_lable']);
			}else{
				$map['id'] = array('lt',-1);
			}
			
		}else{
			$map = array();
		}
		$result = $this->lable->get_recommend_lable($limit,$filed,$type_select,$order,$map);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips,'json');
	}
	
	
	/* 获取更多达人
	 * @parm  $limit 请求条数  $filed  请求字段   $type  请求类型 是查询全部 还是翻页查询
	 *
	 * */
	public function get_more_talent(){
		
		$type = I('get.type');
		$filed = 'id,nickname,attention_count,fans_count,feed_count,fond_count,icon';
		$limit = '20';
		$type_select = 'page';			/*本来是打算写type的但是接口用type做了参数*/
		$order = 'fans_count desc';
		if($type){
			$member_specia_result = get_result('member_specia',array('specia_id'=>$type));
			foreach($member_specia_result as $v){
				$ids[] = $v['uid'];
			}
			$ids = implode(',',$ids);
			if($ids){
				$map = array(
					'member.id' => array('in',$ids)
				);
			}else{
				$tips = array(
					'status' => '1',
					'msg' => 'OK',
					'info' => array(),
				);
				$this->ajaxReturn($tips,'json');
			}
		}
		$result = $this->member->get_recommend_talent($limit,$filed,$type_select,$order,$map);
		
		if(I('get.uid')){
			$result['list'] = $this->follow->get_member_list_follow($result['list']);
		}else{
			foreach($result['list'] as $k=>$v){
				$result['list'][$k]['follow_states'] = '1';
			}
		}
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips,'json');
	}
	
	
	
	
	
	/* 获取标签文章详情
	 * @parm  $limit 请求条数  $filed  请求字段   $type  请求类型 是查询全部 还是翻页查询
	 *
	 * */
	 
	public function get_lable_detail(){
		$lable_id = I('get.lable_id');
		if(!$lable_id) $this->ajaxReturn($this->error->tips());
		$map = array(
			'feed.feed_lable' => array('like','%,'.$lable_id.',%')
		);
		$result = $this->find->find($map);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result:array(),
		);
		$this->ajaxReturn($tips);
		
	}
	
	/*获取专题文章*/
	public function get_sr_feed($type){
		/*尚软说的id为1*/
		$map = array(
			'feed.special_id' => $type,
		);
		$result = $this->find->find($map);

		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		return $tips;
	}
	
	/*获取展示页文章评论 默认显示三条 所以给4条数据*/
	
	public function get_comment(){
		$id = I('get.id');
		$limit = '10';
		$type = 'page';
		if(!$id) $this->ajaxReturn($this->error->tips());
		$map = array('feed_id'=>$id,'is_del'=>'0','is_hid'=>'0');
		$result = $this->find->get_index_comment($map,$type,$limit);

		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	
	/*获取文章详情*/
	public function get_feed_detail(){
		$id = I('get.id');
		
		if(!$id) $this->ajaxReturn($this->error->tips());
		
		$map = array('feed.id'=>$id);
		$type = 'page';
		$limit  =1;
		$result = $this->find->find($map,$type,$limit);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	/*获取文章热度*/
	
	public function get_hot(){
		$id = I('get.id');
		if(!$id) $this->ajaxReturn($this->error->tips());
		$map = array('feed_id'=>$id);
		$result = $this->find->get_hot($map);
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => ($result['list'])?$result['list']:array(),
		);
		$this->ajaxReturn($tips);
	}
	
	/*首页推荐*/
	public function get_home_recommend(){
		$map = array(
			'feed.admin_id' => array('gt','0'),
			'feed.is_del' => 0
		);
		$result = get_result(D('FeedView'),$map,'','addtime desc','3');
		foreach($result as $v){
			$info = get_info('feed_image',array('feed_id'=>$v['id']));
			$_list[] = array(
				'id'=> $v['id'],
				'type'=>1,
				'image'=> ($info['image'])?DOMAIN_PATH.__ROOT__.'/'.$info['image']:'',
				'title'=>($v['feed_title'])?$v['feed_title']:'尚软说',
				'name'=>"尚软说"
			);
		}
		$tips = array(
			'status' => '1',
			'msg' => 'OK',
			'info' => $_list,
		);
		$this->ajaxReturn($tips);
	}
	
	public function test(){
		if($_POST){
			dump($this->socket->send_voice());
		}else{
			echo '<html> 
				<head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"><title>只使用html   怎样实现 上传文件？_百度知道      </title><link rel="alternate" type="application/rss+xml" title="“只使用html   怎样实现 上传文件？”的最新回答（RSS 2.0）" href="http://zhidao.baidu.com/q?ct=20&qid=68168077&pn=65535&rn=25&tn=rssqb"> 
				<link href="/ikqb.css" rel="stylesheet" type="text/css"> 
				</head> 
				<body><form action="'.U('test').'" method="post" enctype ="multipart/form-data" runat="server">  
				<input id="File1" runat="server" name="file" type="file" />  
				<input type="submit" name="Button1" value="Button" id="Button1" /> 
				</form> 
				</body>  
				</html> ';
		}
	}
	
	public function test1(){
		$text = '结果分析：在strlen计算时，对待一个UTF8的中文字符是3个长度，所以“中文a字1符”长度是3*4+2=14,在mb_strlen计算时，选定内码为UTF8，则会将一个中文字符当作长度1来计算，所以“中文a字1符”长度是6 ';
		echo  msubstr_tag($text,500);
	}
	
	
	
};