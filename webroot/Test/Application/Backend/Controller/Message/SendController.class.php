<?php 
namespace Backend\Controller\Message;
use Backend\Controller\Base\AdminController;
use Common\Plugin\Message;
class SendController extends AdminController {
	protected $table="message";
	
	
	/*
	 *	发件箱功能  
	 *	1：可以搜索  关键字  状态 用户群体
	 *	2：用户可以对发件箱的内容进行删除 禁用  这些操作处理后，前台用户不显示对应的数据
	 * 
	 * */
	public function index(){
		if($_POST['operate']=="ajax_next"){
			$this->ajax_get_next();
		}
		$map = $this->seach();
		$data = Message::read_message($map);
		$data['keywords'] = I('get.keywords');
		$data['msg_list'] = $this->get_cond_serach();
		$this->assign($data);
		$this->display();
	}
	
	
	public function ajax_get_next(){
		$id = $_POST['id'];
		$data['info'] = Message::get_detail($id);
		$this->assign($data);
		$datas['content'] = $this->fetch('detail');
		$this->ajaxReturn($datas);
		
	}
	
	public function seach(){
		$map['member_id'] = session('member_id');
		$gets = I('get.');
		if($gets['keywords']){
			$keywords = trim($gets['keywords']);
			$map['title'] = array('like','%'.$keywords.'%');
		}
		if(!empty($gets['type'])||$gets['type']=='0'){
			$map['type']  = $gets['type'];
		}
		if(!empty($gets['is_hid'])||$gets['is_hid']=='0'){
			$map['is_hid']  = $gets['is_hid'];
		}
		return $map;
	}
	
	/*搜索条件html*/
	public function get_cond_serach(){
		$msg_list = Message::send_type();
		$temp = "<option value=''>请选择</option>";
		$html = $temp;	$html_1 = $temp;
		$gets = I('get.');
		$status_list = array('开启','禁用');
		foreach($msg_list as $k=>$v){
			if((string)$k == $gets['type']){
				$_class = 'selected = "selected"';
			}else{
				$_class = '';
			}
			$html .= '"<option value="'.$k.'" '.$_class.'>'.$v.'</option>"';
		}
		foreach($status_list as $kk=>$val){
			if((string)$kk == $gets['is_hid']){
				$_class_1 = 'selected = "selected"';
			}else{
				$_class_1 = '';
			}
			$html_1 .= '"<option value="'.$kk.'" '.$_class_1.'>'.$val.'</option>"';
		}
		$data['html'] =$html; $data['html_1'] =$html_1;
		return $data;
		
	}
	
	public function detail(){
		$id = I('get.id');
		if(!isset($id)){
			echo '数据异常';
		}else{
			$data['info'] = Message::get_detail($id);
			$this->assign($data);
			$this->display();
		}
	}
	
	
	
	
}

?>