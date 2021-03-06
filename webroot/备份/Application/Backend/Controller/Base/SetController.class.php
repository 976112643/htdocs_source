<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class SetController extends AdminController {
	protected $table='config';
	/*
	 * 配置编辑
	 * @time 2015-02-04
	 * @author	康利民  <3027788306@qq.com>
	 * */
	public function index(){
		if(IS_POST){
			$posts=I("post.");
			/*
			 *调整form_name的顺序，将form_name为editor的顺序调到最后
			 *因为表单提交过来的数据会自动把编辑器的值放到后面
			 */
			foreach ($posts['form_name'] as $val){
				if($val!="editor"){
					$fromname[]=$val;
				}else{
					$editor_arr[]=$val;
				}
			}
			unset($posts['form_name']);
			if($editor_arr){
				$form_name=array_merge($fromname,$editor_arr);
			}else{
				$form_name=$fromname;
			}

			$num=0;
			foreach ($posts as $key=>$val) {
				$_POST=null;
				if(is_array($val)){
					$value='';
					foreach ($val as $k=>$v) {
						$value.=$v.',';
					}
					$value=rtrim($value,',');
				}else{
					$value=$val;
				}

				if($form_name[$num]=="image"){
					multi_file_upload($value,'Uploads/System/Image','config','id',$key,'value');
				}else{
					$_POST["id"]=$key;
					$_POST["value"]=$value;
					update_data($this->table);
				}
				$num++;
			}
			F('config',null);
			$this->success("设置成功");
		}else{
			$map['status'] =1;			/*查询未被删除的项*/
			$data['_result']=M($this->table)->where($map)->select();
			$this->assign($data);
			$this->display();
		}
	}
	public function ajaxDelete_config(){
		$posts=I("post.");
		$info=get_info($this->table,array("id"=>$posts['id']));
		$path=$info['value'];
		$_POST=null;
		if(file_exists($path)){
			if(@unlink($path)){
				$_POST['id']=$posts['id'];
				$_POST['value']='';
				update_data($this->table,array("id"=>$posts['id']));
				$this->success("删除成功");
			}else{
				$this->error("删除失败");
			}
		}else{
			$_POST['id']=$posts['id'];
			$_POST['value']='';
			update_data($this->table,array("id"=>$posts['id']));
			$this->success("文件不存在，删除失败，数据被删除");
		}
	}
}