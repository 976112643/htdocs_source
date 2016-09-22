<?php
namespace Common\Widget;
use Think\Controller;
class JcropWidget extends Controller {
	public function index($config, $id) {
		$default_config=array(
			'index'		=> 2,
			'table'		=> '',
			'name'		=> 'cover',
			'width'		=> '260',
			'height'	=> '260',
			'scale'		=> '1',
		);
		$last_config=array_merge($default_config,$config);
		$data['config']=$last_config;
		if($last_config['table']==''){
			$this->error("请设置参数table");
		}
		if($last_config['name']==''){
			$this->error("请设置参数name");
		}
		$data['info']=get_info($last_config['table'],array('id'=>$id),$last_config['name']);
		$data['config']=$last_config;
		$this->assign($data);
		$this->display(T("Common@Jcrop/index"));
	}
}
