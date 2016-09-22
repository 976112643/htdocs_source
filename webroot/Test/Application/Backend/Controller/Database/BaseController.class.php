<?php
namespace Backend\Controller\Database;
use Backend\Controller\Base\AdminController;
class BaseController extends AdminController {
	
    protected function __autoload(){
		parent::__autoload();
    }
}