<?php 
namespace Backend\Controller\Help;
use Backend\Controller\Base\MillerController;
use Common\Plugin\Sql;
class FeedbackController extends MillerController {
	protected $table='feedback';
	/**
	*	获取反馈信息
	*/
	public function index(){
		/*分页参数*/
		$p = I('get.p')?I('get.p'):1;
		$num = 10;
		$pages = ($p-1)*$num;
		$map=$this->search_map();
		$_REQUEST['r']=10;
		$res=$this->page($this->table,$map,$order='addtime desc','id,uid,mobile,content,addtime');
		$data['res']=$res;
		$this->assign($data);
		$this->display();
	}

	/**
	*	组合搜索条件
	*/
	public function search_map(){
		$search=I('get.search');
		$keywords=I('get.keywords');
		$type=I('type');
		$data['type']=$type;
		$map=" is_del=0 ";
		if($type=='0'){
			$map.=" and uid='0'";
		}
		if($type=='1'){
			$map.=" and uid!='0'";
		}
		
		switch ($search) {
			case 'mobile':
				$map.=" and sr_feedback.mobile like '%$keywords%' ";
				break;
			case 'content':
				$map.=" and sr_feedback.content like '%$keywords%' ";
				break;
			default:
				# code...
				break;
		}
		$data['search']=$search;
		$data['keywords']=$keywords;
		$this->assign($data);
		return $map;
	}
}