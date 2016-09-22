<?php

namespace Home\Controller;
use Think\Controller;

class DemoController extends Controller {

	
	public function index() {
         //   WebFm_GetPassword.aspx
            $url='http://210.42.65.150/HBTestWeb/WebFm_Login.aspx';
            $params=array(
                '__VIEWSTATE'=>'/wEPDwUKLTYwMDczMzI0Nw9kFgICAQ9kFgICCQ8QZGQWAWZkZHMCdknPvCDXxSwXtujUBn+Mh22i',
                 '__EVENTVALIDATION'=>'/wEWBQKumqbwDwL7k7GyCgLvi93pBwLi44eGDALrmqmvAnmYb/+/bc34BSRc5wmsK/+GK3Ts',
                'TextID'=>'admin',
                 'TextPassword'=>'admin',
                'BtnLogin'=>'登陆'
            );
	//$result=	http($url,$params,'GET');
        //dump(json_encode($result));
      //  echo $result;
        
        $url='http://210.42.65.150/HBTestWeb/WebFm_GetPassword.aspx';
        $params['__VIEWSTATE']='/wEPDwUJNjQyNTI2MTIwZGSu7V1mFxORVUv8sOt+Q4GAYIq1wA==';
        $params['__EVENTVALIDATION']='/wEWBAKV4al/AvuTsbIKAv2amY8BAueaubwHgSgHyERch2R7KTJC4PZwkZMxWv8=';
        $params['BtnOK']='确定';
        $params['TextID']='1';
        while(true){
            $params['TextID']=$params['TextID'].'1';
           $result=	http($url,$params,'GET');
         //    echo htmlspecialchars($result);
        }
	}
}
