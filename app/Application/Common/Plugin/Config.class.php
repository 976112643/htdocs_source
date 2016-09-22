<?php

	/*
	 * 配置插件
	 * @需求：
	 * 后台可以管理配置
	 * @time 2015/08/12
	 * @author 秦晓武
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;

class Config extends Main{
	const TABLE = 'config';
	const LIST_LIMIT = 20;
	
	/*
	 * 后台列表页
	 * @time 2014-12-26
	 * @author 秦晓武 <525249206@qq.com>
	 */
	function get_backend_list(){
		$map['status'] = array('gt',- 1);
		$data['keywords'] = I('keywords');
		if(isset($_REQUEST['keywords']) && $data['keywords']){
			$map['title|name'] = array ('like','%' . $data['keywords'] . '%');
		}
		$data['groups'] = I('groups');
		if(isset($_REQUEST['groups']) && $data['groups']){
			$map['groups'] = $data['groups'];
		}
		$result = Database::page(self::TABLE, $map, 'id asc');
		$status = array(1 => '启用',- 1 => '删除',0 => '禁用' );
		array_walk($result['list'],function(&$item) use ($status){
			$item['status_text'] = $status[$item['status']];
		});
		$data['list'] = $result['list'];
		$data['page'] = $result['page'];
		$data['group_list'] = self::get_group();
		parent::ext_display($data);
	}
	
	/*
	 * 后台编辑
	 * @需求：
	 * 后台可以编辑导航
	 * @time 2015/08/15
	 * @author 秦晓武
	 * */
	function backend_update(){
		if (IS_POST) {
			$id = intval(I('post.id'));
			$rules = array (
				array ('title','require','请填写标题' ),
				array ('name','require','请填写标识' ),
				array ('name','/^[a-zA-Z_]+$/','标识只允许使用字母和下划线' ),
				array ('name','','标识已存在，请更换其它标识',1,'unique' ),
				array ('group','require','请填写分组' ),
				array ('group','/^[\x{4e00}-\x{9fa5}A-Za-z0-9_]+$/u','分组只允许使用中文、字母和下划线' ),
				array ('type','require','请选择配置类型' ) 
			);
			$result = Database::update_data(self::TABLE, $rules);
			if(is_numeric($result)){
				Cache::db_table(self::TABLE,NULL);
				parent::success('操作成功', U('index'));
			} else {
				parent::error($result);
			}
		} else {			
			$id = intval(I('ids'));
			$map['id'] = $id;
			$data['info'] = Database::get_info(self::TABLE, $map);
			parent::ext_display($data,'operate');
		}
		
	}
	
	/*
	 * 获取后台配置分组
	 * @需求：
	 * 用于列表过滤
	 * @time 2015/08/15
	 * @author 秦晓武
	 * */
	function get_group(){
		$result = Database::get_result(self::TABLE,'','groups','','','groups');
		return $result;
	}
}