<?php

namespace Common\Model;

use Think\Model\ViewModel;

class NewsCommentViewModel extends ViewModel {
	public $viewFields = array (
			'news_comment' => array (
					'id',
					'member_id',
					'content',
					'status',
					'add_time' 
			),
			'news' => array (
					'title',
					'_on' => 'news.id=news_comment.news_id',
					'_type' => 'left' 
			),
			'member' => array (
					'username',
					'_on' => 'member.id=news_comment.member_id' 
			) 
	);
}
