<?php
namespace Backend\Controller\Navigation;
use Backend\Controller\Base\AdminController;
class FriendlinkController extends AdminController {
	protected $table = 'friend_link';
	protected $action_filed = 'id,title';
	protected $cache_data = 'friend_link_cache';
	protected $filed='title,type,url,sort,is_hid,addtime';
	/**
	 * 友情链接列表
	 * 1、显示所有友情链接
	 * 2、可以根据关键字、状态搜索
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
		$map['is_del'] = 0;
		/*获取数据集*/
		$result =$this->page($this->table,$map,'sort desc','title,id,url,sort,type,is_hid,addtime');
		$data['result'] =$result;
		$data['keywords'] = $keywords;
		$data['is_hid'] =$is_hid;
		$this->assign($data);
		/*加载页面*/
		$this->display();
	}
	/**
	 * 文字友情链接添加
	 */
	public function we_add(){
		$this->add(1);
	}
	/**
	 * 添加函数
	 * @param 要添加友情链接的种类    $type
	 * @author 王淳熙
	 */
	public function add($type = ''){
		if(IS_POST){
			$this->update();
		}else{
			/*判断添加页面是文字链接，还是图片链接*/
			if($type == 1 || $type == 2){
				$data['type'] = $type ;
				$this->assign($data);
				$this->display('operate');
			}else{
				$this->error('非法访问',U('index'));
			}
		}
	}
	/**
	 * 修改友情链接
	 * 1、修改指定的友情链接
	 * @ author 王淳熙
	 */
	public function edit(){
		/*判断是否是post 提交*/
		if(IS_POST){
			$this->update();
		}else{
			/*获取指定友情链接的详细信息*/
			$id = I('ids');
			if(is_numeric($id)){
				$map['id'] = $id;
				$map['is_del'] = 0;
				$info = get_info($this->table,$map,'title,id,url,sort,type');
			}
			$data['info'] =$info;
			$this->assign($data);
			$this->display('operate');
		}
	}
	/**
	 * 添加修改函数
	 * 1、可以添加文字链接
	 * 2、可以添加图片链接
	 */
	public function update(){
		/*判断是否是POST请求*/
		if(IS_POST){
			/*获取前台传递的添加参数*/
			$id = intval(I('post.id'));
			$logo = I('post.logo');
			//$_POST['member_id'] = session('member_id');
			/*判断是否是添加还是删除*/
			if($id == 0){
				$_POST[addtime] = time();
			}
			/*判断添加的是文字链接还是图片链接*/
			if(empty($_POST['type'])){
				$_POST['type'] = 1;
			}
			$rules = array (
					array('title','require','标题必须填'),
					array('url','require','导航链接必须填'),
			);
			/*添加到数据库*/
			$relus =update_data($this->table, $rules);
			if(is_numeric($relus)){
				if(!empty($logo)){
					multi_file_upload($logo, 'Uploads/Friendlink', $this->table, 'id', $relus, 'logo');
				}
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
