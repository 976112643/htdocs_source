<?php
namespace Common\Controller;
use Think\Controller;
use Common\Org\Common;
use Common\Org\Cache;
use Common\Org\Request;

class AppController extends Controller {

	/**
	 * 前台控制器初始化
	 */
	protected function _initialize() {
		
		/*读取配置*/
		$config = Cache::db_table('config');
		C($config);  							/* 合并配置参数到全局配置 */
		if(method_exists($this,'__autoload')) $this->__autoload();
		if(IS_POST) Request::do_post();
	}

	/*
	 * 分页功能
	 * @time 2014-12-26
	 * @author llf <276694999@qq.com>
	 */
	function page($model,$map=array(),$order='',$field=array(),$limit='',$page=''){
		
		if(is_string($model)) $model  = M($model);
		if(!$limit)           $limit  = $_REQUEST['r']?$_REQUEST['r']:6;  /* 每页数量 */
		if(!$page) 			  $page   = intval($_REQUEST['p']);			  /* 页数 */

		/* 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取 */
		
		$list = $model->where($map)->field($field)->order($order)->page("$page,$limit")->select();
		// die($model->getLastSql());
		$data['count']=$count= $model->where($map)->count();	/* 查询满足要求的总记录数 */
		$data['page_count'] = ceil($count/$limit);				/* 计算总页码数 */
		$Page = new \Think\Page($count,$limit);					/* 实例化分页类 传入总记录数和每页显示的记录数 */
		
		/* $Page->rollPage = 7; */								/* 分页栏显示的页数 */
		$data['page']       = $Page->show();					/* 分页显示输出 */
		
		/* 网页使用| */
		// $Page->setConfig('header', '条数据');//共有多少条数据
        // $Page->setConfig('prev', "上一页");//上一页
        // $Page->setConfig('next', '下一页');//下一页
        // $Page->setConfig('first', '首页');//第一页
        // $Page->setConfig('last', '尾页');//最后一页
        // $data['page'] = $Page->show();// 分页显示输

		return $list;
	}

	
	/* 单文件上传 站内上传 tp默认不允许上传到更目录外去*/
    public function upload_one($files,$config){  
   
/*      $config = array(    
			'maxSize'    =>    3145728,    
			'savePath'   =>    './Public/Uploads/',    
			'saveName'   =>    array('uniqid',''),    
			'exts'       =>    array('jpg', 'gif', 'png', 'jpeg'),    
			'autoSub'    =>    true,    
			'subName'    =>    array('date','Ymd'),
		); */
		$upload = new \Think\Upload($config);        /* 实例化上传类 */	
		
		/* 上传单个文件      */
		$info   =   $upload->uploadOne($files);      /* $_FILES['photo1'] */
		if(!$info) {
			/* 上传错误提示错误信息 */
			return  false;                  		 /* $this->error($upload->getError()) */
		}else{
			/* 上传成功 获取上传文件信息 */
			return  $info;
		}
	}
	
	
	/*
	* 接口发送验证码
	* @param   string    $account        账号
	* @param   int       $type           类型  1-未注册型 2-已注册型
	* @param   string    $account_type   发送到类型  默认为 'mobile'-- 发送到   'email'--发送到邮件
	* @return  bool       
	**/
	public function sendCode($account,$type,$account_type='mobile'){
		
		$code	 = rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
		$content = '您的验证码是:'.$code.'。请不要把验证码泄露给其他人。如非本人操作，可不用理会！【生命手环】';
		$type    = intval($type);
		if($account_type === 'mobile'){
			$account_info = get_info('user',array('status'=>1,'username'=>$account),array('id'));
			if($account_info && $type === 1){
				$this->ajaxReturn(array('status'=>'0','msg'=>'该用户已经注册了！'),'json');
			}
			if(!$account_info && $type === 2 ){
				$this->ajaxReturn(array('status'=>'0','msg'=>'该用户还未注册！'),'json');
			}
		}
		switch($account_type){
			case 'mobile':
				$sendStatus  = Common::sms($account, $content);
				if(is_numeric($sendStatus) || $sendStatus==null){
					return $this->setCodeSession($account,$code,$type,$account_type); 
				}else{
					$this->ajaxReturn(array('status'=>'0','info'=>'发送失败！'),'json');
				}
				break;
			default :
				break;
		}
		return false;    
	}

	
	/*  */
	public	function setCodeSession($account,$code,$type,$account_type){
		
		$code_info = array(
			'type'         =>$type,
			'account_type' =>$account_type,
			'get_code'	   =>$code,
			'get_account'  =>$account,
			'send_time'    =>time(),
		);
		$_POST = array(
			'session_info' =>json_encode($code_info),
			'add_time'     =>time(),
		);
		$res = update_data('session');
		return $res;
	}
	/* 清除验证码session */
	public function unsetCodeSession(){
		session('code_info',null);
	}
	
	/* 验证短信验证码 
		type  1--不存在验证  2--存在验证  
	*/
	public function checkCode($code,$code_id,$mobile,$type=1){
		
		/* 验证验证码 */
		$info      = get_result('session',array('id'=>$code_id),true,$order='add_time desc',$limit=1);
		$code_info = json_decode($info[0]['session_info'],true);
		
		if(!$info || empty($info) || !is_array($code_info))	    	return -4;
		if($code != $code_info['get_code']) 						return -3;
		if($code_info['get_account'] != $mobile) 					return -2;
		if($code_info['type'] != $type)			 					return -1;
		if($code_info['send_time'] < (time()-360))	 				return  0;  
		
		/* 验证码过期 */
		return 1;
	} 


	
	/*
	 * 判断用户登录时间是否过期
	 * @param     string   $key   md5加密的登录时间
	 * @param     int      $id    数据id
	 * @author    陆龙飞
	 * @date      2015-09-30
	 * @return    bool
	 * */
	public function isLoginExpire($key,$id){
		
		if(!empty($key) and is_numeric($id)){
	   	
			$model = "user";   				 /* 用户表 */
			$map["id"] = array("eq",$id);
	   	 
			$result=get_info($model,$map,$field="login_time");
			if($key!=md5($result["login_time"])){
				return false;
			}
		}
		return true;
	}
  
	/*
	* 判断是否为app，和用户是否同时登录
	* @time 2015-08-11
	* @author	 雷虎  <2824682114@qq.com>
	* 1.登录     参数  apitype,key,home_member_id
	* 2.不用登录 参数  apitype
	* 
	*/
	public function app_login_common($posts){
		
		/* 手机app接口密钥 */
		$info    = array('status'=>3);         				 	   /* 默认返回状态 */
		$apptype = $posts['apitype']===C('API_KEY') ?true:false;
		$app_key = trim($posts["key"]); 
		$member_id = $posts["home_member_id"];	    			   /* 是否已经登录 */
 		if(!$apptype || !$app_key || !$member_id) $this->ajaxReturn($info,'json'); 

		$user_login = $this->isLoginExpire($app_key,$member_id);   /* 判断登录过期(同时登录) */ 
		if(!$user_login){
			$this->ajaxReturn($info,'json');
		}

	} 
	
	
	/* 接口封装输出 */
	public function apiReturn($data,$type='json'){
		$defult = array('status'=>'0','msg'=>'error !');
		if(!isset($data)){
			$data = $defult; 
		}else{
		    $data = array_merge($defult,$data);	
		}
		$this->ajaxReturn($data,$type);
	}

	
}