<?php
namespace Common\Plugin;
use Common\Org\Database;
class Message {
	const table='member';
	const send_table='message';
	const send_table_2='msg_status';
	const model = 'MessageView';
	const limit='1';
					
	
	
	/*
	 * 发送站内信功能 
	 *$_POST = array(
			'to_member_id'
			'title',
			'is_to_home',
			'content',
			'member_id',
		);
	 * @param     $type     1：发送给前台所有用户 2：发送给普通用户  		3：发送给商家 0：发送给个人，后台不可以发送给个人用户
	 * @return    string
	 * */
	 
	static function message_interface(){
		self::send_message();
	}
	
	static function send_message($type='0'){
		$posts = $_POST;
		$result = self::update_message($type,$posts);
		
		if(is_numeric($result)){
			$result1 = self::update_message_stu($type,$posts,$result);
		}
		
		if(is_numeric($result)&&is_numeric($result1)){
			return true;
		}else{
			if(!is_numeric($result)){
				return $result;
			}
			if(!is_numeric($result1)){
				return $result1;
			}
		}
		
	}
	
	/*
	 *	插入message表 后台不进行个人信息的发送
	 *	@param  $type  发送的类型   全部  商家  普通用户
	 *	@param $posts 传入的$_POST数组
	 */
	static function update_message($type,$posts){
		$_POST = array(
			'title' => $posts['title'],
			'content' => $posts['content'],
			'member_id' => $posts['member_id'],
			'type' => $type,
			'addtime' => time(),
			'pid' => $posts['pid'],
			'is_to_home' => $posts['is_to_home'],
		);
		if(empty($posts['title'])){
			return '标题不可以为空！';
		}
		if(empty($posts['content'])){
			return '内容必须填写！';
		}
		
		$result = update_data(self::send_table);
		return $result;
	}
	
	/*  
	 *  插入msg_status表
	 *	$type = 0 表示发送给个人消息  $type = 1 发送全部人员 $type   = 2 发送给普通用户 ￥type 	= 3 发送给商家用户
	 *
	 */
	static function update_message_stu($type,$posts,$result){
		switch($type){
			case '0':
				$result = self::df_send($posts,$result);
				break;
			case '1':
				$is_business = '';
				$result = self::qf_send($is_business,$result);
				break;
			case '2':
				$is_business = '0';
				$result = self::qf_send($is_business,$result);
				break;
			case '3':
				$is_business = '1';
				$result = 	self::qf_send($is_business,$result);
				break;
			default :
				$result = self::df_send($posts,$result);
		}
		
		return $result;
		
	}
	
	/*单发
	 *	@param $result message表的id
	 *	return $result 
	 */
	public function df_send($posts,$result){
		$_POST = null;
		if(empty($posts['to_member_id'])){
			return '用户名不可以为空！';
		}
		$_POST = array(
			'to_member_id' =>  $posts['to_member_id'],
			'msg_id' => $result,
			'addtime' => time(),
		);
		$result = update_data(self::send_table_2);
		return $result;
	}
	
	/*	群发
	 *	@param $is_business 判断用户类型 0：代表普通用户 1：代表商家  null  全部用户
	 *	@param $result message表的id
	 *	return $result 
	 */
	public function qf_send($is_business,$result){
		if(empty($is_business)){
			$is_business = array('gt',-1);
		}
		$map = array(
			'is_del' => '0',
			'is_hid' => '0',
			'is_business' => $is_business
		);
		$member_list = get_result(self::table,$map,'id');
		$data = array();
	
		foreach($member_list as $v){
			$data[]  = array(
				'to_member_id' => $v['id'],
				'msg_id' => $result,
				'addtime' =>time(),
			);
		}
		$sql_string = self::addSql($data,self::send_table_2);
		$result = Database::execute_sql($sql_string);
		return $result;
	}
	
	/*
	 * 生成批量插入sql
	 * @param     data     二维数组
	 * @param     table    表名
	 * @return    string
	 * */
	 
	static  function addSql($data,$table){
		if(empty($data) || empty($table))  return '';
		$value = implode('`,`',array_keys($data[0]));
		$sql   = 'INSERT INTO `'.'sr_'.$table.'` (`'.$value.'`) VALUES ';
		foreach($data as $val){
			$sql .= "(";
			foreach($val as $k=>$v){
				if(is_numeric($v)){
					$sql .= $v;
				} 
				else {
					$sql .= "'".$v."'";
				}
				$sql .= ',';
			}
			$sql = rtrim($sql,',');
			$sql .= '),';
		}
		$sql = rtrim($sql,',');
		
		return $sql;
	}
	
	
	/*
	 *	读取发件箱消息  后台不进行个人信息的发送
	 *	可以传入map条件进行查询  
	 *	@param  $map  查询数组 $type = "是否是个人消息" 默认为1，表示不是
	 *	return array 返回一个查询数组
	 */
	static function read_message($map=array(),$type=false){
		if($type){
			$default_map = array(
				'message.is_del' => '0'
			);
		}else{
			$default_map = array(
				'is_del' => '0'
			);
		}
		
		$_table = ($type)?D(self::model):self::send_table;
		$map = array_merge($default_map, $map);
		$result = Database::ext_select('page','',$_table,$map,'id desc','','',self::limit);
		$result['list'] = int_to_string($result['list'],array('type'=>self::send_type()));
		return $result;
	}
	
	/*
	*	读取收件箱消息
	*	1：读取收件箱的数据
	*	2：默认查询没有删除的数据 例如后台不需要传入is_hid字段 合并map条件后进行查询
	* */
	static function read_rec_message($map = array()){
		$status_text = array(
			'0' => '未读',
			'1' => '已读'
		);
		$default_map = array(
			'msg_status.is_del' => '0',
			'message.is_del' => '0',
		);
		$map_1 = array(
			'msg_status.to_member_id'=>session('home_member_id')
		);
		$map_1 = array_merge($default_map, $map_1);
		$map = array_merge($default_map, $map);
		$result = Database::ext_select('page','',D(self::model),$map,'id desc','','',self::limit);
		$result['status']=get_result(D(self::model),$map_1,'count(*),status','','',$group='status');
		$result['list'] = int_to_string($result['list'],array('status'=>$status_text));
		return $result;
	}
	
	
	
	/*	信息的详细信息
	*	$id  message 表的id
	*	$view 是否是传入已读
	**/
	static function get_detail($id,$view=false,$map=array()){
		
		$default_map = array(
			'message.id' => $id,
			'message.is_del' => '0',
		);
		$map = array_merge($default_map, $map);
		$info['now'] = get_info(D(self::model),$map);
		if($view ==true){
			self::get_view($info['now']);
		}
		$map['message.id'] = array('gt',$id);
		/*上一篇*/
		$info['prev'] = get_info(D(self::model), $map,true,'id asc');
		
		$map['message.id'] = array('lt',$id);
		/*下一篇*/
		$info['next'] = get_info(D(self::model), $map,true,'id desc');

		/*本篇的内容*/
		$info['now'] = self::get_member_info($info['now']);

		return $info;
		
		
	}
	
	
	/*	
	*	标记为已读
	*	@param $info 邮件信息
	*	return  结果
	**/
	static function get_view($info){
		if($info['to_member_id']!=session('home_member_id')){
			return false;
		}else{
			if($info['status']=='1'){
				return true;
			}else{
				$_POST = array(
					'id' => $info['id'] ,
					'status' => '1',
				);
				return update_data(self::send_table_2);
			}
		}
		
	}
	
	/*	
	*	全部标记为已读
	*	@param $id  array  $type 判断是标记已读未读还是删除所选项 $style 判断用操作的是对收件箱还是发件箱
	*	return  true  false
	**/
	
	public function all_read($ids,$type,$style){
		switch ($type){
			case 'is_del' :
				$data = array(
					'is_del' => 1
				);
				if($style=='inbox'){
					$Model = M ( self::send_table_2); 
				}else{
					$Model = M ( self::send_table); 
				}
				break;
			case 'status' :
				$data = array(
					'status' => 1
				);
				$Model = M ( self::send_table_2); 
				break;
			default:;
		}
		
		if(empty($ids)){
			return '-1';
		}
		$map ['id'] = array ('in',$ids );
		$result = $Model->where ( $map )->save ( $data ); 
		return $result;
	}
	
	
	
	
	/*
	 *	查询用户信息
	 *	$info 查询的收件箱的信息
	 *	如果 $type = 0 那么就代表是发送给单个用户的信息 那么就去查询用户表的信息 还要判断用户是输入前台用户还是后台用户 如果is_to_home =1  那么就是发送给前台查询member表
	 * */
	static function get_member_info($info){
		if($info['is_to_home']=='1'){
			$_table =  'member';
		}else{
			$_table = 'admin';
		}
		$member_id = ($info['to_member_id'])?$info['to_member_id']:$info['member_id'];
		/*判断是系统消息还是个人消息*/
		if($info['type']=='0'){
			$member_info = get_info($_table,array('id'=>$member_id),'id,nickname,email,mobile');
		}else{
			$member_info['mobile'] = self::send_type($info['type']);
		}
		
		$info['username_info'] = $member_info;
		return $info;
	}
	
	/*消息分类*/
	static function send_type($key){
		$list = array('个人消息','所有用户','普通用户','商家用户');
		if($key){
			return $list[$key];
		}else{
			
			return $list;
		}
		
	}
	
	/*消息回复*/
	static function replay_message(){
		$post = $_POST;$_POST=null;
		/*这里需要做一个查询 查询原始信息的信息主题*/
		$info = get_info('message',array('id'=>$post['pid']),'title,member_id');
		/*模拟一个post数组*/
		
		$_POST = array(
			'type' => '0',
			'content' => $post['content'],
			'to_member_id' => $post['to_member_id'],
			'pid' => $post['pid'],
			'title' => '回复：'.$info ['title'],
			'is_to_home' => $post['is_to_home'],
		);
		
		$_POST['member_id'] = session('home_member_id');
		$result = Self::send_message();
		return $result;
	}
	
	
	/*回复消息的固定模板*/
	static function replay_html(){
		$html = '<p>
					<strong> <span>------------------ 原始信息 ------------------</span></strong>
				</p>
				<p>
					<strong>发件人: &nbsp;&nbsp;</strong>%mobile%
				</p>
				<p>
					<strong>发送时间:</strong>&nbsp;%addtime%
				</p>
				<p>
					<strong>收件人:</strong>&nbsp;%to_moblie%
				</p>
				<p>
					<strong>内容:</strong>&nbsp; &nbsp;%content%
				</p>
				<p>
					<br/><br/>
				</p>';
		return $html;
	}
	
	/*搜索条件html*/
	public function get_cond_serach(){
		$msg_list = self::send_type();
		$temp = "<option value=''>请选择</option>";
		$html = $temp;	$html_1 = $temp;$html_2 = $temp;
		$gets = I('get.');
		$status_list = array('开启','禁用');
		$status_list_1 = array('未读','已读');
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
		foreach($status_list_1 as $kkk=>$val){
			if((string)$kkk == $gets['status']){
				$_class_1 = 'selected = "selected"';
			}else{
				$_class_1 = '';
			}
			$html_2 .= '"<option value="'.$kkk.'" '.$_class_1.'>'.$val.'</option>"';
		}
		$data['html'] =$html; $data['html_1'] =$html_1;$data['html_2'] =$html_2;
		return $data;
		
	}
}
