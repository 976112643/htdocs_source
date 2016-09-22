<?php
namespace Common\Model;

use Think\Model\ViewModel;

class FeedHotViewModel extends ViewModel {
	public $viewFields = array(
		'feed' => array (
				'*','addtime'=>'feed_addtime',
				'_type' => 'left' 
		),
		'feed_content' => array (
				'*',
				'_on' => 'feed_content.feed_id=feed.id' 
		), 
		'feed_hot' => array(
				'*',
				'_on' => 'feed_hot.feed_id=feed.id' 
		)
		
	);
}