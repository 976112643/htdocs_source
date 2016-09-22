<?php
namespace Backend\Model;
use Think\Model\ViewModel;
class RechargeViewModel extends ViewModel {
	public $viewFields = array(
	    'recharge'	=>array('*','id'=>'recharge_id','status'=>'recharge_status','add_time'=>'recharge_add_time','_type'=>'left'),
		'bank_cards'=>array('*','status'=>'bank_status','_on'=>'recharge.card_id=bank_cards.id','_type'=>'left'),
		'user'=>array('username','mobile','_on'=>'user.id=recharge.user_id'),
		
		
	);
}
