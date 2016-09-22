<?php defined('API');
//查询是否有该接口
$rs = select('SELECT url,re FROM api ;');
//var_dump($rs);
if($_GET['key']){
	$_key=$_GET['key'];
	
	echo ''.$_key;
	die;
}
else {
	$root='api/';
	foreach($rs as $key=>$val){
	$url=$val['url'];
	$path=$root.$url.'';
	$dir=dirname($path);
	if(!file_exists($dir)){
		mkdir($dir,0777,true);
	}
	if(filesize($path)==0){
		$file=fopen($path,'w+');
		if($file){
			$jsonresult=preg_replace("/\s/","",htmlspecialchars_decode($val['re']));
			fwrite($file,$jsonresult);
			fclose($file);
			echo '<a href='.$path.'>'.$path.'</a> 创建成功 '.'<br>';
		}else {
			echo $path.' 打开失败 '.$dir.'<br>';
			die;
		}
	}
		echo '<a href='.$path.'>'.$path.'</a> 创建成功 '.'<br>';
	}
}


?>