<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
class BaseController extends AdminController {

	protected function __autoload(){
		parent::__autoload();
	}
}