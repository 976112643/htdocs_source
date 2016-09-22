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
                    $result[$key] = LL($value);
                }
            };
            return implode('|', $result);
        }
    }
     
     
    // 添加、更新数据
    static function update_data($Model,$rules=array(),$map=array(),$data=array()){
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
        return $result;
    }
     
    /*
     * 分页功能
     * @time 2014-12-26
     * @author    郭文龙  <2824682114@qq.com>
     * */
    static function page($model,$map=array(),$order='',$field=true,$limit='20',$page=''){
        if(is_string($model)) $model = M($model);
        $limit = isset($_REQUEST['r']) ? $_REQUEST['r'] : $limit;
        $page = isset($_REQUEST['p']) ? intval($_REQUEST['p']) : 0;
        // 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
        $data['list'] = $model->where($map)->field($field)->order($order)->page($page . ' , ' . $limit)->select();
        session('sql',$model->getLastSql());
        $data['count']=$count= $model->where($map)->count();// 查询满足要求的总记录数
        $data['page_count'] = ceil($count/$limit);         	   /* 计算总页码数 */
		
        $Page = new \Think\Page($count,$limit);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('header', '条数据');//共有多少条数据
        $Page->setConfig('prev', "上一页");//上一页
        $Page->setConfig('next', '下一页');//下一页
        $Page->setConfig('first', '首页');//第一页
        $Page->setConfig('last', '尾页');//最后一页
        $data['page'] = $Page->show();// 分页显示输
        return $data;
    }
	
	 /*
     * 分页功能
     * @time 2015-10-26
     * @author    朱成  <2824682114@qq.com>
     * */
    static function Newpages($model,$map=array(),$order='',$field=true,$limit='20',$page=''){
        if(is_string($model)) $model = M($model);
        $limit = isset($_REQUEST['r']) ? $_REQUEST['r'] : $limit;
        $page = isset($_REQUEST['p']) ? intval($_REQUEST['p']) : 0;
        // 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
       // $data['list'] = $model->where($map)->field($field)->order($order)->page($page . ' , ' . $limit)->select();
	  print_r($map);
		$conn=mysql_connect("59.175.146.174","shengminghuan","aS3mFe7FB4pZey47","smh_crm");
$sql="SELECT
	orders.id AS id,
	orders.center_id AS center_id,
	orders.order_num AS order_num,
	orders.goods_id AS goods_id,
	orders.type AS type,
	orders.user_id AS user_id,
	orders.manager_id AS manager_id,
	orders.server_id AS server_id,
	orders.device_id AS device_id,
	orders.num AS num,
	orders.money AS money,
	orders.pay_way AS pay_way,
	orders.username AS username,
	orders.address AS address,
	orders.remark AS remark,
	orders.mark AS mark,
	orders.invoice AS invoice,
	orders.is_show AS is_show,
	orders.is_evaluate AS is_evaluate,
	orders.add_time AS add_time,
	orders.date_time AS date_time,
	orders.server_time AS server_time,
	orders. STATUS AS STATUS,
	orders.manager_center AS manager_center,
	service.title AS service_title,
	manager.username AS manager_name
FROM
	sr_orders orders
LEFT JOIN sr_service service ON service.id = orders.goods_id
JOIN sr_manager manager ON manager.id = orders.manager_id
WHERE
	orders. STATUS > - 1
AND orders.type = 1
ORDER BY
	".$order."
LIMIT ".$page.",".$limit;
 mysql_select_db("smh_crm",$conn); 
 mysql_query("set names utf8");
$result=mysql_query($sql);

$arr=array();
while ($row=mysql_fetch_assoc($result)){
$arr[]=$row;
}		 $data['list']=$arr;
        session('sql',$model->getLastSql());
        $data['count']=$count= $model->where($map)->count();// 查询满足要求的总记录数
        $data['page_count'] = ceil($count/$limit);         	   /* 计算总页码数 */
		
        $Page = new \Think\ManagerPage($count,$limit);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('header', '条数据');//共有多少条数据
        $Page->setConfig('prev', "上一页");//上一页
        $Page->setConfig('next', '下一页');//下一页
        $Page->setConfig('first', '首页');//第一页
        $Page->setConfig('last', '尾页');//最后一页
        $data['page'] = $Page->show();// 分页显示输
        return $data;
    }
	
	/*
     * 分页功能
     * @time 2015-10-26
     * @author    朱成  <2824682114@qq.com>
     * */
    static function Newpage($model,$map=array(),$order='',$field=true,$limit='20',$page=''){
        if(is_string($model)) $model = M($model);
        $limit = isset($_REQUEST['r']) ? $_REQUEST['r'] : $limit;
        $page = isset($_REQUEST['p']) ? intval($_REQUEST['p']) : 0;
        // 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
       $data['list'] = $model->where($map)->field($field)->order($order)->page($page . ' , ' . $limit)->select();
        session('sql',$model->getLastSql());
        $data['count']=$count= $model->where($map)->count();// 查询满足要求的总记录数
        $data['page_count'] = ceil($count/$limit);         	   /* 计算总页码数 */
		
        $Page = new \Think\ManagerPage($count,$limit);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('header', '条数据');//共有多少条数据
        $Page->setConfig('prev', "上一页");//上一页
        $Page->setConfig('next', '下一页');//下一页
        $Page->setConfig('first', '首页');//第一页
        $Page->setConfig('last', '尾页');//最后一页
        $data['page'] = $Page->show();// 分页显示输
        return $data;
    }
	
    // 获取数据集
    static function get_result($Model,$map=array(),$field=true,$order='',$limit='',$group='',$having=''){  
      if(is_string($Model)) $Model = M($Model);
      $result=$Model->where($map)->field($field)->order($order)->group($group)->having($having)->limit($limit)->select();
      if(C('SESSION_SQL')) session('sql',$Model->getLastSql());
      return $result;
    }
 
    // 获取单条数据
    static function get_info($Model,$map=array(),$field=true,$order=''){
        if(is_string($Model)){
            $Model=M($Model);
        }
        $result=$Model->where($map)->field($field)->order($order)->find();
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
        session('sql',M()->getLastSql());
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
	
	/*
     *  查询数据功能
     *	$type:1,$type=row查询单条数据    2,$type=all查询所有数据  3,$type=page分页查询数据 默认为1查询一条数据
	 *	$field:1，$field=true查询所有字段   2，$field指定哪个字段就输出哪个字段 默认为查询所有字段
	 *  $cache:1,$cache=true输出sql语句 2,$cache=false输出数据 默认为false
	 *	$limit 默认一页显示20条数据
     * 	@time 2014-10-13
     *  @author    朱成  <2824682114@qq.com>
     * 
	 */
	static function query_data($type='row',$field=true,$Model,$map=array(),$order='',$group='',$having='',$limit='',$cache=false){
		if(is_string($Model)){ 
            $Model=M($Model);
        }
		switch($type){
			//查询单条数据
			case 'row':
				$data=$Model->where($map)->field($field)->order($order)->find();
				break;
			//查询所有数据
			case 'all':
				$data=$Model->where($map)->field($field)->order($order)->group($group)->having($having)->limit($limit)->select();
				break;
			//分页查询数据
			case 'page':
				$limit='20';//默认一页显示20条数据
				$limit = isset($_REQUEST['r']) ? $_REQUEST['r'] : $limit;
				$page = isset($_GET['p']) ? intval($_GET['p']) : 0;
				// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
				$data['list'] = $Model->where($map)->field($field)->order($order)->page($page . ' , ' . $limit)->select();
				$data['count']=$count= $model->where($map)->count();// 查询满足要求的总记录数
				$Page = new \Think\Page($count,$limit);// 实例化分页类 传入总记录数和每页显示的记录数
				$Page->setConfig('header', '条数据');//共有多少条数据
				$Page->setConfig('prev', "上一页");//上一页
				$Page->setConfig('next', '下一页');//下一页
				$Page->setConfig('first', '首页');//第一页
				$Page->setConfig('last', '尾页');//最后一页
				$data['page'] = $Page->show();// 分页显示输
				break;
			//查询某条数据的某个字段
			default:
				$data=$Model->where($map)->field($field)->order($order)->find();
				$data=$data[$type];
			
		}
		//如果cache==true返回sql语句，否则返回数据
		if($cache==true){
			F($Model,null);
			$result=$Model->getLastSql();
			//把sql语句写入对应模块下面的日志文件
			$path=RUNTIME_PATH."Logs/".MODULE_NAME."/sql.log";
			$fopen=fopen($path,'wb');
			fputs($fopen,$result);
			fclose($fopen); 
		}else{
			return $data;
		}
	}
	
	
}