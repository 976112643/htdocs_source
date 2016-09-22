<?php
namespace Common\Model;
use Think\Model\ViewModel;

class RelationViewModel extends ViewModel {
	
	//我要秀产品关联
	public $viewFields = array (
			// 'show' => array (
			// 		'*',
			// 		'_as'		=> 's',
			// 		'_type'		=> 'left' 
			// ),
			'product'			=> array (
					'id'		=> 'product_id',
					'title'		=> 'product_title',
					'is_hid'	=> 'is_hid',
					'is_del'	=> 'is_del',
					'addtime'	=> 'addtime',
					'category_id' => 'category_id',
					'_as'		=> 'p',
					'_type'		=> 'left'
			),
			'show_relation' 	=> array (
					'id'		=> 'relation_id',
					'addtime'	=> 'relation_addtime',
					'_as'		=> 'r',
					'_type'		=> 'left',
					'_on' 		=> 'r.product_id=p.id' 
			),
			'show' 				=> array (
					'id'		=> 'show_id',
					'title'		=> 'show_title',
					'_as'		=> 's',
					'_on' 		=> 'r.show_id=s.id'
			),
	);
}