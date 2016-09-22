<?php 
namespace Backend\Model;
use Think\Model\ViewModel;
class MemberpublViewModel extends ViewModel{
		public $viewFields = array(
		'member'=> array(
			'id',
			'*',
			'_type' =>'left',
		),
		'login_log'=> array(
			'member_id',
			'login_time',
			'login_ip',
			 '_on' => '  login_log.member_id = member.id ' ,
		),
	);
}

?>