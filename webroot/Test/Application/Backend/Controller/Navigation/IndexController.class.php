<?php
namespace Backend\Controller\Navigation;
use Backend\Controller\Base\AdminController;
class IndexController extends AdminController {
	protected $table = 'navigation';
	protected $action_filed = 'id,title';
	protected $cache_data = 'navigation_top_cache';
	protected $filed;
	/**
	 * 头部导航列表页
	 * 1、显示所有头部导航（未删除）；
	 * 2、支持状态筛选，和关键字搜索
	 * @author 王淳熙
	 */
	public function index(){
		$map['is_del'] = 0;
		/*获取搜索关键字和搜索状态*/
		$is_hid = I('is_hid');
		/*状态*/
		if(!empty($is_hid)){
			$map['is_hid']=$is_hid;
		}
		$keywords = I ( 'keywords' );
		if ($keywords) {
			$map ['title'] = array ('like',"%$keywords%");
		}
		if($is_hid){
			$map['is_hid'] =intval($is_hid);
		}elseif($is_hid == '0'){
			$map['is_hid'] =0;
		}
		/*查询条件*/
		$map['is_del'] = 0;
		$map['type'] ='top';
		/*获取数据集*/
		$result =$this->page($this->table,$map,'sort desc',true);
		$data['result'] =$result;
		$data['keywords'] = $keywords;
		$data['is_hid'] =$is_hid;
		$this->assign($data);
		/*加载页面*/
		$this->display();
	}
	/**
	 * 导航添加
	 * @author 王淳熙
	 */
	public function add(){
		if(IS_POST){
			$this->update();
		}else{
			$this->display('operate');
		}
	}
	/**
	 * 导航修改
	 * @author 王淳熙
	 */
	public function edit(){
		if(IS_POST){
			$this->update();
		}else{
			$id = I('ids');
			/*判断ID是否为数字*/
			if(is_numeric($id)){
				/*获取指定导航详细信息*/
				$map['id'] = $id;
				$map['is_del'] = 0;
				$info = get_info($this->table,$map,'title,id,url,sort,target');
			}
			$data['info'] =$info;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	 * 添加、修改函数
	 */
	public function update(){
		if(IS_POST){
			/*获取前台传递的添加参数*/
			$id = intval(I('post.id'));
			$_POST['member_id'] = session('member_id');
			if($id == 0){
				$_POST[addtime] = time();
			}
			/*验证参数*/
			$rules = array (
					array('title','require','标题必须填'),
					array('url','require','导航链接必须填'),
			);
			/*添加到数据库*/
			$relus =update_data($this->table, $rules);
			if(is_numeric($relus)){
				F ( $this->cache_data, null );
				$this->success('操作成功',U('index'));
			}else{
				$this->error($relus,U('index'));
			}
		}else{
			$this->error('非法访问',U('index'));
		}
	}
}
