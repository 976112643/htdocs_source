<?php
namespace Backend\Controller\Contents;
use Backend\Controller\Base\AdminController;
class PictureController extends AdminController {
	protected $table='resources';
	protected $action_filed='id,type';
	/*
	*用户列表
	*	需求分析
	*		需要将所有用户的信息全部显示到这张表中
	*	流程分析
	*		1、接收用户筛选信息,具体的信息看
	*		2、组织查询的条件
	*		3、按照条件将信息显示出来
	*		4、将信息中的int字段转化成文字信息
	*/
	public function index(){
		//接收用户筛选信息,具体的信息看，组织查询的条件
		$map['status']=array('GT',-1);
		
		//筛选图片的种类
		$picture_category = I('picture_category');
		if($picture_category){
			$map['type'] =	$picture_category;
			$data['type'] = $picture_category;
		}
		//时间筛选
		$add_time_begin = I('add_time_begin');
		$add_time_end = I('add_time_end');
		if(!empty($add_time_begin) && !empty($add_time_end)){
			$map['add_time'] = array(array('GT',$add_time_begin),array('LT',$add_time_end));
			$data['add_time_begin'] = $add_time_begin;
			$data['add_time_end'] = $add_time_end;
		}
		
		$picture_category = array(1=>'店铺图片',2=>'商品图片',4=>'店铺视频');//显示图片的种类
		//按照条件将信息显示出来
		$result=$this->page($this->table,$map,'add_time desc');
		//将信息中的int字段转化成文字信息
		$result=int_to_string($result,array('type'=>$picture_category));
		
		$data['picture_category'] = $picture_category;
		$data['result']=$result;
		$this->assign($data);
		$this->display();
	}
	/*
	 *用户列表页添加功能
	 *	需求分析
	 *		尽量将用户的信息显示出来，让后台能够控制的东西更多
	 *	流程分析	
	 *		1、将用户的等级信息显示出来
	 *		2、生成用户登录的数字登录码
	 *		3、添加用户
	 * */
	/* public function add(){
		if(IS_POST){
			$_POST['type'] = 'help';
			$_POST['member_id'] = session('member_id');
			$_POST['update_member_id'] = session('member_id');
			$_POST['update_time'] = date('Y-m-d H:i:s',time());
			$this->update();
		}else{
			//将帮助分类的类别显示出来
			$map['status'] = array("GT",0);//将正常的显示出来
			$map['type'] = 3;
			
			$help_category = get_result('category',$map);
			
			//将帮助信息数据组织成树形
			$help_category = list_to_tree($help_category);
			$data['help_category'] = $help_category;
			
			$this->assign($data);
			$this->display('operate');
		}
	} */
	/*
	 * 修改菜单
	 * @time 2014-12-26
	 * @author	郭文龙  <2824682114@qq.com>
	 * */
	public function edit(){
		if(IS_POST){
			$this->update();
		}else{
			$id=intval(I('id'));
			$map['id']=$id;
			$data['info']=M($this->table)->where($map)->find();
			
			//将帮助分类的类别显示出来
			$map['status'] = array("GT",0);//将正常的显示出来
			$map['type'] = 3;
			
			$help_category = get_result('category',$map);
			
			//将帮助信息数据组织成树形
			$help_category = list_to_tree($help_category);
			$data['help_category'] = $help_category;
			
			$this->assign($data);
			$this->display('operate');
		}
	}
	/*
	 * 添加/修改操作
	 * @time 2014-12-26
	 * @author	郭文龙  <2824682114@qq.com>
	 * */
	public function update(){
		if(IS_POST){
			$id=intval(I('post.id'));
			$rules = array ( 
			    array('username','require','用户名必须填写！'),
			);
			$_POST['is_admin']=0;
			if($id==0){//如果是添加
				$rules[] = array('password','require','密码必须填写！');
				$_POST['password']=md5(md5(I('post.password')));
			}else{//如果是修改
				if(I('post.password')){
					$_POST['password']=md5(md5(I('post.password')));
				}else{
					unset($_POST['password']);
				}
			}
			$result=update_data($this->table, $rules);
			if(is_numeric($result)){
				$this->success('操作成功',U('index'));
			}else{
				$this->error($result);
			}
		}else{
			$this->success('违法操作',U('index'));
		}
	}
// 	public function del(){
// 		$ids = I('ids');
// 		if(!$ids){
// 			$this->error('请选择数据！！');
// 		}
// 		if(is_array($ids)){
// 			//删除数据
// 			$map['id'] = array('in',$ids);
// 			$result = delete_data($this->table,$map);
// 		}else{
// 			//查询这条信息
// 			$pic_info  = get_info($this->table,array('id'=>$ids));
// 			//删除真实的图片
// 			$unlink = unlink($pic_info['img_path']);

// 			$map['id'] = $ids;
// 			$result = delete_data($this->table,$map);
			
			
// 		}
// 		if($result){
// 				$this->success('操作成功！！',U('index',I('get.')));
// 		}
// 	}
}
