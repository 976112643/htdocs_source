<?php
namespace App\Controller\AppCommon;
use   Common\Org\Common;
use   Common\Plugin\Center;

class HelpController extends BaseController {
	
	 /*
	 * 设备APP - 帮助中心总接口
	 *		需求分析
	 *			获取所有帮助中心文章一次返回
	 *		流程分析
	 *          1、 设置默认返回信息
	 *			2、 接收数据,处理数据
	 *			3、 验证手机号
	 *			4、 验证密码
	 *          5、 身份验证成功,用户信息持久化 
	 *          6、 获取用户信息 以及用户相关的信息
	 *          7、 设置信息并返回
	 * @author	陆龙飞 <747060156@qq.com>
	 * @date	2015-08-24
	 * 接口地址 127.0.0.1/smh_crm/app/App/AppCommon/Help
	 * 方式提交 GET
		 request  参   数	
				  apptype    APP_KEY          	   Y      	   //密钥 
				 
		 response 参   数   'info'=>  array
		          id         string   11           Y           //ID
				  type       string   tinyint 1    Y           //类型  1-APP使用帮助   2-设备使用帮助
				  title      string   255          Y      	   //文章标题
				  content    string   txt          Y           //文章类容
				  add_time   string                Y           //文章添加时间
	 */
	/* 帮助中心 */
	/* 获取所有帮助中心文章 */
    public function index(){
		
		
		$map = array(
			'status'      =>1,
			'category_id' =>array('in',array(47,48)),  /*  sr_news sr_category */
		);
		
		$help_info = get_result('news',$map,true);
		if(!$help_info) $this->apiReturn(array('msg'=>'数据获取失败'));
		$data = array();
		
		foreach($help_info as $k=>$v){
			$data[] = array(
				'id'   		=>$v['id'],
				'title'		=>$v['title'],
				'type'	 	=>(intval($v['category_id'])-46),
				'add_time'  =>$v['add_time'],
				'content'   =>$v['content'],
			);
		}	
/* 		$help_list  = array(
			array('id'=>1,'type'=>1,'title'=>'怎么订购服务？','add_time'=>'2015-11-12 05:15:15','content'=>'这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>2,'type'=>1,'title'=>'怎么订购服务？','add_time'=>'2015-11-12 05:15:16','content'=>'这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>3,'type'=>2,'title'=>'怎么添加设备？','add_time'=>'2015-11-12 05:15:17','content'=>'怎么添加设备？，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>4,'type'=>1,'title'=>'怎么订购服务？','add_time'=>'2015-11-12 05:15:18','content'=>'这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>5,'type'=>2,'title'=>'怎么添加设备？','add_time'=>'2015-11-12 05:15:19','content'=>'怎么添加设备？，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>6,'type'=>1,'title'=>'怎么订购服务？','add_time'=>'2015-11-12 05:15:20','content'=>'这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>7,'type'=>2,'title'=>'怎么添加设备？','add_time'=>'2015-11-12 05:15:21','content'=>'怎么添加设备？，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>8,'type'=>1,'title'=>'怎么订购服务？','add_time'=>'2015-11-12 05:15:22','content'=>'这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
			array('id'=>9,'type'=>2,'title'=>'怎么添加设备？','add_time'=>'2015-11-12 05:15:23','content'=>'怎么添加设备？，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息，这样添加佩戴人信息'),
 		); */
		
		if(!empty($data)){
			$this->apiReturn(array('status'=>'1','msg'=>'数据获取成功！','info'=>$data));
		}else{
			$this->apiReturn(array('msg'=>'暂无数据！'));
		}
	}
	
	
	/* 网页模式  供安卓使用
	   优化:砍掉或者移植到其他网页项目中,开启API模式
	*/
	public function help(){
		
		$this->display('helpCenter');
	}
	
	public function appList(){
		
		$post 	   = I();
		$keyword   = $post['keyword'];
	
		$field = array('id','title','content','add_time');
		$data  = $this->page('news',array('status'=>1,'category_id'=>47),$order='`update_time` desc',$field,$limit='7');
		
		$this->assign('data',$data);
		$this->display();
	}
	
	public function deviceList(){
		
		$post 	   = I();
		$keyword   = $post['keyword'];
		
		$field = array('id','title','content','add_time');
		$data  = $this->page('news',array('status'=>1,'category_id'=>48),$order='`update_time` desc',$field,$limit='7');
		

		$this->assign('data',$data);
		$this->display('deviceList');
	}
	
	public function detail(){
		
		$post = I();
		$id   = $post['id'];
		
		$map = array(
			'status'      =>1,
			'id' 		  =>$id,  /*  sr_news sr_category */
		);
		
		$field  = array('title','content','add_time');
		$data   = get_info('news',$map,$field);
		
		
		$this->assign('title',$data['title']);
		$this->assign('content',$data['content']);
		$this->assign('add_time',$data['add_time']);
		$this->display('detail');
	}
	
	
}