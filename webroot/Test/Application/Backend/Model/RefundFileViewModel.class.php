<?php
namespace Backend\Model;
use Think\Model\ViewModel;
class RefundFileViewModel extends ViewModel {
	public $viewFields = array(
		'refund'=>array('*','status'=>'refund_status','_type'=>'LEFT'),
		'refund_reason'=>array('*','status'=>'reason_status','_on' => 'refund.reason_id=refund_reason.id','_type'=>'LEFT'),
		'refund_files'=>array('*','_on' => 'refund_files.refund_id=refund.id'),
	);
}
