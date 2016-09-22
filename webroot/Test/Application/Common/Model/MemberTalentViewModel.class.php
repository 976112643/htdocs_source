<?php
namespace Common\Model;

use Think\Model\ViewModel;

class MemberTalentViewModel extends ViewModel {
	public $viewFields = array(
		'member' => array (
			'*',
			'_type' => 'inner' 
		),
		'member_count' => array (
			'*',
			'_on' => 'member_count.uid=member.id' 
		), 
		
		
		
	);
}