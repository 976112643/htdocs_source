<?php defined('API');
$api_url=ltrim($api_url,'/');
$api_url=ltrim($api_url,'//');
//��ѯ�Ƿ��иýӿ�
$rs = find('SELECT re FROM api WHERE url LIKE "'.$api_url.'";');
if($rs['re']){
	//���Ĭ�Ϸ���ֵ�Թ�����
	header('Content-Type: application/json; charset=utf-8');
	$jsonresult=preg_replace("/\s/","",htmlspecialchars_decode($rs['re']));
	if($_REQUEST['show_mode']){
		header('Content-Type: html; charset=utf-8');
		$params=array('json'=>$jsonresult,'package'=>'','fillEnable'=>'0');
		$jsonresult=http('http://www.bejson.com/json2javapojo/ajax/topojo/',$params,'POST');
	}			
	die($jsonresult);
	
	
}

?>