<?php
namespace Backend\Controller\Base;
use Common\Controller\CommonController;
use Org\Util\String;
class AdminController extends CommonController {
	protected $table, $cache_data;
	protected $action_filed = 'id';
	protected $session_cache_name = '';
	
	/*
	 * 全局加载
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	protected function __autoload() {
		if (! session ( 'member_id' )) {
			header ( "location:" . __ROOT__ . "/Backend" );
		}
		
		$menu_result = getMenuList ();
		//dump($menu_result);exit();
		$menu_arr = array ();
		foreach ( $menu_result as $row ) {
			$menu_arr [] = $row ['url'];
		}
		$menu_arr [] = MODULE_NAME . '/' . CONTROLLER_NAME . '/' . 'uploadPicture';
		$menu_arr [] = MODULE_NAME . '/' . CONTROLLER_NAME . '/' . 'delTempFile';
		
		$menu_result = list_to_tree ( $menu_result );
		if (session ( 'member_id' ) != '1') {
			$url = MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME;
			//$url = '/Backend/Article/News/index';
			if ($url != 'Backend/Index/Index' && ! in_array ( $url, $menu_arr )) {
				if (! stristr ( $url, "ueditor" ) && ! stristr ( $url, "ajaxDelete_" )) {
					$this->error ( '未授权的访问' );
				}
			}
		}
		$data ['menu_result'] = $menu_result;
		$this->_init ();
		$this->assign ( $data );
	}
	protected function _init() {
	}
	protected function setStatus($field = 'is_hid', $ids_str = 'ids') {
		$ids = I ( $ids_str );
		$field_val = intval ( I ( 'get.' . $field ) );
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		if (is_array ( $ids )) {
			$_POST = array (
				$field => $field_val 
			);
			
			$map ['id'] = array ('in',$ids );
			// $result=update_data($this->table,array(),$map);
			$Model = M ( $this->table ); // 实例化User对象
			
			$Model->where ( $map )->save ( $_POST ); // 根据条件更新记录
			
			$ids_str = implode ( ',', $ids );
			action_log ( $this->table, $ids_str, $this->action_filed );
			/* 如果状态为-1记录数据到回收站 */
			if ($field == 'is_del' && $field_val == 1 && $this->recycled_enable) {
				$this->recycled ( $this->table, $ids_str, $this->action_filed );
			}
			/* 如果该表数据有缓存，那么删除缓存 */
			if ($this->cache_data != '') {
				F ( $this->cache_data, NULL );
			}
			if ($this->session_cache_name != '') {
				session ( $this->session_cache_name, NULL );
			}
			if ($this->has_parent) {
				$this->parent_operate ();
			}
			$this->success ( '操作成功', U ( 'index', $_REQUEST ['update_param'] ) );
		} else {
			$ids = intval ( $ids );
			$_POST = array ('id' => $ids,$field => $field_val );
			$result = update_data ( $this->table );
			if (is_numeric ( $result )) {
				action_log ( $this->table, $ids, $this->action_filed );
				/* 如果状态为-1记录数据到回收站 */
				if ($field == 'is_del' && $field_val == 1 && $this->recycled_enable) {
					$this->recycled ( $this->table, $ids, $this->action_filed );
				}
				/* 如果该表数据有缓存，那么删除缓存 */
				if ($this->cache_data != '') {
					F ( $this->cache_data, NULL );
				}
				if ($this->session_cache_name != '') {
					session ( $this->session_cache_name, NULL );
				}
				if ($this->has_parent) {
					$this->parent_operate ();
				}
				$this->success ( '操作成功', U ( 'index', $_REQUEST ['update_param'] ) );
			} else {
				$this->error ( $result );
			}
		}
	}
	/*
	 * 记录数据到回收站
	 */
	function recycled($table_name, $table_id, $action_filed) {
		if (is_numeric ( $table_id )) {
			$map ['id'] = $table_id;
		} else {
			$map ['id'] = array ('in',$table_id );
		}
		$dataList = array ();
		$result = get_result ( $table_name, $map, $action_filed );
		foreach ( $result as $row ) {
			$dataList [] = array (
				'member_id' => session ( 'member_id' ),
				'username' => session ( 'username' ),
				'table_name' => $table_name,
				'table_id' => $row ['id'],
				'title' => $row ['title'],
				'ip' => get_client_ip (),
				'status' => 1,
				'add_time' => date ( 'Y-m-d H:i:s' ) 
			);
		}
		add_all ( 'recycled', $dataList );
	}
	/*
	 * 启用
	 */
	function enable($field = 'is_hid') {
		$_REQUEST['update_param'] = I('get.');
		$_GET[$field] = 0;
		$this->setStatus($field);
	}
	/*
	 * 禁用
	 */
	function disable($field = 'is_hid') {
		$_REQUEST['update_param'] = I('get.');
		$_GET[$field] = 1;
		$this->setStatus($field);
	}
	/*
	 * 不推荐
	 */
	function no_recommend($field = 'recommend') {
		$_REQUEST['update_param'] = I('get.');
		$_GET[$field] = 0;
		$this->setStatus($field);
	}
	/*
	 * 推荐
	 */
	function recommend($field = 'recommend') {

		$_REQUEST['update_param'] = I('get.');
		$_GET[$field] = 1;
		$this->setStatus($field);
	}
	/*
	 * 删除
	 */
	function del($field = 'is_del') {
		$_REQUEST['update_param'] = I('get.');
		$_GET[$field] = 1;

		$this->setStatus($field);
	}
	/*
	 * 文章删除（附加统计）
	 * time：2016-03-15
	 */
	public function dele($field = 'is_del') {
		$_REQUEST['update_param'] = I('get.');
		$_GET[$field] = 1;
		$this->set_Status($field);
	}
	/**
	 * 分类下的文章统计
	 */
	public function count(){
		$article = article_cache('article_cache');
		$Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
		$count =$Model->query("SELECT COUNT(id) as count,category_id  FROM sr_article WHERE is_del = 0  group by `category_id`");
		$count = array_column($count,'count','category_id');
		foreach ($article as$key => $value){
			if(!empty($count[$key])){
				$_POST = null;
				$_POST['id'] = $key;
				$_POST['num'] = $count[$key];
				update_data('article_category');
			}else if(empty($count[$key])){
				$_POST['id'] =$key; 
				$_POST['num'] = 0;
				update_data('article_category');
			}
		}
		$this->success('更新成功',U('index'));
	}
	protected function set_Status($field = "status", $ids_str = "ids") {
		$ids = I ( $ids_str );
		$field_val = intval ( I ( 'get.' . $field ) );
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		if (is_array ( $ids )) {
			$_POST = array (
					$field => $field_val
			);
				
			$map ['id'] = array ('in',$ids );
			// $result=update_data($this->table,array(),$map);
			$Model = M ( $this->table ); // 实例化User对象
				
			$Model->where ( $map )->save ( $_POST ); // 根据条件更新记录
				
			$ids_str = implode ( ',', $ids );
			action_log ( $this->table, $ids_str, $this->action_filed );
			/* 如果状态为-1记录数据到回收站 */
			if ($field == 'status' && $field_val == - 1 && $this->recycled_enable) {
				$this->recycled ( $this->table, $ids_str, $this->action_filed );
			}
			/* 如果该表数据有缓存，那么删除缓存 */
			if ($this->cache_data != '') {
				F ( $this->cache_data, NULL );
			}
			if ($this->session_cache_name != '') {
				session ( $this->session_cache_name, NULL );
			}
			if ($this->has_parent) {
				$this->parent_operate ();
			}
			$this->count();
			$this->success ( '操作成功', U ( 'index', $_REQUEST ['update_param'] ) );
		} else {
			$ids = intval ( $ids );
			$_POST = array ('id' => $ids,$field => $field_val );
			$result = update_data ( $this->table );
			if (is_numeric ( $result )) {
				action_log ( $this->table, $ids, $this->action_filed );
				/* 如果状态为-1记录数据到回收站 */
				if ($field == 'status' && $field_val == - 1 && $this->recycled_enable) {
					$this->recycled ( $this->table, $ids, $this->action_filed );
				}
				/* 如果该表数据有缓存，那么删除缓存 */
				if ($this->cache_data != '') {
					F ( $this->cache_data, NULL );
				}
				if ($this->session_cache_name != '') {
					session ( $this->session_cache_name, NULL );
				}
				if ($this->has_parent) {
					$this->parent_operate ();
				}
				$this->count();
				$this->success ( '操作成功', U ( 'index', $_REQUEST ['update_param'] ) );
			} else {
				$this->error ( $result );
			}
		}
	}
	/**
	 * 淘汰店家，店家商品批量下架
	 * @param 淘汰店铺id $id
	 */
	public function subset($id=''){
	
		if($id){
			if(is_array($id)){
				$map['shop_id'] = array('in',$id);
			}else{
				$map['shop_id'] = array('in',$id);
			}
		}
		$map['is_del'] = 0;
		$map['is_hid'] = 0;
		$result = get_result('product',$map,'id');
		$ids = array_column($result,'id');
		$ids = implode(',', $ids);
		$_POST=null;
		$map = null;
		$map['id'] = array('in',$ids);
		$_POST['is_sale'] = 0;
		update_data('product','',$map);
	}
	/**
	 * 禁用商家关联关闭所有的店铺
	 * @param 商家ID $id
	 */
	public function subset_shop($id=''){
		/*商家的ID处理*/
		if($id){
			if(is_array($id)){
				$map['seller_id'] = array('in',$id);
			}else{
				$id = (string)$id;
				$map['seller_id'] = array('in',$id);
			}
		}
		if(empty($map['seller_id'])){
			$map['seller_id'] = 0;
		}
		$result = get_result('shop',$map,'id');
		if(!empty($result)){
			$ids = array_column($result,'id');
			$ids = implode(',', $ids);
			$_POST=null;
			$map = null;
			/*禁用所有的店铺*/
			$map['id'] = array('in',$ids);
			$_POST['is_hid'] = 1;
			update_data('shop','',$map);
			/*获取所有店铺的id传入subset*/
			$this->subset($ids);
		}
	}
}