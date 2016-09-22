<?php
namespace App\Controller\User;

use App\Controller\Base\BaseController;


use Common\Plugin\ChatData;
use Common\Plugin\Socket;
use Common\Plugin\Error;




class SocketController extends BaseController{
	
	public function __autoload() {
		parent::__autoload();
		$this->socket = new Socket();
		$this->error = new Error();
		$this->chat_data = new ChatData();
		
	}
	
	/*发送语音*/
	
	public function send_voice(){
		if($_FILES){
			$tips = $this->socket->send_voice();
		}else{
			$tips =$this->error->tips();
		}
		$this->ajaxReturn($tips);
	}
	
	/*发送图片*/
	public function send_image(){
		
		if($_FILES){
			$tips = $this->socket->send_image();
		}else{
			$tips= $this->error->tips();
		}
		$this->ajaxReturn($tips);
	}
	
	
	/*获取聊天记录*/
	public function get_chat_data(){
		$result = $this->chat_data->get_chat_data();
		$tips = array(
			'status' => '1',
			'msg'   => 'OK',
			'info' => $result
		);
		$this->ajaxReturn($tips);
	}
	
	


}
	