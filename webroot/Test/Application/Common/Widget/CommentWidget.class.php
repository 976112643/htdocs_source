<?php

namespace Common\Widget;
//use Think\Controller;
use Common\Controller\CommonController;

class CommentWidget extends CommonController {
	protected 	$default_config = array (
				'order' => 'sort desc,addtime desc ', 
				'limit' => 5,
				'tpl' => 'index', 
				'table'=>'shop',
				);
	public function index($config, $map=''){
		/*前台传递配置和默认配置融合*/
		$last_config = array_merge ( $this->default_config, $config );
		$view = D('CommentView');
		$result = $this->page($view,$map,'id desc',true,1);
		$result = $this->comment_re($result);
		/*获取有图片的评论个数*/
		$data['has_pic'] =$this->comment_count($result,'img_pic','1');
		//$data['does_pic'] = $this->comment_count($result,'img_pic','0');
		/*获取好评个数*/
		$data['good_comment'] = $this->comment_count($result,'type','0');
		/*获取中评个数*/
		$data['comment'] = $this->comment_count($result,'type','1');
		/*获取差评个数*/
		$data['bade_comment'] = $this->comment_count($result,'type','2');
		$data['result'] = $result;
		$data['id'] = $map['product_id'];
		//dump($data['result']);exit();
		$this->assign ( $data );
		$this->display ( T ( "Common@Comment/" .$last_config['tpl'] ) );
	}
	public function comment_re($result){
		if(empty($result)){
			return '';
		}
		$ids =  array_column($result, 'id');
		$ids = implode(',', $ids);
		if(empty($ids)){
			return '';
		}
		$map['pid'] = array('in',$ids);
		$map['is_hid'] = 0 ;
		$map['is_del'] = 0 ;
		$re = get_result('comment',$map,true);
		$map['comment_id'] = $map['pid'];
		unset($map['pid']);
		$img = get_result('comment_image',$map,true);
		$result = $this->get_comment($result, $re, $img);
		return $result;		
	}
	/**
	 * 评论回复合并
	 */
	public function  get_comment($array,$arr,$img){
		foreach ($array as $key =>$value){
			foreach ($arr as $val){
				if($val['pid'] == $value['id']){
					$array[$key]['comment'][] = $val;
				}
			}
			foreach ($img as $va){
				if($va['comment_id'] == $value['id']){
					$array[$key]['img'][] = $va;
				}
			}
		}
		return $array;
	}
	/**
	 * 根据不同的参数传递不同的评论统计
	 * @param 所有评论集合 $array
	 * @param 区分的字段名 $count_type
	 * @param 区分字段的值 $type
	 * @return 返回统计个数或者是数组
	 */
	public function comment_count($array,$count_type='type',$type=''){
	
		foreach ($array as $key=>$value){
			if($count_type && $count_type == 'pid'){
				if($value['pid'] != 0 ){
					$arr[] = $value;
				}
			}else{
				if($value[$count_type] == $type && $value['pid'] == 0 ){
					$arr[] = $value;
				}
			}
		}
		if(  $count_type == 'pid'){
			return $arr;
		}
		$sum = count($arr);
		return $sum;
	}
}
