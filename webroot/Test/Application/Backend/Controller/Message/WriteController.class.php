<?php 
namespace Backend\Controller\Message;
use Backend\Controller\Base\AdminController;
use Common\Plugin\Message;
class WriteController extends AdminController {
	protected $table='member';
	protected $send_table='message';
	protected $send_table_2='msg_status';
	protected $limit = 20;
	
	public function index(){
		if($_POST){
			$type = $_POST['type'];
			$_POST['member_id'] = session('member_id');
			$result = Message::send_message($type);
			if($result===true){
				$this->success('发送成功！');
			}else{
				$this->error($result);
			}
		}else{
			$data['group'] = $this->get_user_group();
			$this->assign($data);
			$this->display();
		}
	}
	
	
	
	/*获取用户的分组*/
	public function get_user_group(){
		$list = Message::send_type();
		$html = '';
		foreach($list as $k=>$v){
			if($k==0){
				$_class="btn-warning btn-default js_only_user";
			}else{
				$_class="btn-default";
			}
			$html.='<span class="btn '.$_class.' btn-sm js_select_group" data-id="'.$k.'">'.$v.'</span> ';
		}
		return $html;
	}
	
	public function detail(){
		$this->display('index');
	}
	
	
}

?>