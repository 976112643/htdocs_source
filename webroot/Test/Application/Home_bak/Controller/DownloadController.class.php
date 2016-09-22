<?php
namespace Home\Controller;
use Home\Controller\HomeController;
class DownloadController extends HomeController {
	
	public function index(){
		
		
        $this->display('app_download');
    }
   
   
   	/*
	 * 下载网站文件
	 *	$file  文件地址
	 * */
	public function down_file(){
		$file ='./Uploads/api/qbk.apk';
		header("Content-type: application/octet-stream");
		header('Content-Disposition: attachment; filename="' . basename($file) . '"');
		header("Content-Length: ". filesize($file));
		readfile($file);
	}
	
}