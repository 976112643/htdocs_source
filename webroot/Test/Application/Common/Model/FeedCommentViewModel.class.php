<?php
namespace Common\Model;

use Think\Model\ViewModel;

class FeedCommentViewModel extends ViewModel {
	public $viewFields = array(
		'feed' => array (
				'*','addtime'=>'feed_addtime',
				'_type' => 'left' 
		),
		'feed_content' => array (
				'*',
				'_on' => 'feed_content.feed_id=feed.id' 
		), 
		'comment' => array(
				'*',
				'_on' => 'feed_comment.feed_id=feed.id' 
		)
		
	);
}