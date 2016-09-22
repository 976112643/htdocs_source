<?php
//namespace WxPay;
//use lib\WxPayNotify as WxPayNotify;
//use lib\WxPayApi as WxPayApi;
//require_once "lib/WxPay.Api.php";
require_once "lib/WxPayApi.php";
require_once 'lib/WxPayNotify.php';

//require_once 'log.php';

class PayNotifyCallBack extends WxPayNotify
{
	protected $table;
	 function __construct($table){
	 	$this->table=$table;
	 
	 }
	//查询订单
	public function Queryorder($transaction_id)
	{
		
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);
		//Log::DEBUG("query:" . json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		/* open_file($data,'a',$c='',$d='txt'); */
		$notfiyOutput = array();
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}else{
			$recharge_num=$data['attach'];
			if($this->table=='recharge'){
				$field='recharge_num';
			}else{
				$field='order_num';
			}
			$recharge_info=get_info($this->table,array($field=>$recharge_num));
			if(empty($recharge_info)){
				return true;
			}
			$order_num=$data['out_trade_no'];
			$order_info=get_info('orders',array('order_num'=>$order_num));
			$_POST=null;
			$_POST['id']=$recharge_info['id'];
			$_POST['status']=2;
			$ret=update_data($this->table);
			if(is_numeric($ret)){
				if($this->table=='orders'){
					
					$coupon=json_decode($recharge_info['content'],true);
					if(!empty($coupon['coupon_id'])){
		    			$_POST=null;
		    			$_POST['status']=1;
		    			$_POST['id']=$coupon['coupon_id'];
		    			update_data('user_coupon');
	    			}
					$remark=getStatusString(0,1);
					
					//Common::saveOrderLog($order_info['member_id'],$remark,$order_info['id'],$order_info['order_num'],'user');
				}			
				//Common::saveDeal($recharge_info['member_id'],$recharge_info['money'],3,json_encode($recharge_info),$type);
				
				return true;
			}else{
				return false;
			}
		
		}
		return true;
	}
}

//Log::DEBUG("begin notify");
//$notify = new PayNotifyCallBack();
//$notify->Handle(false);
