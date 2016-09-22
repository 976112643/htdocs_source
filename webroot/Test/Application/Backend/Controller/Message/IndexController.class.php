<?php 
namespace Backend\Controller\Message;
use Backend\Controller\Base\AdminController;

use Common\Plugin\Message;

class IndexController extends AdminController {
	
	public function index(){
	
		switch($_POST['operate']){
			case 'ajax_next':
				$this->ajax_get_next();
				break;
			case 'ajax_replay':
				$this->ajax_replay();
				break;
			default:;
		}
		$map = $this->seach();
		$data = Message::read_rec_message($map);
		$this->assign($data);
		$this->display();
	}
	
	public function reply(){
		$post = $_POST;$_POST=null;
		/*这里需要做一个查询 查询原始信息的信息主题*/
		$info = get_info('message',array('id'=>$post['pid']),'title');
		/*模拟一个post数组*/
		$_POST = array(
			'type' => '0',
			'content' => $post['content'],
			'to_member_id' => '51',
			'pid' => $post['pid'],
			'title' => '回复：'.$info ['title']
		);
		
		$result = Message::send_message();
		if($result===true){
			$this->success('发送成功！');
		}else{
			$this->error($result);
		}
	}
	
	/*
	 * ajax请求上一篇 下一遍的内容
	 *
	 * */
	public function ajax_get_next(){
		$id = $_POST['id'];
		$data['info'] = Message::get_detail($id);
		$data['info']['replay'] = $this->ajax_replay($data['info']['now']);
		$this->assign($data);
		$datas['content'] = $this->fetch('ajax_detail');
		$this->ajaxReturn($datas);
		
	}
	
	/*标记已读*/
	public function had_read(){
		$ids = $_POST['ids'];
		$result = Message::all_read($ids);
		
		if(is_numeric($result)){
			switch($result){
				case '-1' :
					$this->error('请选择操作数据');
					break;
				default :
					$this->success('操作成功！');
			}
		}else{
			$this->error('操作失败！');
		}
	}
	
	
	
	
	/*查询条件*/
	
	public function seach(){
		$map['msg_status.to_member_id'] = '51';
		$map['message.is_hid'] ='0';
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
	
	
	
	/*
	*	收件箱详情
	*
	* */
	public function detail(){
		$id = I('get.id');
		if(!isset($id)){
			echo '数据异常';
		}else{
			$data['info'] = Message::get_detail($id,true);
			$data['info']['replay'] = $this->ajax_replay($data['info']['now']);
			$this->assign($data);
			$this->display();
		}
	}
	
	
	
	/*
	*	ajax请求用户需要回复的邮件
	*
	* */
	public function ajax_replay($info){

		if($info['pid']=='0'){
			$_list = get_info(D('MessageView'),array('message.id'=>$info['msg_id']));
			$html = $_list['content'];
		}else{
			/*翻看信息的时候要加一个判断条件就是小于等于当前的message表*/
			$map = array(
				'message.id|message.pid'=>$info['pid'],
				'message.id' => array('elt',$info['msg_id']),
			);
			$_list = get_result(D('MessageView'),$map);
			$html = '';
			foreach($_list as $v){
				$to_member_info = get_info('member',array('id'=>$v['to_member_id']),'mobile');
				$member_info = get_info('member',array('id'=>$v['member_id']),'mobile');
				$str = Message::replay_html();
				$html .= str_replace(array('%content%','%addtime%','%mobile%','%to_moblie%'), array($v['content'],int_to_date($v['addtime']),$member_info['mobile'],$to_member_info['mobile']), $str);
			}
		}
		
		return $html;
		
	}

}

?>