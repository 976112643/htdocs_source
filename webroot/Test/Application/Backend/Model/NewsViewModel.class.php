<?php

namespace Common\Model;

use Think\Model\ViewModel;

class NewsViewModel extends ViewModel {
	public $viewFields = array (
			'news' => array (
					'*',
					'_type' => 'left' 
			),
			'category' => array (
					'title' => 'c_title',
					'_on' => 'category.id=news.category_id' 
			),
			'member' => array (
					'username',
					'_on' => 'member.id=news.member_id',
					'_type' => 'left' 
			) 
	);
}
