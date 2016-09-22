<?php

	/*
	 * 设备插件
	 * @需求：
	 * 后台可以管理新闻
	 * 前台显示
	 * @time 2015/10/14
	 * @author 朱成
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;

class Device extends Main{
	const TABLE = 'device';
	const USER_DEVICE = 'user_device';
	const MODEL       = 'UserDeviceView';
	const LIST_LIMIT  = 4;
	const URL_LIST 	  = 'Home/News/index';
	const URL_DETAIL  = 'Home/News/detail';
	const TYPE_NOTICE = 4;
	/*
	 *服务人员管理列表
	 * @需求：
	 * 列表展示，可以按类型切换
	 * @time 2015/10/14
	 * @author 朱成
	 * */
	static function device_list($map,$order){
		$result = Database::Newpage(self::TABLE, $map,$order,true);
		return $result;
	}
	
	/*
	 * 服务人员操作公用方法
	 * @time 2015-10-15
	 * @author 朱成 <3027788306@qq.com>
	 */
	protected function update($id) {
		$posts=I();
		$id = intval($posts['id']);
		$rules = array ( 
			array('username','require','姓名必须填写！'),
			array('year','require','请选择年！'),
			array('month','require','请选择月！'),
			array('day','require','请选择日！'),
			//array('birthday','require','生日必须填写！'),	
			array('vins_no','require','设备号必须填写！'),
			array('card_no','require','身份证号必须填写！'),
			array('province','require','请选择省份！'),
			array('city','require','请选择省份！'),
			array('area','require','请选择县/区！'),
			array('detailed_address','require','详细地址不能为空！'),
			array('phone','require','手机号必须填写！'),
			array('insurance_no','require','医保卡必须填写！'),
		);
		if($id>0){
			$_POST['id']=$id;
		}else{
			unset($_POST['id']);
		}
		$_POST['birthday']=$posts['year'].'-'.$posts['month'].'-'.$posts['day'];
		$result = update_data ( self::TABLE, $rules );
		if (is_numeric ( $result )) {
			 if ($posts['image'] != '') {
				unlink($_POST['old_image']);
			}
			if(Common::is_num($posts['image_1'])){
					multi_file_upload($posts['image_1'],'Uploads/Device', 'device_img', 'archives_id', $result, 'image_path');
			}
			$this->success ( '操作成功！',U( '/Manager/ServiceCenter/NetworkEquipment/index'));
		} else {
			$this->error ( $result );
		}
	}
	
	/*
	 * 添加服务人员
	 * @time 2015-10-15
	 * @author 朱成 <3027788306@qq.com>
	 */
	function add($id) {
		if (IS_POST) {
			$this->update($id);
		} else {
			/*获取地址缓存*/
			$area = Common::get_area_cache();
			$data['area'] = $area;
			$this->assign($data);
			$this->assign ( "meta_title", "添加" );
			$this->display ( 'operate' );
		}
	}
	
	/*
	 * 编辑服务人员
	 * @time 2015-10-15
	 * @author 朱成 <3027788306@qq.com>
	 */
	public function edit($id) {
		if (IS_POST) {
			$this->update ($id);
		} else {
			$id =intval(I( 'id'));
			$info=get_info(self::TABLE,array('id' => $id));
			$birthday_arr=explode('-',$info['birthday']);
			$info['year']=$birthday_arr[0];
			$info['month']=$birthday_arr[1];
			$info['day']=$birthday_arr[2];
			$data['info']=$info;
			/*获取地址缓存*/
			$area = Common::get_area_cache();
			$data['area'] = $area;
			foreach ($area as $value){
				if ($value['id'] == $info['province']){
					$province_data['province'] = $value['title'];
					$province_data['id'] = $value['id'];
				}
				if ($value['id'] == $info['city']){
					$city_data['city'] = $value['title'];
					$city_data['id'] = $value['id'];
				}
				if ($value['id'] == $info['area']){
					$area_data['area'] = $value['title'];
					$area_data['id'] = $value['id'];
				}
			}
			$data['detailed_address']=$info['detailed_address'];
			$data['province_data']=$province_data;
			$data['city_data']=$city_data;
			$data['area_data']=$area_data;
			$this->assign($data);
			$this->assign ( "meta_title", "修改" );
			$this->display ( 'operate' );
		}
	}
	
	//app 设备管理--设备列表 
	//获取当前用户所绑定的设备列表
	static function device_lists($user_id,$field=true){

		$user_id = intval($user_id);
		if(!$user_id) return false;
		$map = array(
		    'user_device.status'  =>1,        
			'user_device.user_id' =>$user_id,
		);

	  	$result =  Database::page(D(self::MODEL),$map, 'add_time desc',$field);   
		return $result;
	}
	
	/* 添加绑定
	 *		需求分析
	 *			设备管理--删除设备信息
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-21
	 * @操作数据user_device[用户设备绑关联表]
     * @parma    $post	array(
								device_id
								user_id
								remark
							 )  
	 * @return   bool	         //是否操作成功
	*/
	static function device_band($post){

		$remark  = $post['remark'];
		$user_id = $post['user_id'];
		$status = self::band_check($post);
		if( 0 > $status )  return $status;	/* 可不进行绑定 直接返回状态 */			
		
		/* 判断是否重复添加 */
		$has  = Database::get_info(self::USER_DEVICE,array('user_id'=>$user_id,'device_id'=>$status,'status'=>1),array('id'));
		if($has) return -6;
		
 		$_POST  = array(
			'user_id'  =>$user_id,
			'device_id'=>$status,
			'remark'   =>$remark,
			'status'   =>1,
		);
		$result = Database::update_data(self::USER_DEVICE);
		if(is_numeric($result)){
			return 1; 	/* 操作成功！ */
		}else{
			return -5;  /* 添加失败！ */
		}
		
	}
	/* 删除绑定
	 *		需求分析
	 *			设备管理--删除设备信息
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-21
	 * @操作数据user_device[用户设备绑关联表]
     * @parma    $user_device_id		 //绑定设备记录ID	  
	 * @return   bool	                 //是否操作成功
	*/
	static function device_unband($user_device_id){
        
		/* 重复提交问题 -- 预留 */
		$_POST = array(
			'id'	  =>$user_device_id,
			'status'  =>-1,      		
		);
		$result  = 	Database::update_data(self::USER_DEVICE,'',$map);
		if(is_numeric($result)){
			return true;
		}else{
			return false;
		}
		
	}
	
	/* 获取详情
	 *		需求分析
	 *			设备管理--删除设备信息
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-21
	 * @操作数据 UserDeviceView[用户设备视图模型]
     * @parma    $user_id		     	 //用户ID		    -- sr_user 表  
     * @parma    $id   			     	 //绑定设备记录ID	-- sr_user_device	 表
	 * @return   bool	                 //是否操作成功
	*/
	static function device_detail($user_id,$id){
		if(!$user_id || !$id) return false;
		$map  = array(
			'user_device.user_id'=>$user_id,
			'user_device.id'	 =>$id,
			'user_device.status' =>1,
		);
		$user_device_detail  =  Database::get_info(D(self::MODEL),$map,true);
		return  $user_device_detail;
	}

	/* 设备管理设备添加(绑定)验证
	 *		需求分析
	 *			验证用户提交的设备信息对应的设备是否可以进行设备添加(绑定设备)
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-10-21
	 * @操作数据 device[设备信息表]
     * @parma    post 	array(
							phone		  //产品绑定手机号
							vins_no		  //设备识别码
							password      //安全密码
						  ) 			  
	 * @return   数值	int
	                    大于0             //表示验证通过 返回设备的ID
						-1				  //设备信息获取失败
						-2				  //手机号错误
						-3				  //安全密码错误 
						-4				  //设备还未绑定到服务中心
	*/
	static function band_check($post){
		
		/* 产品绑定手机号  phone    */
		/* 设备识别码      vins_no  */
		/* 安全密码 	   password */
		$map 	= array(
			'status' =>array('gt',0),
			'vins_no'=>$post['vins_no'],
		);
		$field  = array(
			'id',
			'status',
			'phone',
			'password',
		);		

		$device_info  =  Database::get_info(self::TABLE,$map,$field);
		
        if(!$device_info)  								  	  return -1;	/* 设备信息获取失败 */
		if($post['phone']    != $device_info['phone'])		  return -2; 	/* 手机号错误 */
		if($post['password'] != $device_info['password']) 	  return -3;	/* 安全密码错误 */
		switch(intval($device_info['status'])){
			case 1:
				return  -4;  /* 设备还未绑定到服务中心 */
				break;
		}
		/* if($device_info['status'] == 2) return $device_info['id'];      状态为待绑定 */
        /* return 0 ;                                    			    	其它错误 */         		
		return $device_info['id'];
	}
	
	
} 