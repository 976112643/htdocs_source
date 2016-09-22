<?php

namespace Home\Controller;

use Think\Controller;
/*
 * 文件上传
 */
class SaveFileController extends Controller {
	public function index() {
	
		$requestMethod = I ( 'server.REQUEST_METHOD' );
		if ($requestMethod != 'POST' ) {
			die ( "非法操作" );
		}
		
		@set_time_limit ( 0 );
		$filename=$_FILES['uploadfile']['name'];
		$targetDir = 'upload_tmp/'.$_FILES['uploadfile']['tmp_name']; // 上传的临时目录
		$file_Dir="upload/";
		$file_path = $file_Dir . $filename;
		move_uploaded_file ($_FILES['uploadfile']['tmp_name'], $file_path );
		die('http://192.168.2.111/manor/'.$file_path);
	}
}