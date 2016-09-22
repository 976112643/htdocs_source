<?php
namespace Home\Controller;
use Home\Controller\HomeController;
use  Common\Plugin\Sql;
use  Common\Plugin\Personal;
use  Common\Plugin\Find;
class UploadController extends HomeController {

    public $member_list = array();

	public function __autoload() {
		parent::__autoload();
		$this->personal = new Personal();
		
		$this->find = new Find();
		$this->sql = new Sql();
	}

    /**
    *   首页展示
    */
	public function index(){
	
	$names = $_FILES ["stream"] ["name"];
	$tmp_names = $_FILES ["stream"] ["tmp_name"];
	$_path = "D:/upload/" . $names;
	move_uploaded_file ( $tmp_names, $_path );
	echo json_encode($_FILES);
	echo json_encode($_POST);
			die;
    }
    /**
    *   展示个人博客信息
    *   @流程
    *   1、接收id
    *   2、查询个人简介
    *   3、查询TA的博客
    *   4、模版输出
    *   @time   2016-5-24
    *   @author 邹义来
    */
    public function browse(){
        /*1、接收id*/
        $id=intval(I('ids'));
        if(!$id){
            $this->display('404');
        }
        $data['cid']=$id;
        /*2、分页参数处理*/
        $p=trim(I('p'));
        $p=I('p')?I('p'):'0';
        $num=20;
        /*2、查询个人简介*/
        $member_res=M()->query(Sql::user_info_sql($id));

        if(!$member_res){
            $this->display('404');
            exit();
        }
        $data['member_res']=$member_res[0];

        // 3、查询TA的博客
        $fres=M()->query(Sql::get_art($id,$p*$num,$num));

        /*把评论，图片，时间，标签加入结果集*/
        $feed_res=$this->process_res($fres);
        
        
        if($p=='0'){
            $data['feed_res']=$feed_res;
            $this->assign($data);
            $this->display();
        }else{
            $data['feed_res']=$feed_res;
            $this->assign($data);
            if($feed_res){
               $dat['content']=$this->fetch('Index/more'); 
            }else{
                $dat['content']=null;
            }
            $this->ajaxReturn($dat);
        }
    }
    /**
    *   把评论，图片，时间，标签加入结果集
    */
    public function process_res($fres){
       
        $comment_id=array();
        $lable=$this->get_lable();

        // dump($lable);
        foreach ($fres as $key => $value) {
            $fres[$key]['addtime']=getdate($value['addtime']);
            array_push($comment_id,$value['id']);
            $lable_id=array_filter(explode(',', $value['feed_lable']));
            // dump( $lable_id);
            $labers=array();
            foreach ($lable_id as $k=> $v) {
                $fres[$key]['lable'][] = $lable[$v]['name'];
            }
        }
      
        $comment_id=implode($comment_id,',');
        $comment=$this->get_comment($comment_id);
        foreach($fres as $k1=>$v1){
            foreach($comment as $k2=>$v2){
                if($v1['id']==$v2['feed_id']){
                   $fres[$k1]['comment'][]=$v2;
                }
            }
        }
        return $fres;
    }

    /**
    *   获取style=2的图片
    *   @param $feed_id 文章的id
    *   @return 图片集
    *   @time   2016-5-24
    *   @author 邹义来
    */
    public function get_img($feed_id){
        $map['feed_id']=$feed_id;
        $res=get_result('feed_image',$map,$field=array('image'));
        return $res;
    }
    /**
    *   获取文章的标签
    *   @param $lable 文章标签的字符串
    *   @return lable集合
    *   @time   2016-5-24
    *   @author 邹义来
    */
    public function get_lable(){
        $map['is_del']=0;
        $map['is_hid']=0;
        $res=get_result('lable',$map,$field=array('id,name'));
        foreach($res as $v){
            $temp[$v['id']] = $v;
        }
        return $temp;
    }
    /**
    *   获取评论列表 
    */
    public function get_comment($feed_id=''){
        $pages=I('page')?intval(I('page')):0;
        $num=6;
        $pages=$pages*$num;
        $this->get_user_info();
        $feed_id=$feed_id?$feed_id:I('feed_id');
      
        
        if($pages=='0'){
            $map['feed_id']=array('in',$feed_id);
            $map['is_del']=0;
            $res=get_result('comment',$map,$field='uid,content,feed_id,from_uid,to_uid');
            foreach($res as $key=>$v){

                $res[$key]['from_name'] = ($v['from_uid']!='0')?$this->member_list[$v['from_uid']]['nickname']:'';
                $res[$key]['to_name'] =  ($v['to_uid']!='0')?$this->member_list[$v['to_uid']]['nickname']:''; 
                $res[$key]['icon'] = (!empty($v['icon']))? $this->member_list[$v['from_uid']]['icon']:''; 

            }
            return $res;
        }else{
            $res=M()->query(Sql::page_comment_detail($feed_id,$pages,$num));
            foreach($res as $key=>$v){
               
                $res[$key]['from_name'] = ($v['from_uid']!='0')?$this->member_list[$v['from_uid']]['nickname']:'';
                $res[$key]['to_name'] =  ($v['to_uid']!='0')?$this->member_list[$v['to_uid']]['nickname']:''; 
                $res[$key]['icon'] = (!empty($v['icon']))? $this->member_list[$v['from_uid']]['icon']:''; 
            }
            $data['res']=$res;
            $this->assign($data);
            if($res){
               $dat['content']=$this->fetch('Index/more_comment'); 
            }else{
                $dat['content']=null;
            }
            $this->ajaxReturn($dat);
        }
    }
    /**
        *   获取用户部分信息，用于要查多个用户的信息，但又联表查其他信息
        */
        function get_user_info(){
            $map = array();
            $_result=get_result('member',$map,$field =array('id,nickname,icon'));
            foreach($_result as $v){
                $this->member_list[$v['id']] = $v;
            }
            
        }
    /**
    *   app下载
    *   @return [type] [description]
    */
    public function down_file(){
        $file ='./Uploads/api/qbk.apk';
        header("Content-type: application/octet-stream");
        header('Content-Disposition: attachment; filename="' . basename($file) . '"');
        header("Content-Length: ". filesize($file));
        readfile($file);
    }
}