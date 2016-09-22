<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class RecycledController extends AdminController {
	protected $table = 'recycled';
	
	/*
	 * 菜单列表页
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	public function index() {
		$map ['status'] = 1;
		$keywords = I ( 'keywords' );
		if ($keywords) {
			$map ['title'] = array ('like',"%$keywords%" );
		}
		$result = $this->page ( $this->table, $map, 'id desc' );
		
		$result = int_to_string ( $result );
		$data ['result'] = $result;
		
		$this->assign ( $data );
		$this->display ();
	}
	
	/*
	 * 从回收站中还原数据
	 * @time 2014-01-12
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function restore() {
		$ids = I ( 'ids' );
		if (is_array ( $ids )) {
			$map ['id'] = array ('in',$ids );
			
			$result = get_result ( $this->table, $map, 'table_name,table_id' );
			foreach ( $result as $row ) {
				$_POST = array (
					'id' => $row ['table_id'],
					'status' => 1 
				);
				update_data ( $row ['table_name'] );
			}
			
			$result = delete_data ( $this->table, $map );
			$ids = implode ( ',', $ids );
			if ($result) {
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$ids = intval ( $ids );
			$map ['id'] = $ids;
			$row = get_info ( $this->table, $map, 'table_name,table_id' );
			if ($row) {
				$_POST = array (
					'id' => $row ['table_id'],
					'status' => 1 
				);
				update_data ( $row ['table_name'] );
			}
			$result = delete_data ( $this->table, $map );
			if ($result) {
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		}
	}
	
	/*
	 * 删除回收站中的数据
	 * @time 2014-01-12
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function del() {
		$ids = I ( 'ids' );
		if (is_array ( $ids )) {
			$map ['id'] = array ('in',$ids );
			
			$result = get_result ( $this->table, $map, 'table_name,table_id' );
			foreach ( $result as $row ) {
				$_map ['id'] = $row ['table_id'];
				delete_data ( $row ['table_name'], $_map );
			}
			
			$result = delete_data ( $this->table, $map );
			$ids = implode ( ',', $ids );
			if ($result) {
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$ids = intval ( $ids );
			$map ['id'] = $ids;
			
			$row = get_info ( $this->table, $map, 'table_name,table_id' );
			if ($row) {
				$_map ['id'] = $row ['table_id'];
				delete_data ( $row ['table_name'], $_map );
			}
			
			$result = delete_data ( $this->table, $map );
			if ($result) {
				$this->success ( '操作成功', U ( 'index' ) );
			} else {
				$this->error ( $result );
			}
		}
	}
}