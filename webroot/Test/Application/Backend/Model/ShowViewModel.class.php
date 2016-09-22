<?php
namespace Common\Model;
use Think\Model\ViewModel;

class ShowViewModel extends ViewModel {
	
	public $viewFields = array (
			'show' => array (
					'*',
					'_as'		=> 's',
					'_type'		=> 'left' 
			),
			'product_category' 	=> array (
					'praise',
					'title'		=> 'category_title',
					'_as'		=> 'c',
					'_on' 		=> 'c.id=s.category_id' 
			),
			'member' => array (
					'username',
					'_as'		=> 'm',
					'_on' 		=> 'm.id=s.member_id',
					'_type' 	=> 'left' 
			) 
	);
}
