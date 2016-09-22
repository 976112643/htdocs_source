<?php 
namespace Backend\Model;

use Think\Model\ViewModel;
class MemberinfoViewModel extends ViewModel{
		public $viewFields = array(
		'member'=> array(
			'*',
			'_type' => 'left' ,
		),
		'member_info'=> array(
			'id'=>'member_info_id',
			'member_id',
			'birthday',
			'balance',
			'realname',
			'_on' => 'member_info.member_id = member.id' ,
		),
	);
}







?>