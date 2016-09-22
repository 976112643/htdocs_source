<?php

namespace Home\Controller;

use Think\Controller;

class MixController extends Controller {
	/**
	 *
	 * @param $type 0创建字符串字段,1集合字段,2对象字段,3创建类头        	
	 *
	 *
	 */
	protected function generateField($name, $type, $clsName = null) {
		switch ($type) {
			case 0 : // 创建字符串字段
				return " <p>public  String " . $name . ";</p>";
			case 1 : // 集合字段
				return "<p>public  List&lt;" . ucfirst ( $name ) . "&gt; " . $name . ";</p>";
			case 2 : // 对象字段
				if (! $clsName) {
					$clsName = $name;
				}
				return "<p>public  " . ucfirst ( $clsName ) . "  " . $name . ";</p>";
			case 3 : // 创建类头
				
				return "public class " . ucfirst ( $name ) . "{<br\>";
		}
	}
	/**
	 * 处理字段为数字的情况
	 */
	function dealNum($val) {
		if ($val + 0 != 0) {
			return 'Class' . $val;
		}
		return $val;
	}
	/**
	 * 根据object的所有key生成一个MD5指纹
	 */
	protected function classHash($obj) {
		if (is_array ( $obj )) {
			if (count ( $json ) <= 0) {
				return '-1';
			}
			$obj = $obj [0];
		}
		$hash = '';
		foreach ( $obj as $key => $value ) {
			$hash = $hash . $key;
		}
		return md5 ( $hash );
	}
	public function generateBean() {
		$json = $_REQUEST ['json'];
		if (! $json) {
			$this->ajaxReturn ( _FAIL ( null, "参数错误" ) );
		}
		if (strncasecmp ( ltrim ( $json ), "http", 4 ) == 0) {
			$method = 'GET';
			if (key_exists ( 'method', $_REQUEST )) {
				$method = $_REQUEST ['method'];
			}
			$request = splitUrl ( $json );
			$json = http ( $request ['url'], $request ['params'], $method );
			if (! $json) {
				$this->ajaxReturn ( _FAIL ( null, "链接无效" ) );
			}
			echo '<p>'.$json.'</p>';
		}
		
		// $match=preg_match('/[^,:{}\\[\\]0-9.\-+Eaeflnr-u \n\r\t]/',$json);
		
		$json = json_decode ( $json );
		if (! $json) {
			$this->ajaxReturn ( _FAIL ( null, "数据格式不正确" . $json ) );
		}
		if (is_array ( $json )) {
			if (count ( $json ) <= 0) {
				$this->ajaxReturn ( _FAIL () );
			}
			$json = $json [0]; // 最外围是数组的话,取出第一个元素
		}
		
		// 准备一些常量参数
		$ROOT_CLASS = "root";
		$bean = ""; // 生成的实体类的字符串
		
		$classNames = array (
				$ROOT_CLASS
		);
		
		// 已生成的类的名字的数组,不重复创建类
		$pendNames = array ( // 预备生成的类的名字的数组
				$ROOT_CLASS 
		);
		$elements = array (
				$json 
		);
		
		while ( count ( $elements ) != 0 ) {
			$obj = array_shift ( $elements ); // 取出第一个元素
			if (is_object ( $obj )) {
				$name = array_shift ( $pendNames ); // 弹出一个待处理类名
				$bean = $bean . $this->generateField ( $name, 3 ); // 生成该类对应的字段
				foreach ( $obj as $key => $value ) { // 迭代对象中的元素
					if (is_object ( $value )) {
						// $key = $this->dealNum ( $key );
						$fieldName = $key;
						$hash = $this->classHash ( $value ); // 生成hash值
						$clsInfo = contains ( $hash, $classNames );
						if (! $clsInfo) { // 检查该对象名是已存在
						                  // $clsInfo [2] = $clsInfo [2] + 1;
						                  // $fieldName = $clsInfo [0] . $clsInfo [2];//更新
							$temp = contains ( $key, $classNames );
							if ($temp) {
								$temp [2] = $temp [2] + 1;
								$fieldName = $temp [0] . $temp [2]; // 更新
							}
							array_push ( $classNames, array (
									$fieldName,
									$hash,
									1 
							) );
							array_push ( $elements, $value ); // 对象置于队列尾,等待创建
							array_unshift ( $pendNames, $fieldName );
						} else {
							$fieldName = $clsInfo [0];
						}
						
						$bean = $bean . $this->generateField ( $key, 2, $fieldName );
					} else if (is_array ( $value )) {
						if (count ( $json ) != 0) {
							$bean = $bean . $this->generateField ( $key, 1 );
							$hash = $this->classHash ( $value [0] );
							if (! contains ( $hash, $classNames )) {
								array_push ( $elements, $value [0] );
								array_unshift ( $pendNames, $key );
								array_push ( $classNames, array (
										$fieldName,
										$hash,
										1 
								) );
							}
						}
					} else {
						$bean = $bean . $this->generateField ( $key, 0 );
					}
				}
				if ($name !== $ROOT_CLASS) {
					$bean = $bean . '}</p>';
				}
			}
		}
		
		if (contains ( $ROOT_CLASS, $classNames )) {
			$bean = $bean . '}';
		}
		die ( $bean );
	}
}