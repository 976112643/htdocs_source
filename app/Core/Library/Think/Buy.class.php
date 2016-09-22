<?php

/**
 * 通用支付接口类
 * @author yunwuxin<448901948@qq.com>
 */

namespace Think;
class Buy {

		/**
		 * 支付驱动实例
		 * @var Object
		 */
		private $payer;

		/**
		 * 配置参数
		 * @var type 
		 */
		private $config;

		/**
		 * 构造方法，用于构造上传实例
		 * @param string $driver 要使用的支付驱动
		 * @param array  $config 配置
		 */
		public function __construct($driver, $config = array()) {
			/* 配置 */
			$pos = strrpos($driver, '\\');					//找出$driver中'\\'出现的最后位置
			$pos = $pos === false ? 0 : $pos + 1;			//没找出来pos=0,找出了pos+=1
			$apitype = strtolower(substr($driver, $pos));	//取出'最后一个\\'后的玩意,或者全部driver
			$this->config['notify_url'] = U("User/Pay/index", array('apitype' => $apitype, 'method' => 'notify'), false, true);
			$this->config['return_url'] = U("User/Pay/index", array('apitype' => $apitype, 'method' => 'return'), false, true);

			$config = array_merge($this->config, $config);

			/* 设置支付驱动 */
			$class = strpos($driver, '\\') ? $driver : 'Think\\Pay\\Driver\\' . ucfirst(strtolower($driver));
			$this->setDriver($class, $config);
		}
		/*
		 * 账号充值
		 * @time 2015-05-29
		 * @author 
		 */
		public function buildRequestForm(Pay\PayVo $vo) {
			$this->payer->check();
			$check=$vo->getParam();
			if (intval($check)>0) {
				return $this->payer->buildRequestForm($vo);
			} else {
				E($check);
			}
		}

		/**
		 * 设置支付驱动
		 * @param string $class 驱动类名称
		 */
		private function setDriver($class, $config) {
			$this->payer = new $class($config);
			if (!$this->payer) {
					E("不存在支付驱动：{$class}");
			}
		}

		public function __call($method, $arguments) {
			if (method_exists($this, $method)) {
					return call_user_func_array(array(&$this, $method), $arguments);
			} elseif (!empty($this->payer) && $this->payer instanceof Pay\Pay && method_exists($this->payer, $method)) {
					return call_user_func_array(array(&$this->payer, $method), $arguments);
			}
		}

}
