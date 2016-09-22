<?php
namespace Backend\Model;
use Think\Model\ViewModel;
class RefundViewModel extends ViewModel {
	public $viewFields = array(
		'orders' => array ('*','id'=>'ids','add_time'=>'order_add_time','status'=>'orders_status','content'=>'orders_content','_type' => 'LEFT' ),
		'order_list' => array ('*','id'=>'order_list_id','status'=>'order_status','_on' => 'orders.id=order_list.order_id','_type'=>'LEFT'),
		'product' => array ('*','id'=>'product_id','title'=>'product_title','_on' => 'product.id=order_list.product_id','_type'=>'LEFT'),
		'user'=>array('username','mobile','nickname','_on' => 'user.id=orders.user_id','_type'=>'LEFT'),
		'refund'=>array('*','add_time'=>'refund_add_time','_on' => 'refund.order_list_id=order_list.id'),
		
	);
}
