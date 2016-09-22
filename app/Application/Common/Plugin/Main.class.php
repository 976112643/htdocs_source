<?php

namespace Common\Plugin;
use Think\Controller;

class Main extends Controller{
	function ext_display($data = array(), $tpl = '', $charset = '', $type = '', $content = '', $prefix = ''){
		parent::assign($data);
		parent::display($tpl, $charset, $type, $content, $prefix);
	}
}