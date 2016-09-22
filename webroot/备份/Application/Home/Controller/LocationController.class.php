<?php
namespace Home\Controller;
use Home\Controller\MobileController;
class LocationController extends MobileController{
    protected $table="loca";
    protected $msg="";
    public  function  saveLoc(){
        $rules = array(array('device_token','require','无效的设备号！',1)); // 默认情况下用正则进行
        if(!I('device_token')){
             $this->ajaxReturn(_FAIL('无效的设备号！'));
        }
    }
    
}
    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

