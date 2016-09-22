<?php

	/*
	 * 计步类
	 * @需求：
	 * 		用于计算计步相关数据
	 * 前台显示
	 * @time 2016/03/15
	 * @author llf
	 * */
namespace Common\Plugin;
use Common\Org\Database;
use Common\Org\Common;
use Common\Org\Cache;

class Walk extends Main{
	
	const  SPEED  = 74;		    //默认速度   米/每分钟
	const  AGE    = 50;			//默认年龄
	const  KCAL   = 0.04988;	//行走消耗   米/大卡
	const  BF     = 0.45;		//步幅身高比 单位米
	
	public $vins_no;			//设备号
	public $sex;				//性别
	public $age;				//年龄
	public $height;				//身高
	// public $heat_avg;			//平均心率值
	public $bf;					//步幅
	public $hb;					//海拔高度
	
	// public $qd;					//运动强度
	
	public $step;				//步数
	public $walk_distance;		//行走里程
	public $walk_time;			//行走时间
	public $walk_consume;		//行走时间
	
	

	public function __construct($vins_no,$step,$hb){
		
        parent::__construct(); 
		//计算改设备在在这段时间内的平均心率
		
		$this->step = intval($step); //步数
		$this->hb   = intval($hb);   //海拔 单位/米
		
		//获取该设备佩戴人的信息(身高、体重、性别、年龄)
		$this->get_wear_info($vins_no);
		
		//计算行走里程
		$this->get_walk_distance();
		
		//计算行走时长
		$this->get_walk_time();
		
		//计算行走消耗
		$this->get_walk_consume();
		
		//判断佩戴人在这段时间内的运动方式
		
	}

	/* 获取该设备佩戴人的信息(身高、体重、性别、年龄) */
	private function get_wear_info($vins_no){

/* 		$map = array(
			'vins_no'=>$vins_no,
		);
		$field = array('height','weight','sex','age');
		$wear_info = get_info('wear',$map,$field); */
		
		$wear_info = array('height'=>'165','weight'=>'54','sex'=>'1','age'=>'22','vins_no'=>'888888888888877');
		
		$this->height	= $wear_info['height'];
		$this->weight 	= $wear_info['weight'];
		$this->sex		= $wear_info['sex'];
		$this->age 		= $wear_info['age'];
		$this->vins_no 	= $wear_info['vins_no'];
		
		$this->bf		= (intval($wear_info['height'])/100) * self::BF;
	} 	
	
	/* 计算行走里程 */
	private function get_walk_distance(){
		
		$this->walk_distance = ($this->bf * $this->step);
	}
	
	/* 计算行走时间 */
	private function get_walk_time(){
		
		$this->walk_time = $this->walk_distance / self::SPEED;
	}
	
	/* 计算行走消耗 */
	private function get_walk_consume(){
		
		$this->walk_consume = $this->walk_distance * self::KCAL  ;
	}
	
	public function show_walk(){
		
		$data = array();
		$data['step']			= strval($this->step);
		$data['walk_distance']	= strval(round($this->walk_distance));
		$data['walk_time'] 		= strval(round($this->walk_time));
		$data['walk_consume']	= strval(round($this->walk_consume,2));
 		
		return $data;
	}
	


} 