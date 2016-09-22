<?php
namespace Backend\Controller\Base;

use Backend\Controller\Base\AdminController;

use Common\Org\Database;

class DeviceController extends AdminController {
	protected $table = 'device';
	protected $wear = 'wear';
	
	public function __autoload() {
		parent::__autoload();
		$data = array(
			'status'=> array(
				'0'=> '待售',
				'1'=> '已售',
				'2'=> '已绑定到服务中心',
				'3'=> '已被平台会员绑定' 
			)	
		);
		$this->assign($data);
	}
	
	public function index() {
		$vins_no = I('get.vins_no', 0, '/^\d+$/');
		$map = array(
			'status'=> array('GT', '-1'),
		);
		switch(strlen($vins_no)) {
			case 11:
				$map['mobile'] = $vins_no;
				break;
			case 15:
				$map['vins_no'] = $vins_no;
				break;
			default:
				break;
		}
		$data = Database::ext_select('page', true, $this->table, $map, 'add_time desc', '', '', 15);
		$this->assign($data);
		$this->display();
	}
	
	public function add() {
		if(IS_POST) {
			$result = $this->update();
			if(is_numeric($result)) {
				$this->success('', U('index'));
				return ;
			}
			$this->error($result);
			return ;
		}
		$this->display('operate');
	}
	
	protected function update($vins_no = 0) {
		$post = I('post.');
		preg_match('/^\d{16,19}$/', $post['imsi']) ? true : $this->error('请输入imsi');
		$rules = array(
			array('vins_no', '/^\d{15}$/', '请输入设备号'),
			array('mobile', '/^1[34578]\d{9}$/', '设备手机号重复', 2, 'unique'),
			array('imsi', '/^\d{16,19}$/', 'IMSI重复', 0, 'unique'),
		);
		$rules_info = array(
			array('vins_no', '/^\d{15}$/', '请输入设备号', 'unique'),
			array('mobile', '/^1[34578]\d{9}$/', '设备手机号重复', 2, 'unique'),
			array('imsi', '/^\d{16,19}$/', 'IMSI重复', 0, 'unique'),
		);
		$data = array(
			'vins_no'=> $post['vins_no'],
			'mobile'=> $post['mobile'],
			'imsi'=> $post['imsi'],
			'status'=> 1,
		);
		$data_info = array(
			'vins_no'=> $post['vins_no'],
			'mobile'=> $post['mobile'],
			'imsi'=> $post['imsi'],
		);
		preg_match('/^\d{15}$/', $post['vins_no']) ? true : $this->error('请输入设备号');
		switch($vins_no) {
			case 0:
				$map = array(
					'vins_no'=> $post['vins_no'],
				);
				$info = Database::get_info($this->table, $map, 'vins_no');
				if($info) {
					$this->error('设备号重复');
				}
				break;
			default:
				break;
		}
		$M = M();
		$M->startTrans();
		$result = Database::update_data($this->table, $rules, array(), $data);
		$result_info = Database::update_data($this->wear, $rules_info, array(), $data_info);
		if(is_numeric($result) && is_numeric($result_info)) {
			$M->commit();
			return 1;
		}
		
		$M->rollback();
		$msg .= is_numeric($result) ? '' : $result;
		$msg .= is_numeric($result_info) ? '' : $result_info;
		
		return $msg;
	}
}