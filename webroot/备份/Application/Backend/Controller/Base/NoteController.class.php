<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
use Think\Model;

class NoteController extends AdminController
{

    protected $table = 'note';
    
    /*
     */
    public function index ()
    {
        $keywords = I('keywords');
        $order = I('order');
        if ($keywords) {
            $map['_complex'] = array(
                    'title' => array('like',"%$keywords%"),
                    'content' => array('like',"%$keywords%"),
                    'keywords'=> array('like',"%$keywords%"),
                    '_logic' => 'or');
            $data['keywords'] = $keywords;//将本次的关键词显示到页面中去
        }
        $map['status'] = array('NEQ',- 1);
        $result = $this->page(D($this->table), $map, 'update_time desc');
        $result = int_to_string($result);
        $data['result'] = $result;
        $this->assign($data);
        $this->display();
        dump($data);
    }
    
    public function add ()
    {
        if (IS_POST) {
//             $keywords = explode(';', I('keywords'));
            $rules = array(array('title','require','关键字不能为空'), // 默认情况下用正则进行验证
                    array('title','','关键字'.I('keywords').'已存在',Model::EXISTS_VALIDATE,'unique',Model::MODEL_BOTH));
            // 默认情况下用正则进行验证
            $result = update_data($this->table, $rules);
            dump($_POST);
            if (is_numeric($result)) {
            	action_log($this->table, $result);
                $this->success('操作成功！', U('index'));
            } else {
                $this->error($result);
            }
            die();
        } else {
            $this->display('operate');
        }
    }

    /**
     */
    public function edit ()
    {
        if (IS_POST) {
            $this->add();
        } else {
            if (I('id')) {
                $map = array('id' => I('id'));
                $info = get_info($this->table, $map);
                $data['info'] = $info;
                $this->assign($data);
                $this->display('operate');
                // dump($data);
            } else {
                $this->error('访问的页面不存在');
            }
        }
    }

    function del ()
    {
        $ids = I('ids');
        if (is_array($ids)) {
            $map['id'] = array('in',$ids);
            action_log($this->table, $ids);
            $result = delete_data($this->table, $map);
            $ids = implode(',', $ids);
            if ($result) {
                $this->success('操作成功', U('index'));
            } else {
                $this->error($result);
            }
        } else {
            $ids = intval($ids);
            action_log($this->table, $ids, $this->action_filed);
            $map['id'] = $ids;
            $result = delete_data($this->table, $map);
            if ($result) {
                // dump($result);die;
                $this->success('操作成功', U('index'));
            } else {
                $this->error($result);
            }
        }
    }
}