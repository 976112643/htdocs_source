<?php
/*
 * 后台操作日志
 */
function action_log($table_name, $table_id = 0, $action_filed = 'id,title') {
	$url = strtolower ( MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME );
	if (is_numeric ( $table_id )) {
		$map ['id'] = $table_id;
	} else {
		$map ['id'] = array (
				'in',
				$table_id 
		);
	}
	
	$result = get_result ( $table_name, $map, $action_filed );
	
	$_POST = array (
			'member_id' => session ( 'member_id' ),
			'username' => session ( 'username' ),
			'url' => $url,
			'table_name' => $table_name,
			'table_id' => $table_id,
			'description' => json_encode ( $result ),
			'ip' => get_client_ip () 
	);
	update_data ( 'action_log' );
}
/*
 * 根据url获取菜单的层级结构path
 * 康利民 2015-06-12 3027788306@qq.com
 */
function getPathByUrl($url) {
	$menu_result = getMenuList ();
	foreach ( $menu_result as $key => $value ) {
		// print_r($value);
		if ($url == $value ['url']) {
			return $value;
		}
	}
	return '';
}
/*
 * 获取后台管理菜单
 * 康利民 2015-06-12 3027788306@qq.com
 */
function getMenuList(){
	if(!session("menu_result")){
		/*如果是系统管理员拥有所有权限*/
		$map = array(
			'is_hid'=> 0,
			'is_del'=> 0,	
		);
		if(session('member_id') == 1){
			$menu_result = get_result('menu', $map, '', 'sort desc,id asc');
		}else{
			$info = get_info(D('MemberView'), array('id'=> session("member_id")), 'role_id,role_path,menu_ids,member_rules');
			//dump($info);
			if($info['member_rules']){
				$info['menu_ids'] .= ','.$info['member_rules'];
			}
			//获取上级权限分组的规则，并合并到当前权限分组的规则中
			$role_parent = explode('-', $info['role_path']);
			$role_result=get_result('role', array('id'=> array('in', $role_parent)));
			$leader_result=get_result('role', array('leader_id'=> session('member_id')));
			foreach ($role_result as $value){
				$info['menu_ids'] .= ','.$value['rules'];
			}
			foreach ($leader_result as $value){
				$info['menu_ids'] .= ','.$value['leader_rules'];
			}
			$rules = implode(',', array_unique(explode(',', $info['menu_ids'])));
			if($rules != ''){
				$map['id'] = array('in', $rules);
				$menu_result = get_result('menu', $map, '', 'sort desc,id asc');
			}
		}
		session("menu_result",$menu_result);
	}
	return session("menu_result");
}
/*
 * 根据url获取菜单的层级结构path
 * 康利民 2015-06-12 3027788306@qq.com
 */
function getChildMenuList($id) {
	$menu_result = getMenuList ();
	foreach ( $menu_result as $key => $value ) {
		// print_r($value);
		if ($id == $value ['pid']) {
			$result [] = $value;
		}
	}
	return $result;
}
/*
 * 根据当前选中菜单返回头部对应操作按钮
 * $menu_id 当前选中菜单ID
 * $pid pid参数，可选
 * 康利民 2015-06-16 3027788306@qq.com
 */
function getTopBtn($menu_id, $pid = '') {
	foreach(getChildMenuList($menu_id) as $v) {
		if($v['display_position'] == 1 || $v['display_position'] == 3) {
			$class = str_replace('ajax-get', 'ajax-post', $v['class']);
			$class = str_replace('btn-xs', 'btn-sm', $class);
			echo ' <a href="'.U($v['url'], I('get.')).'" class="'.$class.'" target-form="ids">'.$v["title"].'</a> ';
		}
	}
}
/*
 * 根据当前选中菜单返回列表对应操作按钮
 * $menu_id 当前选中菜单ID
 * $id 当前数据ID
 * $url 传递过来的URL数组，当$showBtn为true时只显示$url里的按钮，为false时，不显示$url里的按钮
 * $pid pid参数，可选
 * $showBtn 是否显示$url里的按钮，默认显示
 * 康利民 2015-06-16 3027788306@qq.com
 */
function getListBtn($menu_id, $id, $url, $pid = '', $showBtn = true, $position = 2) {
	foreach(getChildMenuList($menu_id) as $v) {
		$cur_url = U($v['url']);
		if($v['display_position'] == $position || $v['display_position'] == 3) {
			if($showBtn == true) {
				if(in_array($cur_url, $url )) {
					$class = str_replace('ajax-post', 'ajax-get', $v['class']);
					$array = array_merge(I('get.'), array('ids'=> $id));
					echo ' <a href="'.U($v['url'], $array).'" class="'.$class.'">'.$v['title'].'</a> ';
				}
			}else {
				foreach($url as $key => $val) {
					foreach($val as $key => $_val) {
						$new_url[] = $_val;
					}
				}
				if(!in_array($cur_url, $new_url)) {
					$class = str_replace('ajax-post', 'ajax-get', $v ['class']);
					$array = array_merge(I('get.'), array('ids'=> $id));
					echo ' <a href="'.U($v['url'], $array).'" class="'.$class.'">'.$v['title'].'</a> ';
				}
			}
		}
	}
}
/*
 * 根据ID获取用户结果集
 * $ids int/array
 * return 用户结果集
 * @time 2015-07-21
 * @author 康利民 <kanglimin@cnsunrun.com>
 */
function getMember($ids) {
	$result = get_result ( "member", array (
			"id" => array (
					"in",
					$ids 
			) 
	) );
	return $result;
}

/**
 * 查询用户组所有数据
 * 
 * @author 李东
 *         @date 2015-04-23
 */
function get_role_info() {
	$result = get_result ( 'role', array ('type'=>1), 'id,title' );
	return $result;
}

/**
 * 显示状态
 * @param unknown $is_hid
 * @return string
 */
function get_status($is_hid){
	if($is_hid == 0 ){
		return '启用';
	}
	if($is_hid == 1){
		return  '禁用';
	}
}
/**
 * 用户分类缓存
 * @return multitype:
 */
function get_group_cate(){
	if(!F('member_group_cache')){
		$map['is_hid'] = 0;
		$map['is_del'] = 0;
		$info = get_result('role',$map,'id,title');
		F('member_group_cache',$info);
	}else{
		$info =F('member_group_cache');
	}
	$info = array_column($info,'title','id');
	return $info;
}

/*后台管理用户缓存*/
function get_sr_admin_cate(){
	if(!F('sr_admin_cache')){
		$map['is_hid'] = 0;
		$map['is_del'] = 0;
		$info = get_result('admin',$map,'id,username');
		F('sr_admin_cache',$info);
	}else{
		$info =F('sr_admin_cache');
	}
	$info = array_column($info,'username','id');
	return $info;
}
/*商家用户缓存*/
function get_sr_business_cate(){
	if(!F('business_cache')){
		$map['is_hid'] = 0;
		$map['is_del'] = 0;
		$map['is_business'] = 1;
		$info =  get_result('member',$map,'id,username');
		F('business_cache',$info);
	}else{
		$info =F('business_cache');
	}
	$info = array_column($info,'username','id');
	return $info;
}
/**
*	获取文章的图片	
*/
function get_article_img($id){
	$map['feed_id']=intval($id);
	$result=get_result('feed_image',$map,$field =array('image'));
	return $result;
}

/**
*	获取用户部分信息，用于要查多个用户的信息，但又联表查其他信息
*/
function get_user_info($id){
	$map['id']=intval($id);
	$result=get_info('member',$map,$field =array('nickname'));
	return $result;
	
}
/**
*	获取用户所属分组的title
*	@param $id 分组id
*/
function get_role($id){
	$map['id']=intval($id);
	$map['is_del']=0;
	$map['is_hid']=0;
	$result=get_info('member_role',$map,$field =array('title'));
	return $result['title'];
}

?>