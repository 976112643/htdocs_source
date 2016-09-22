<?php
/**
 * Class 产品类
 *	
 */
namespace Common\Plugin;
use Think\Upload;

class Image{
	
	public $config = array(	//默认配置
			'maxSize'	 => 3145728,   
			'rootPath'   => 'Uploads/', //保存根路径			
			'savePath'   => '/head/',    
			'saveName'   => array('uniqid',''),    
			'exts'       => array('jpg', 'gif', 'png', 'jpeg'),    
			'autoSub'    => true,
			'subName'    => array('date','Ymd'),
		);
	
	public function __construct(){
		
	}
	
	/* 图片上传 */
	public  function uploadImgs($config=null){
		if(empty($config)){
			$config = $this->config;
		}
		return $this->upload($config);	//返回上传成功的图片信息 多图返回二维数组  单图返回一维数组
		
		
	}
	
	

	/* 将该关键词的次数增加 */
	private function upload($config){  
	
		$upload =  new Upload($config);         /* 实例化上传类 */	
		$info   =  $upload->upload();
		if(!$info){
			return false;
		}else{
			return $info;
		}
	}
	
	
	
}