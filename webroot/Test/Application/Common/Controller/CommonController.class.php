<?php

namespace Common\Controller;

use Think\Controller;

use Common\Org\Request;

class CommonController extends Controller {
	/**
	 * 前台控制器初始化
	 */
	protected function _initialize() {
		/* 读取配置 */
		if (! F ( 'config' )) {
			$config = M ( 'config' )->getField ( 'name,value' );
			F ( 'config', $config );
		} else {
			$config = F ( 'config' );
		}
		C ( $config ); // 合并配置参数到全局配置
		$this->__autoload ();
		if(IS_POST) Request::do_post();
	}
	protected function __autoload(){}
	
	/*
	 * 分页功能
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function page($model, $map = array(), $order = '', $field = array(),$limit=0) {
		if (is_string ( $model )) {
			$model = M ( $model );
		}
		if(intval($limit) ==0){
			$limit = $_REQUEST ['r'] ? $_REQUEST ['r'] : 5;
		}	
		//$limit = 2;//TODO:部署前删掉	
		$page = intval ( $_GET ['p'] );
		// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
		$list = $model->where ( $map )->field ( $field )->order ( $order )->page ( "$page,$limit" )->select ();
		session ( 'sql', $model->getLastSql () );
		$data ['count'] = $count = $model->where ( $map )->count (); // 查询满足要求的总记录数
		$data ['pages'] = ceil ($count/$limit);
		$Page = new \Think\Page ( $count, $limit ); // 实例化分页类 传入总记录数和每页显示的记录数
		$Page->setConfig ( 'header', '条数据' ); // 共有多少条数据
		$Page->setConfig ( 'prev', "上一页" ); // 上一页
		$Page->setConfig ( 'next', '下一页' ); // 下一页
		$Page->setConfig ( 'first', '首页' ); // 第一页
		$Page->setConfig ( 'last', '尾页' ); // 最后一页
		$data ['page'] = $Page->show (); // 分页显示输出
		//var_dump($data);die;
		$this->assign ( $data ); // 赋值分页输出
		//dump($data);exit();
		return $list;
	}
	/*
	 * 分页功能
	 * @time 2014-12-26
	 * @author 郭文龙 <2824682114@qq.com>
	 */
	function pages($model, $map = array(), $order = '', $field = array(),$limit=0) {
		if (is_string ( $model )) {
			$model = M ( $model );
		}
		if(intval($limit) ==0){
			$limit = $_REQUEST ['r'] ? $_REQUEST ['r'] : 20;
		}
		//$limit = 2;//TODO:部署前删掉
		$page = intval ( $_GET ['p'] );
		// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
		$list = $model->where ( $map )->field ( $field )->order ( $order )->page ( "$page,$limit" )->select ();
		session ( 'sql', $model->getLastSql () );
		$data ['count'] = $count = $model->where ( $map )->count (); // 查询满足要求的总记录数
		$data ['pages'] = ceil ($count/$limit);
		$Page = new \Think\Page ( $count, $limit ); // 实例化分页类 传入总记录数和每页显示的记录数
		$Page->setConfig ( 'header', '条数据' ); // 共有多少条数据
		$Page->setConfig ( 'prev', "上一页" ); // 上一页
		$Page->setConfig ( 'next', '下一页' ); // 下一页
		$Page->setConfig ( 'first', '1' ); // 第一页
		$Page->setConfig ( 'last', '尾页' ); // 最后一页
		$data ['page'] = $Page->show (); // 分页显示输出
		$this->assign ( $data ); // 赋值分页输出
		
				show_bug($data);
		die();
		return $list;
	}
	
	/* 删除临时上传图片 */
	public function delTempFile($id) {
		if (! session ( "member_id" )) {
			$this->error ( "没有登录不能进行此操作" );
		}
		$info = get_info ( "file", array (
				"id" => $id 
		) );
		$path = ltrim ( $info ['save_path'], '/' );
		if (file_exists ( $path )) {
			if (@unlink ( $path )) {
				$info = "删除成功";
			} else {
				$info = "删除失败";
			}
		} else {
			$info = "文件不存在，删除失败";
		}
		delete_data ( "file", array (
				"id" => $id 
		) );
		$this->success ( $info );
	}
	
	/* 文件上传 */
	public function uploadFile() {
		$return = array(
			'status'=> 1,
			'info'	=> '上传成功',
			'data'	=> ''
		);
		/* 调用文件上传组件上传文件 */
		$File = D('File');
		$file_driver = C('FILE_UPLOAD_DRIVER');
		$info = $File->upload($_FILES,C('FILE_UPLOAD'),C('FILE_UPLOAD_DRIVER'),C("UPLOAD_{$file_driver}_CONFIG"));
		/* 记录附件信息 */
		if ($info) {
			$return ['status'] = 1;
			$return = array_merge ( $info ['download'], $return );
		} else {
			$return ['status'] = 0;
			$return ['info'] = $File->getError ();
		}
		
		/* 返回JSON数据 */
		$this->ajaxReturn ( $return );
	}
	
	/* 下载文件 */
	public function download($id = null) {
		if (empty ( $id ) || ! is_numeric ( $id )) {
			$this->error ( '参数错误！' );
		}
		
		$logic = D ( 'Download', 'Logic' );
		if (! $logic->download ( $id )) {
			$this->error ( $logic->getError () );
		}
	}
	
	/**
	 * 上传图片
	 * 
	 * @author huajie <banhuajie@163.com>
	 */
	public function uploadPicture() {
		// TODO: 用户登录检测
		
		/* 返回标准数据 */
		$return = array (
				'status' => 1,
				'info' => '上传成功',
				'data' => '' 
		);
		
		/* 调用文件上传组件上传文件 */
		$Picture = D ( 'File' );
		$pic_driver = C ( 'IMG_UPLOAD_DRIVER' );
		$info = $Picture->upload ( $_FILES, C ( 'IMG_UPLOAD' ), C ( 'IMG_UPLOAD_DRIVER' ), C ( "UPLOAD_{$pic_driver}_CONFIG" ) ); // TODO:上传到远程服务器
		
		/* 记录图片信息 */
		if ($info) {
			$return ['status'] = 1;
			$return = array_merge ( $info ['download'], $return );
		} else {
			$return ['status'] = 0;
			$return ['info'] = $Picture->getError ();
		}
		
		/* 返回JSON数据 */
		$this->ajaxReturn ( $return );
	}
	/* 百度编辑器上传调用方法 */
	public function ueditor() {
		$data = new \Ueditor\Ueditor ();
		$this->ajaxReturn($data->output(), 'EVAL');
		//echo $data->output ();
	}

	/*
	 * 发送验证码
	 * 根据提交过来的内容进行正则验证判断是邮箱还是手机
	 * 然后发送验证码
	 * $account 	string 	邮箱/手机号码
	 * $type        注册还是登陆模式
	 * @time 2015-05-13
	 * @author	康利民  <3027788306@qq.com>
	 * */
	public function getCode($type=''){
		if($type == 3){
			$account= session('home_mobile');
		}elseif($type == 4){
    		$account= session('home_email');
    	}else{
			$account=trim(I('post.account'));
		}
    	if($account==''){
    		$this->error('请输入手机号码/邮箱！');
    	}
    	$map['email|mobile']=$account;
    	$map['is_del'] = 0;
    	$info=get_info("member",$map);
		$code=rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
		if($type == 1){
			if($info){
				 	$this->error('账号已被注册'); 		
			}
		}elseif ($type == 2){
			if(empty($info)){
				$this->error('账号不存在');
			}
		}
// 		if($info){
// 			$this->error('账号已被注册');
// 		}
		//如果是手机号码
		if(preg_match(C('validate_phone'), $account)){
			$content="您的校验码是：".$code."。请不要把校验码泄露给其他人。如非本人操作，可不用理会！";
			//$status=sms($account, $content);
			//if(is_numeric($status) || $status==null){
				session('account_type','phone');
				session('get_code',$code);
				session('get_account',$account);
				//echo $code;
				$this->success('验证短信已发送，请注意查收'.$code);
			//}else{
				//$this->error($status);
			//}
		}else if ( preg_match(C('validate_email'), $account ) ){
			//如果是邮箱
			$subject=C('SITE_TITLE')."验证码邮件";
			$body="尊敬的".C('SITE_TITLE')."用户，您好：<br />您的验证码为:".$code."，如非本人操作，无需理会";
			$status=send_mail($account,$account,$subject,$body);
			if($status==1){
				session('account_type','email');
				session('get_code',$code);
				session('get_account',$account);
				$this->success('验证邮件已发送，请登录查看');
			}else{
				$this->error('验证邮件发送失败，请联系客服');
			}
		}else{
			session('get_account',null);
			session('get_code',null);
			$this->error('请输入正确的手机号码/邮箱！');
		}
	}

	/*
	 * 根据地区ID获取下级城市数据
	 * 主要用于地区两级联动下拉框
	 */
	public function ajaxcity(){
		$id=intval(I('id'));
		if($id){
			foreach(getArea() as $val){
				if($val['pid']==$id){
					$result[]=$val;
				}
			}
		}
		if(is_array($result)){
			$this->success($result);
		}else{
			$this->error('该地区下没有数据');
		}
	}
}