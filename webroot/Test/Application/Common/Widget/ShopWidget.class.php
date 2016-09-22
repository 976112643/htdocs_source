<?php

namespace Common\Widget;
use Think\Controller;
//use Common\Controller\CommonController;

class ShopWidget extends Controller {
	protected 	$default_config = array (
				'order' => 'sort desc,addtime desc ', 
				'limit' => 5,
				'tpl' => 'index', 
				'table'=>'shop',
				);
	public function index($config, $map='') {
		$last_config = array_merge ( $this->default_config, $config );
		//dump($last_config);exit();
		//$result = get_result('shop',$map,true,'sort desc,addtime desc','5');
		if($last_config['cache']){
			$result = $last_config['cache'];
		}else{
			//dump($last_config['cache']);
			$result = get_result($last_config['table'],$map,true,$last_config['order'],$last_config['limit']);
		}
		//dump($result);exit();
		$data['result'] = $result;
		$this->assign ( $data );
		$this->display ( T ( "Common@Shop/" .$last_config['tpl'] ) );
	}
	/**
	 * 获取推荐商家
	 * 1、获取推荐商家id
	 * 2、根据商家id获取推荐的商品
	 */
	public function shop($config, $map=''){
		/*前台传递配置和默认配置融合*/
		$last_config = array_merge ( $this->default_config, $config );
		/*获取推荐商家*/
		$result = get_result($last_config['table'],$map,true,$last_config['order'],$last_config['limit']);
		//dump($result);exit();
		if($result){
			$result = get_product($result);
		}
		$data['result'] = $result;
		$this->assign ( $data );
		$this->display ( T ( "Common@Shop/" .$last_config['tpl'] ) );
	}
	/**
	 * 主页推荐商家
	 * 1、根据所回调的分类ID来获取推荐商家。
	 * 2、根据商家来获取推荐商品
	 */
	public function shop_index($category_id,$config){
		/*前台传递配置和默认配置融合*/
		$last_config = array_merge ( $this->default_config, $config );
		/*如果没有传递店铺分类，就默认取第一个分类*/
		if(!is_numeric($category_id)){
			foreach ($last_config['cache'] as $key =>$val){
				if($category_id == $val){
					$category_id = $key;
				}
			}
		}
		$map['category_id'] = $category_id;
		$map['is_hid'] = 0 ;
		$map['is_del'] = 0 ;
		$map['status'] = 1;
		$map['recommend'] = 1;
		$result = get_result($last_config['table'],$map,true,$last_config['order'],$last_config['limit']);
		if($result){
			$result = get_product($result);
		}
		$data['shop_category'] = $last_config['cache'];
		$data['result'] = $result;
		$this->assign ( $data );
		$this->display ( T ( "Common@Shop/" .$last_config['tpl'] ) );
		//dump($result);exit();
	}
}
