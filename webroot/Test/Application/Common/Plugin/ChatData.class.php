<?php
/*
 *	获取聊天记录类
 * */
namespace Common\Plugin;


class ChatData {

	/*获取用户的聊天记录*/
	
	public function get_chat_data(){
		return $this->deal_data();
	}
	
	
	/*获取远程文件*/
	public function file_get_data(){
		$url = DOMAIN_PATH.'/qbk/code/Chat/image/test.php';

		return file_get_contents($url);
		
	}
	
	public function deal_data(){
		
		$result = $this->file_get_data();
		
		$results = explode('|',$result);
		
		foreach($results as $v){
			if(!empty($v)){
				$_list[] = json_decode($v,true);
			}
			
		}
		return $_list;
	}
	
}