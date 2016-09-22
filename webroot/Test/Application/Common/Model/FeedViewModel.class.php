<?php
namespace Common\Model;

use Think\Model\ViewModel;

class FeedViewModel extends ViewModel {
	public $viewFields = array(
		'feed' => array (
				'*',
				'_type' => 'left' 
		),
		'feed_content' => array (
				'*',
				'_on' => 'feed_content.feed_id=feed.id' 
		), 
		
	);
}