<?php
namespace Backend\Model;
use Think\Model\ViewModel;
class DealViewModel extends ViewModel {
	public $viewFields = array(
	    'deal'	=>array('*','_type'=>'left'),
		'user'=>array('username','mobile','_on'=>'user.id=deal.user_id','_type'=>'left'),
		
	);
}
