<?php
namespace Common\Plugin;
class Error {
	
	public function tips($type){
		switch($type){
			case 1:
				$tips = array(
					'status' => '0',
					'msg' => '数据异常',
					'info' => array(),
				);
				break;
			case 2:
				$tips = array(
					'status' => '0',
					'msg' => '操作失败',
					'info' => array(),
				);
				break;
			case 3:
				$tips = array(
					'status' => '1',
					'msg' => '操作成功！',
					'info' => array(),
				);
				break;
			case 4:
				$tips = array(
					'status' => '0',
					'msg' => '你已经赞过',
					'info' => array(),
				);
				break;
			case 5:
				$tips = array(
					'status' => '0',
					'msg' => '你已经推荐',
					'info' => array(),
				);
				break;
			case 6:
				$tips = array(
					'status' => '1',
					'msg' => '评论成功',
					'info' => array(),
				);
				break;
			case 7:
				$tips = array(
					'status' => '0',
					'msg' => '评论失败',
					'info' => array(),
				);
				break;
			case 8:
				$tips = array(
					'status' => '1',
					'msg' => '回复成功',
					'info' => array(),
				);
				break;
			case 9:
				$tips = array(
					'status' => '0',
					'msg' => '回复失败',
					'info' => array(),
				);
				break;
			case 10:
				$tips = array(
					'status' => '0',
					'msg' => '不能关注自己',
					'info' => array(),
				);
				break;
			case 11:
				$tips = array(
					'status' => '0',
					'msg' => '被关注的用户不存在',
					'info' => array(),
				);
				break;
			case 12:
				$tips = array(
					'status' => '0',
					'msg' => '根据对方设置，您无法关注TA',
					'info' => array(),
				);
				break;
			case 13:
				$tips = array(
					'status' => '0',
					'msg' => '您已把对方加入黑名单',
					'info' => array(),
				);
				break;
			case 14:
				$tips = array(
					'status' => '1',
					'msg' => '关注成功',
					'info' => array(),
				);
				break;
			case 15:
				$tips = array(
					'status' => '0',
					'msg' => '关注失败',
					'info' => array(),
				);
				break;
			case 16:
				$tips = array(
					'status' => '0',
					'msg' => '已关注TA',
					'info' => array(),
				);
				break;
			case 17:
				$tips = array(
					'status' => '0',
					'msg' => '取消失败',
					'info' => array(),
				);
				break;
			case 18:
				$tips = array(
					'status' => '1',
					'msg' => '取消成功',
					'info' => array(),
				);
				break;
			case 19:
				$tips = array(
					'status' => '0',
					'msg' => '手机号码未做修改',
					'info' => array(),
				);
				break;
			case 20:
				$tips = array(
					'status' => '0',
					'msg' => '手机号码格式不正确',
					'info' => array(),
				);
				break;
			case 21:
				$tips = array(
					'status' => '1',
					'msg' => '回复成功',
					'info' => array(),
				);
				break;
			case 22:
				$tips = array(
					'status' => '0',
					'msg' => '回复失败',
					'info' => array(),
				);
				break;
			case 23:
				$tips = array(
					'status' => '0',
					'msg' => '文章不存在或已删除',
					'info' => array(),
				);
				break;
			case 24:
				$tips = array(
					'status' => '0',
					'msg' => '呀~出错了',
					'info' => array(),
				);
				break;
			case 25:
				$tips = array(
					'status' => '1',
					'msg' => '提交成功',
					'info' => array(),
				);
				break;
			case 26:
				$tips = array(
					'status' => '-1',
					'msg' => '请登录',
					'info' => array(),
				);
				break;
			case 27:
				$tips = array(
					'status' => '0',
					'msg' => '您已举报该文章',
					'info' => array(),
				);
				break;
			case 28:
				$tips = array(
					'status' => '0',
					'msg' => '评论不存在或者已删除',
					'info' => array(),
				);
				break;
			case 29:
				$tips = array(
					'status' => '0',
					'msg' => '没有删除该评论的权限',
					'info' => array(),
				);
				break;
			case 30:
				$tips = array(
					'status' => '1',
					'msg' => '删除成功',
					'info' => array(),
				);
				break;
			case 31:
				$tips = array(
					'status' => '0',
					'msg' => '数据链接异常！',
					'info' =>  array(),
				);
				break;
			case 32:
				$tips = array(
					'status' => '1',
					'msg' => '转载成功',
					'info' =>  array(),
				);
				break;
			case 33:
				$tips = array(
					'status' => '0',
					'msg' => '转载失败',
					'info' =>  array(),
				);
				break;
			case 34:
				$tips = array(
					'status' => '0',
					'msg' => '该文章您已屏蔽',
					'info' =>  array(),
				);
				break;
			case 35:
				$tips = array(
					'status' => '1',
					'msg' => '文章分享成功（这个功能后续做现在只是给出接口）',
					'info' =>  array(),
				);
				break;
			case 36:
				$tips = array(
					'status' => '0',
					'msg' => '发送失败',
					'info' => array(),
				);
				break;
			case 37:
				$tips = array(
					'status' => '0',
					'msg' => '文件格式不支持',
					'info' => array(),
				);
				break;
			default:
				$tips = array(
					'status' => '0',
					'msg' => '参数错误！',
					'info' =>array(),
				);
		}
		
		return $tips;
	}
	
	
}