<?php

    /*
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */

    /**
     * Description of IndexController
     *
     * @author WQ
     */

    namespace App\Controller;

    use Common\Controller\AppController;

    class IndexController extends AppController {

        public function index() {
            if (session('member_id')) {
                $_init = A("Backend/Base/Admin");
                $_init->_initialize;
                $this->meta_title = '首页';
                $map = array('level' => 1, 'status' => 1);
                //$map['id']=array('in','权限');//出错了,可能就需要把权限放进去
                $info = get_info('menu', $map, 'url');

                $this->redirect($info['url']);
            } else {
                $this->display();
            }
        }

    }
    