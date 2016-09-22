<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
use Common\Org\Cache;
class MillerController extends AdminController {
	public function __autoload() {
		parent::__autoload();
		$this->url_val();
	}
	/**
	 * 验证邮箱和手机的正则
	 * @需求：
	 * 用于验证邮箱和手机
	 * @流程分析:
	 * 1、根据传入值判断需要验证的是邮箱还是手机
	 * 2、进行验证
	 * 3、返回验证结果
	 * @time 2016-04-07
	 * @author 刘楚雄
	 * @测试方法：
	 * */
	public function mailphone($value,$num){
		//$num为1时进入手机的判断，否则默认判断邮箱
		if($num == 1){
			$yz = preg_match('#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#',$value);
		}else{
			$yz = filter_var($value,FILTER_VALIDATE_EMAIL);
		}
		return $yz;
	}
	/**
	 * 分页方法
	 * @param string $count 数据总数
	 * @param string $num	每页显示数量
	 */
	public function millerpage($count,$num){
		$Page = new \Think\Page ($count,$num); // 实例化分页类 传入总记录数和每页显示的记录数
		$Page->setConfig ( 'header', '条数据' ); // 共有多少条数据
		$Page->setConfig ( 'prev', "上一页" ); // 上一页
		$Page->setConfig ( 'next', '下一页' ); // 下一页
		$Page->setConfig ( 'first', '首页' ); // 第一页
		$Page->setConfig ( 'last', '尾页' ); // 最后一页
		$data = $Page->show (); // 分页显示输出
		return $data;
	}
	/**
	 * 查询数据的sql操作
	* */
	public function query_sqls($sql){//查询数据的sql操作
		$result=M()->query($sql);
		//session('sql',$Model->getLastSql());
		return $result;
	}
	/**
	* 	敏感词验证
	*/
	public function sensitive_judge($str){
		$map['title']=$str;
		$map['is_del']=0;
		$res = get_info('sensitive_words',$map,$field=array('title'));
		
		if($res){
			$this->error("该标签为敏感词");
		}
		return true;
	}
	/**
	 * 获取当前url
	 */
	public function url_val(){
		$url = explode('/',$_SERVER['PHP_SELF']);
		$urls = $url[4].'/'.$url[5].'/'.$url[6].'/'.$url[7];
		//var_dump($urls);die;
	}
	
	/**
	*	修改数据时，验证数据是否存在
	*	@param 	$table	表名
	*	@param 	$map	要验证的条件
	*	@param 	$id		验证的依据
	*	@param 	$errinfo	失败时的错误信息
	*/
	public function check_info_exist($table,$map='',$id='',$errinfo="该信息已存在"){

		$res=get_info($table,$map);
		if($res['id']==$id||!$res){
			return true;
		}else{
			$this->error($errinfo);
		}
	}
}