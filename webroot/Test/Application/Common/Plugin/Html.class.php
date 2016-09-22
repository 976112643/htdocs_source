<?php
/*
 *	页面模板处理类
 * */
namespace Common\Plugin;
use Common\Org\Cache;

class Html {
    private $default_option = '<option value="{default_value}">{default_name}</option>'; 
	private $default_hid = array('开启','禁用');
	
	/*分组下拉框*/
	public function group_html(){
		
		$default_name = "默认分组";
		$default_value = "0";
		$html = str_replace(array('{default_value}','{default_name}'),array($default_value,$default_name),$this->default_option);
		$gets = I('get.');
		$_list=Cache::db_table('member_role',array('order'=>'id asc'));
		foreach($_list as $v){
			if($v['id'] == $gets['role_id']){
				$_class = 'selected = "selected"';
			}else{
				$_class = '';
			}
			$html .= '"<option value="'.$v['id'].'" '.$_class.'>'.$v['title'].'</option>"';
		}
		
		 
		return $html;
	}
	
	
	
}