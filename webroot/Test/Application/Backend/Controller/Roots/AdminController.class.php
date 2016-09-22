<?php
namespace Backend\Controller\Roots;
use Backend\Controller\Base\MillerController;
class AdminController extends MillerController {
	protected $table = 'admin';//管理员表
	
	/**
	 * 管理员列表
	 * @流程分析：
	 * 1、获取传入的值
	 * 2、若没有值则直接获取所有管理员
	 * @time 2016-04-29
	 * @author 刘楚雄
	 */
	public function index(){
		$search = I();
		$titles = $search['titles'];
		if($titles != ""){
			$p = 1;
		}else{
			$p = $search['p'];
			if($p == ""){
				$p = 1;
			}
		}
		$num = 10;//每页显示条数
		$pages = ($p-1)*$num;
		$res = $this->query_sqls("SELECT sr_admin.id AS id,username,email,mobile,login_time,names,sr_admin.is_hid AS is_hid
FROM sr_admin LEFT JOIN sr_groups ON sr_admin.groups_id = sr_groups.id
WHERE sr_admin.is_del = '0' AND username LIKE '%$titles%' LIMIT $pages,$num");
		$count = $this->query_sqls("SELECT count(sr_admin.id) AS num
FROM sr_admin LEFT JOIN sr_groups ON sr_admin.groups_id = sr_groups.id
WHERE sr_admin.is_del = '0' AND username LIKE '%$titles%'");
		$count = $count[0]['num'];
		$data['result'] = $res;
		$data['titles'] = $titles;
		$data['page'] = $this->millerpage($count,$num);
		$this->assign($data);
		$this->display();
	}

}