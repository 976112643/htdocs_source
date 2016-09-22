<?php
namespace Backend\Controller\Functions;
use Backend\Controller\Base\AdminController;

class NoteController extends AdminController
{

    protected $table = 'note';

    public function index ()
    {
        $keywords = I('keywords');
        $order = I('order');
        $status=I('status');
        $map['status'] = array('NEQ',0);
        if($status){
            
        }
        if ($keywords) {
            $map['_complex'] = array('title' => array('like',"%$keywords%"),
                    'descript' => array('like',"%$keywords%"),
                    'content' => array('like',"%$keywords%"),'_logic' => 'or');
            $data['keywords'] = $keywords; // 将本次的关键词显示到页面中去
        }
        $result = $this->page(D($this->table), $map, 'update_time desc');
        $data['result'] = $result;
        $this->assign($data);
        $this->display();
        
        // dump($data);
        // dump(get_keywords());
        // matcher_keywords('A B AC');
        // if (stripos("哈哈,Php", 'php')) {
        // echo '[' . stripos("哈哈,Php", 'php');
        // }
    }

    public function update ()
    {
        $rules = array(array('content','require','内容必须！',1)); // 默认情况下用正则进行
        if($_POST['title']==''){
            $_POST['title']=strip_tags(substr($_POST['content'], 0,100));
            if($_POST['title']==''){
                $_POST['title']='无标题';
            }
        }
        $_POST['from_user_id'] = session("member_id");
        $_POST['content'] = replaceStrImg($_POST['content'], "replace");
        $_POST['type'] = $this->type;
        $result = update_data($this->table, $rules);
        if (is_numeric($result)) {
            $this->success('操作成功！', U('index'));
        } else {
            $this->error($result);
        }
    }
    public function add ()
    {
        if (IS_POST) {
            $this->update();
        } else {
            $this->display('operate');
        }
    }
}