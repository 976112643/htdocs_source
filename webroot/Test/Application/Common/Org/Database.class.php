<?php
namespace Common\Org;
    /*
     * 数据库相关处理
     * @time 2015-07-01
     * @author    秦晓武  <525249206@qq.com>
     * */
      
class Database {
    /*
     * 事务封装
     * @time 2015-06-17
     * @param string $modal 模型
     * @param function $action 打包函数，所有封装SQL返回结果合并到RESULT数组内
     * @return string 失败时返回错误信息
     * @author 秦晓武  <525249206@qq.com>
     * */
    static function trans($modal = '',$action = ''){
        if($modal == '' || !is_callable($action)) return false;
        if(is_string($modal)){
            $modal = M($modal);
        }
        $modal->startTrans();
        $result = $action();
         
        if(array_reduce($result,function(&$res,$a){return $res && is_numeric($a);},true)){
            $modal->commit();
            return '';
        }else{
            $modal->rollback();
            foreach($result as $key => $value){
                if(is_numeric($value)){
                    unset($result[$key]);
                    continue;
                }
                else{
                    $result[$key] = $value;
                }
            };
            return implode('|', $result);
        }
    }
     
     
    // 添加、更新数据
    static function update_data($Model, $rules = array(), $map = array(), $data = array()){
        if(is_string($Model)) $Model = M($Model);
        if(is_string($data)) return M()->execute($data);
        if(empty($data)) $data = $_POST;
        $data = $Model->validate($rules)->create($data);
        if(!$data) return $Model->getError(); //数据对象创建错误
        if(empty($map) && (empty($data['id']) || $data['id'] == 0)){
            $data['addtime'] = time();
            $result=$Model->add($data);
        } else {
            $data['updatetime'] = time();
            if(!empty($map)){
                $result = $Model->where($map)->save($data);
            }else{
                $result = $Model->save($data);
            }
            if(is_numeric($result)) $result = $data['id'];
        }
        if(C('SESSION_SQL')) session('sql',$Model->getLastSql());
        return $result;
    }
    
   
    // 获取数据集
    static function get_result($Model,$map=array(),$field=true,$order='',$limit='',$group='',$having=''){  
      if(is_string($Model)) $Model = M($Model);
      $result=$Model->where($map)->field($field)->order($order)->group($group)->having($having)->limit($limit)->select();
      if(C('SESSION_SQL')) session('sql',$Model->getLastSql());
      return $result;
    }
 
    // 获取单条数据
    static function get_info($Model, $map = array(), $field = true, $order = ''){
        if(is_string($Model)){
            $Model = M($Model);
        }
        $result = $Model->where($map)->field($field)->order($order)->find();
        if(C('SESSION_SQL')){
            session('sql',$Model->getLastSql());
        }
        return $result;
    }
    // 添加数据
    static function add_data($Model,$rules=array(),$map=array()){
        if(is_string($Model)){
            $Model  =   M($Model);
        }
        //创建数据对象
        $data = $Model->validate($rules)->create();
        if(!$data){ //数据对象创建错误
            return $Model->getError();
        }
        $res = $Model->add($data);
        if(C('SESSION_SQL')){
            session('sql',$Model->getLastSql());
        }
        return $res;
    }
    // 删除数据
    static function delete_data($Model,$map=array()){
        if(is_string($Model)){
            $Model  =   M($Model);
        }
        $Model->where($map)->delete();
        if(C('SESSION_SQL')){
            session('sql',$Model->getLastSql());
        }
        return true;
    }
    // 统计数据
    static function count_data($Model,$map=array(),$field='id'){
        if(is_string($Model)){
            $Model  =   M($Model);
        }
        $count=$Model->where($map)->count($field);
        if(C('SESSION_SQL')){
            session('sql',$Model->getLastSql());
        }
        return $count;
    }
    /*
     * 查询数据的sql操作
     * */
    static function query_sql($sql){//查询数据的sql操作
        $result=M()->query($sql);
        //session('sql',$Model->getLastSql());
        return $result;
    }
 
    /*
     * 更新和写入数据的sql操作
     * */
    static function execute_sql($sql){//更新和写入数据的sql操作
        $result=M()->execute($sql);
        session('sql',M()->getLastSql());
        return $result;
    }
	
	
	
	static function ext_update($Model,$rules=array(),$map=array(),$data=array()){
		if(is_string($Model)) $Model = M($Model);
        if(is_string($data)) return M()->execute($data);
        if(empty($data)) $data = $_POST;
        $data = $Model->validate($rules)->create($data);
        if(!$data) return $Model->getError(); //数据对象创建错误
        if(empty($map) && (empty($data['id']) || $data['id']==0)){
            $data['add_time']=date("Y-m-d H:i:s");
            $result=$Model->add($data);
        } else {
            $data['update_time']=date("Y-m-d H:i:s");
            if(!empty($map)){
                $result=$Model->where($map)->save($data);
            }else{
                $result=$Model->save($data);
            }
            if(is_numeric($result)) $result=$data['id'];
        }
        if(C('SESSION_SQL')) session('sql',$Model->getLastSql());
		
		//把sql语句写入对应模块下面的日志文件
		//$path=RUNTIME_PATH."Logs/sql/".MODULE_NAME."/sql.log";
		Operate::write_log(CONTROLLER_NAME,session('sql'));
        return $result;
	}
	
	/*
     *  查询数据功能
     *	$type:
	 *		row: 查询单条数据
	 *		all: 查询所有数据  
	 *		page: 分页查询数据
	 *		field: 查询某个字段，参照TP自带方法
	 *		查询方式后加_sql代表调试：row_sql,记录当前查询日志，不影响本次查询；
	 *	$field:1，$field=true查询所有字段   2，$field指定哪个字段就输出哪个字段 默认为查询所有字段
	 *  $cache:1,$cache=true输出sql语句 2,$cache=false输出数据 默认为false
	 *	$limit 默认一页显示10条数据
     * 	@time 2014-10-13
     *  @author    朱成  <2824682114@qq.com>
     * 
	 */
	static function ext_select($type = 'row', $field = true, $Model, $map = array(), $order = '', $group = '', $having = '', $limit = ''){
		if(is_string($Model)) $Model = M($Model);
		/*更改数据模型的链接，如果传了值*/
		$type = explode('_', $type);
		switch($type[0]){
			//查询单条数据
			case 'row':
				$data = $Model->where($map)->field($field)->order($order)->group($group)->having($having)->find();
				break;
			//查询所有数据
			case 'all':
				$data = $Model->where($map)->field($field)->order($order)->group($group)->having($having)->limit($limit)->select();
				break;
			//分页查询数据
			case 'page':
				$limit = $limit ? $limit : 10;//默认一页显示10条数据
				$limit = isset($_REQUEST['r']) ? $_REQUEST['r'] : $limit;
				$page = isset($_GET['p']) ? intval($_GET['p']) : 0;
				// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
				$data['list'] = $Model->where($map)->field($field)->order($order)->page($page . ' , ' . $limit)->select();
				// echo $Model->getLastSql();exit();
				$data['count'] = $Model->where($map)->count();// 查询满足要求的总记录数
				$data ['pages'] = ceil ($data['count']/$limit);
				$Page = new \Think\Page($data['count'],$limit);// 实例化分页类 传入总记录数和每页显示的记录数
				$Page->setConfig('header', '条数据');//共有多少条数据
				$Page->setConfig('prev', '<');//上一页
				$Page->setConfig('next', '>');//下一页
				$Page->setConfig('first', '1');//第一页
				$Page->setConfig('last', '%TOTAL_PAGE%');//最后一页
				$Page->rollPage = 5;
				$Page->lastSuffix = false;
				$data['page'] = $Page->show();// 分页显示输
				$data['page_count'] = $data['count'] ? $Page->totalPages : $data['count'];
				break;
			//查询某个字段
			case 'field':
				$field_1 = $field;
				$field_2 = '';
				if(is_array($field)){
					$field_1 = $field[0];
					$field_2 = $field[1];
				}
				$data=$Model->where($map)->field($field)->order($order)->group($group)->having($having)->getField($field_1,$field_2);
				break;
			default:
				return false;
				$data=$data[$type];
			
		}
		//如果TYPE带_sql，记录日志
		if(isset($type[1]) && $type[1] == 'sql'){
			$result=$Model->getLastSql();
			//把sql语句写入对应模块下面的日志文件
			//$path=RUNTIME_PATH."Logs/sql/".MODULE_NAME."/sql.log";
			Operate::write_log(CONTROLLER_NAME,$result);
			/* 
			$fopen=fopen($path,'wb');
			dump($fopen);
			fputs($fopen,$result);
			fclose($fopen);  */
		}
		return $data;
	}
	
	
	
}