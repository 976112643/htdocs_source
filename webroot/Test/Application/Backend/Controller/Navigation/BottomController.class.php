<?php
namespace Backend\Controller\Navigation;
use Backend\Controller\Base\AdminController;
class BottomController extends AdminController {
	protected $table = 'navigation';
	protected $action_filed = 'id,title';
	protected $cache_data = 'navigation_bottom_cache';
	/**
	 * 底部导航列表页
	 * 1、根据不同的父级显示
	 * 2、标题、状态筛选
	 * @author 王淳熙
	 */
	public function index() {
		/*父级默认为0*/
		$map ['pid'] = 0;
		/*获取父级参数，如果有就显示父级的下级菜单，没有就显示父级为0的菜单*/
		if (I ( 'pid' )) {
			$map ['pid'] = intval ( I ( 'pid' ) );
		}
		/*状态和筛选条件*/
		$is_hid = I ('is_hid');
		$keywords = I ( 'keywords' );
		if ($keywords) {
			$map ['title'] = array ('like',"%$keywords%");
		}	
		if($is_hid){
			$map['is_hid'] =intval($is_hid);
		}elseif($is_hid == '0'){
			$map['is_hid'] =0;
		}
		$map ['type'] = 'bottom';
		$map['is_del'] = 0;
		/*获取数据集*/
		$result = $this->page ( $this->table, $map, 'sort desc',true );
		/*传递参数*/
		$data ['result'] = $result;
		$data['is_hid'] = $is_hid;
		$data['keywords']  = $keywords;
		$this->assign ( $data );
		/*加载页面*/
		$this->display ();
	}
	/*
	 * 添加导航
	 * @author 王淳熙
	 */
	public function add() {
		/*是否是POST提交*/
		if (IS_POST) {
			$this->update ();
		} else {
			/*获取父级*/
			$pid = I ( 'pid' );
			$this->assign ( 'pid', $pid );
			$this->display ( 'operate' );
		}
	}
	/*
	 * 修改指定底部导航
	 * @author 王淳熙
	 */
	public function edit() {
		/*判断是否是POST请求*/
		if (IS_POST) {
			/*调用修改参数*/
			$this->update ();
		} else {
			/*获取页面的详细信息*/
			$id = intval ( I ( 'ids' ) );
			$map ['id'] = $id;
			$data ['info'] = get_info ( $this->table, $map ,true);
			$data ['pid'] = $data ['info'] ['pid'];
			$this->assign ( $data );
			$this->display ( 'operate' );
		}
	}
	/**
	 * 添加、修改参数
	 * @author 王淳熙
	 */
	public function update() {
		if (IS_POST) {
			$id = intval ( I ( 'post.id' ) );
			$url = I ( 'post.url' );
			/* 1、定义数据验证规则 */
			$rules = array (
					array ('title','require','导航名称必须！'), // 默认情况下用正则进行验证
					array('url','require','导航链接必须填'),
			);
			$_POST['member_id'] = session('member_id');
			if($id == 0){
				$_POST['addtime'] = time();
			}
			/* 2、处理固定参数 */
			$_POST ['type'] = 'bottom';
			$pid = intval ( I ( 'post.pid' ) );
			$level=0;
			$path='-0-';
			if($pid>0){
				/*当pid大于0,设置level登记*/
				$parent_info=get_info($this->table,array('id'=>$pid),array('level','path'));
				if($parent_info){
					$level=$parent_info['level']+1;
					$path = $parent_info['path'].$pid.'-';
				}
			}
			$_POST['level']=$level;
			$_POST['path']=$path;
			/* 3、验证、保存数据 */
			$result = update_data ( $this->table, $rules );
			if (is_numeric ( $result )) { 
				/* 4、保存成功 清除数据缓存 */
				F ( $this->cache_data, null );
				/* 5、保存操作记录 */
				action_log ( $this->table, $result, $this->action_filed );
				$this->success ( '操作成功', U ( 'index', array ('pid' => intval ( $pid )) ) );
			} else {
				$this->error ( $result );
			}
		} else {
			$this->success ( '违法操作', U ( 'index' ) );
		}
	}
}
