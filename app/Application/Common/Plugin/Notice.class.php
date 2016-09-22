<?php

	/*
	 * 通知插件
	 * @需求：
	 * 给设备APP,写入通知消息
	 * 前台显示
	 * @time 2015/11/18
	 * @author llf
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;

class Notice extends Main{
	
	
	const LIST_LIMIT  = 4;
	const URL_LIST 	  = 'Home/News/index';
	const URL_DETAIL  = 'Home/News/detail';
	const TYPE_NOTICE = 4;
	
	
	/* 创建通知信息
	 *		需求分析
	 *			创建通知信息
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-21
	 * @操作数据    app设备通知 sr_notice   sr_notice_detail
     * @parma    	$posts	    //提交参数	二维数组
		{
			'service_id'  =>12,					 	//服务订单id
			'service_time'=>date('Y-m-d H:i:s'), 	//服务时间
			'service_status'=>1,                 	//服务状态  待使用--1  使用中-2  已完成-3  	
			'type'        =>3,					 	//类型
			'device_id'   =>111,				 	//订单对应的设备id
			'title'       =>'创建通知信息',		 	//消息标题
			'add_time'    =>date('Y-m-d H:i:s'), 	//
			'status'      =>1,					 	//状态   	
			'content'     =>'内容字符串或JSON',	 	//详情内容
			'view'        =>2,                   	//消息详情展示方式
		}
	 * @return      无返回
	*/
	static function  create_msg($posts=array()){
		
		$notice 	   = M('notice','sr_','DB_CONFIG_APP');
		$notice_detail = M('notice_detail','sr_','DB_CONFIG_APP');
		
		//生成微妙时间戳
/*      list($usec, $sec) = explode(" ", microtime());
        $rand_time        = str_replace('.',"",((float)$usec + (float)$sec)); */
		
		$posts = array(
			array(
				'service_id'  =>18,					 //服务订单id
				'service_time'=>date('Y-m-d H:i:s'), //服务时间
				'service_status'=>1,                 //服务状态  待使用--1  使用中-2  已完成-3  	
				'type'        =>3,					 //类型
				'device_id'   =>111,				 //订单对应的设备id
				'title'       =>'创建通知信息',		 //消息标题
				'add_time'    =>date('Y-m-d H:i:s'), //
				'status'      =>1,					 //服务状态
				'content'     =>'内容字符串或JSON',
				'view'        =>2,
			),
			array(
				'service_id'  =>19,					 //服务订单id
				'service_time'=>date('Y-m-d H:i:s'), //服务时间
				'service_status'=>1,                 //服务状态  待使用--1  使用中-2  已完成-3  	
				'type'        =>3,					 //类型
				'device_id'   =>111,				 //订单对应的设备id
				'title'       =>'创建通知信息',		 //消息标题
				'add_time'    =>date('Y-m-d H:i:s'), //
				'status'      =>1,					 //服务状态 
				'content'     =>'内容字符串或JSON',
				'view'        =>2,				
			),
		);
		$flage = false;
		$pid   = false;
		foreach($posts as $key=>$val){
			
 			$_POST = array(
				'service_id'    =>$val['service_id'],					 //服务订单id
				'service_time'  =>$val['service_time'], 				 //服务时间
				'service_status'=>$val['service_status'],                //服务状态  待使用--1  使用中-2  已完成-3  	
				'type'          =>$val['type'],					 	     //类型
				'device_id'     =>$val['device_id'],				 	 //订单对应的设备id
				'current'       =>$val['current'],                       //合并列消息来源标识  服务订单循环生成成中的第一个 0 or 1 
				'title'         =>$val['title'],		 				 //消息标题
				'add_time'      =>$val['add_time'], 					 
				'status'        =>1,									 //服务状态    
			); 
			if(!$pid) $pid = $val['service_id'];
			$_POST['combine'] = $pid;			 				         //合并父id
						
			//将循环的第一个标识为 current = 1
			if(!$flage){
				$_POST['current'] = 1; 
				$flage = true;
			}else{
				$_POST['current'] = 0; 
			}
					
			$Model = M();
			$Model->startTrans();
			$result_notice = update_data($notice);

			$_POST = array(
				'notice_id'   =>$result_notice,
				'content'     =>'内容字符串或JSON',	 //详情内容
				'view'        =>2,                   //消息详情展示方式
				'add_time'    =>date('Y-m-d H:i:s'),
			);
			$result_notice_detail = update_data($notice_detail); 
			if(is_numeric($result_notice) && is_numeric($result_notice_detail)){
				$Model->commit();
			}else{
				$Model->rollback();
				//写入日志  XXXX 订单日志写入消息失败！
			}
			
		}
		
	}	
	
	
	//添加一条消息详情信息3-绿色通知[设备相关]
	 
	/*  
	    1、通知子消息只能添加
		2、每次添加一个子消息则更新通知主表消息的时间状态,
		3、(如果消息父级类型是3)则移动 current 指针 到父级列 
		4、只有绿色服务才有子消息添加的概念
		$posts = array(
			'service_order_id',
			'deivce_id',
		)
		$status     //主表消息状态变更值   待使用--1  使用中-2  已完成-3                            
	*/
	static function add_detail_msg($posts=array()){
		
		$notice 	   = M('notice','sr_','DB_CONFIG_APP');
		$notice_detail = M('notice_detail','sr_','DB_CONFIG_APP');
		
		/* $_POST = $posts; */
		$posts = array(
			'service_order_id' =>20,			    //服务订单id
			'status'      	   =>2,					//(可选)服务状态   
			'title'      	   =>'消息详情标题',  
			'content'          =>'消息内容'
		); 
		$service_order_id  = intval($posts['service_order_id']);
		$status 		   = intval($posts['status']);
		
		/* 更新通知主表 add_time 和 current 指向  */
		$notice_info  = get_info($notice,array('status'=>array('gt',0),'service_id'=>$service_order_id),array('combine','id'));  

		/* if(!$notice_info['combine'])  */  //未获取到数据;
		
		$sqls = 'update sr_notice set `current`=0  where  `current`=1 and `combine`='.intval($notice_info['combine']);
		
		$Model = M();
		$Model->startTrans();
		
		/* 先去除所有状态为1 */
		$result_current_out = $notice->execute($sqls);
		if($status){
			$sql = 'update sr_notice set current = 1,`status`='.intval($posts['status']).' , add_time=NOW() where service_id ='.$service_order_id;
		}else{
			$sql = 'update sr_notice set current = 1,`add_time` =NOW() where service_id ='.$service_order_id;
		}
		$result_current_on  = $notice->execute($sql);

		/* 插入详情消息 */
		$_POST = array(
			'notice_id' =>intval($notice_info['id']),
			'content'   =>$posts['content'],
			'add_time'  =>date('Y-m-d H:i:s'),
		);
		if($posts['title'])  $_POST['detail_title'] = $posts['title'];
		if($posts['view']) 	 $_POST['view'] 		= $posts['view'];
		
		$result_add_detail = update_data($notice_detail); 
		
		if(is_numeric($result_add_detail) && is_numeric($result_current_on) && is_numeric($result_current_out)){
			$Model->commit;			
			die;
		}else{
			$Model->rollback;
			die();
			//记录日志
		}
		
	}
    /*
		center_id order_num goods_id  type user_id 
	*/
} 