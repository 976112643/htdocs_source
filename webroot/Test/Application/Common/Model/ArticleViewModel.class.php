<?php

namespace Backend\Model;

use Think\Model\ViewModel;

class ArticleViewModel extends ViewModel {
	public $viewFields = array (
			'article' => array (
					'id',
					'category_id',
					'title',
					'view',
					'status',
					'comment',
					'content',
					'recommend',
					'public',
					'update_member_id',
					'add_time',
					'update_time',
					'_type' => 'left' 
			),
			'category' => array (
					'title' => 'c_title',
					'_on' => 'category.id=article.category_id' 
			),
			'member' => array (
					'username',
					'_on' => 'member.id=article.member_id',
					'_type' => 'left' 
			),
			'umember' => array (
					'_table' => 'sr_member',
					'username' => 'update_username',
					'_on' => 'umember.id=article.update_member_id' 
			) 
	);
}
