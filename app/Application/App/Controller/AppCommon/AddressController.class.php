<?php
namespace App\Controller\AppCommon;
use   Common\Org\Common;
class AddressController extends BaseController {
	
	/*
	 * 地域信息
	 *		需求分析
	 *			获取中国地址信息
	 *		流程分析
     *          1、获取地址
	 *			2、返回信息
	 * 
	 * 手机app  区域地址
	 * @author	  陆龙飞 <747060156@qq.com>
	 * @date      2015-08-27
	 * 测试地址   127.0.0.1/smh_crm/app/App/AppCommon/Address
	 * 提交方式   GET
		 request 参数
			  key          string        //钥匙
			  user_id         int        //会员ID
			  id              int        //地域ID  传0 或不传默认获取全部省份
		 response 参数 'info' =>  二维数组
		      id              string     //子地址ID 
              title           string     //子地址
	 */
    public function index(){
        		
		/* 1、获取地址 */
		$pid       = intval(I('id'));
		$pid       = $pid?$pid:0;
		$area_info = Common::getAreaInfo($pid);   /* 获取地区子类 */  
		
		if($area_info){
			 $data     = Common::transform_arr(array('id','title'),$area_info);
			 $tips_msg = array('status'=>'1','msg'=>'获取成功','info'=>$data);
		}else{
			 $tips_msg = array('status'=>'0','msg'=>'地址信息获取失败');
		}		
	    /* 3、返回信息 */
		$this->ajaxReturn($tips_msg,'json');
    }
	
	
	
	
}