<?php
/*
 *	评论数据类
 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Plugin\Error;
use Common\Plugin\Notice;

class Comment {
	
	protected $table = 'comment';	
	
	protected $table_2 = 'feed';	

	protected $_post = array();							/*传递数组*/
	
	protected $rules = array();							/*验证规则*/
	
	
	public function __construct() {
		
		$this->notice = new Notice();
		
	}
	
	public function operate_comment(){
		$this->input_check();
		$result = Database::update_data($this->table,'','',$this->_post);
		$map_2 = array(
			'id' => $this->_post['feed_id']
		);
		$result_1 = M($this->table_2)->where($map_2)->setInc('comment_count',1); 
		
		/*发送通知*/
		$map = array(
			'feed_uid' => $this->_post['uid']
		);
		$result_2 = $this->notice->send_notice($map,'comment_message','4');
		
		if(is_numeric($result)){
			if($_POST['pid']){
				return Error::tips(21);
			}else{
				return Error::tips(6);
			}
			
		}else{
			if($_POST['pid']){
				return Error::tips(22);
			}else{
				return Error::tips(7);
			}
			
		}
	}
	
	/*
	 * 验证输入的信息是否合法
	 * @author Do
	 * @time 2016-05-03
	 * */
	 
	public  function input_check(){

		foreach($_POST as $key=> $value) {

			call_user_func(array($this, 'check_'.$key), $key);
			
		}
		
	}
	
	
	public function check_uid($field){
		
		$this->rules[] = array($field,'require','数据异常!');
		$this->_post[$field] = I('post.uid','0');
	}
	
	public function check_content($field){
		
		$this->rules[] = array($field,'require','没有填写评论内容哦~~');
		$this->_post[$field] = I('post.content','');
	}
	
	public function check_feed_id($field){
		
		$this->rules[] = array($field,'require','数据异常!');
		$this->_post[$field] = I('post.feed_id',0,'int');
	}
	
	public function check_from_uid($field){
		
		$this->rules[] = array($field,'require','数据异常!');
		$this->_post[$field] = I('post.from_uid',0,'int');
	}
	
	public function check_to_uid($field){
		$this->_post[$field] = I('post.to_uid',0,'int');
	}
	
	public function check_pid($field){	
		$this->_post[$field] = I('post.pid',0,'int');
	}
}