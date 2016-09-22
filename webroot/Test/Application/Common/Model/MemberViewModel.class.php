<?php

namespace Common\Model;

use Think\Model\ViewModel;

class MemberViewModel extends ViewModel {
	public $viewFields = array (
		'admin' => array ('*','id'=>'member_id','is_hid'=>'member_hid','is_del'=> 'member_del','rules'=>'member_rules','_type'=>'LEFT'),
		'role' => array ('*','_on' => 'admin.role_id=role.id') 
	);
}
