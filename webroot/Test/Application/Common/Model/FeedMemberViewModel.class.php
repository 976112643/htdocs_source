<?php
namespace Common\Model;

use Think\Model\ViewModel;

class FeedMemberViewModel extends ViewModel {
	public $viewFields = array(
		'feed' => array (
				'*','addtime'=>'feed_addtime',
				'_type' => 'left' 
		),
		'feed_content' => array (
				'feed_title',
				'feed_content',
				'_on' => 'feed_content.feed_id=feed.id' 
		), 
		'member' => array(
				'nickname',
				'_on' => 'member.id=feed.uid' 
		)
		
	);
}