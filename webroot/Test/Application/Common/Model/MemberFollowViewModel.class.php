<?php

namespace Common\Model;

use Think\Model\ViewModel;

class MemberFollowViewModel extends ViewModel {
	public $viewFields = array(
		'member' => array (
			'nickname',
			'icon',
			'_type' => 'inner' 
		),
		'member_follow' => array (
			'*',
			'_on' => 'member_follow.fid=member.id' 
		), 
		
	);
}
