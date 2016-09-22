<?php
/*
 *	Socket发送图片语音类
 * */
namespace Common\Plugin;
use Common\Plugin\Error;


class Socket {
	
	public function __construct() {
		$this->error = new Error();
	}
	
	private $config = array(	
			'maxSize'	 => 3145728,   
			'rootPath'   => 'Chat/', 	
			'savePath_voice'   => 'voice/',    
			'savePath_image'   => 'image/',    
			'saveName'   => array('uniqid',''),    
			'exts_voice'       => array('amr', 'aud', 'mp3'),    
			'exts_image'       => array('jpg', 'gif', 'png', 'jpeg'),    
			'autoSub'    => true,
			'subName'    => array('date','Ymd'),
		);
	
	/*发送语音  待完善*/
	public function send_voice(){	

		return $this->deal_data($this->mkdir('voice'),'voice');
		
	}
	
	/*发送图片  待完善*/
	public function send_image(){
	
		return $this->deal_data($this->mkdir('image'),'image');
		
	}
	
	/*创建目录 并且返回目录的地址*/
	public  function mkdir($type='voice'){
		/*文件所在目录*/
		
		$save_path = 'savePath_'.$type;
		
		$uploadDir = $this->config['rootPath'].$this->config[$save_path];
		
		/*自动创建目录*/
		
		if(!file_exists($uploadDir)){
			$result = mkdir($uploadDir,0777,true);
			if($result){
				return $uploadDir;
			}else{
				return false;
			}
		}else{
			return $uploadDir;
		}
		
	}
	
	/* 数据保存
	 * $parm$path 保存路径
	 * @parm $exts 后缀  $class 验证内容  语音  图像
	 * return 成功返回文件的存储地址  失败返回原因 
	 */
	public function deal_data($path,$class){
		if($path==false) return ;
		ob_start();	
		$rand_string = rand(1000,99999);
		$arg = explode('.',$_FILES['file']['name']);
		/*格式判断*/
		$result = $this->judge_exts($arg[1],$class);

		if(!$result){
			return $this->error->tips(37);
		}
		/*文件大小判断*/
		
		/*-8编码，请使用urldecode解码文件名称 */
		
		$file_string = md5($rand_string.urldecode($arg[0]));
		
		/*并且加密截取16位*/
		
		$file_name = substr($file_string, 0, 16);
		
		/*文件名拼装*/
		$fileName = $file_name.".".$arg[1];
		
		/*移动文件*/
		$result = move_uploaded_file($_FILES["file"]["tmp_name"], $path. $fileName);
		
		/*结果返回 如果成功返回 文件路径*/
		// change_exts(DOMAIN_PATH.__ROOT__.'/'.$path.$fileName);
		if($result){
			$tips = array(
				'status' => '1',
				'msg' => 'ok',
				'info' => DOMAIN_PATH.__ROOT__.'/'.$path.$fileName,
			);
			return $tips;
		}else{
			return $this->error->tips(36);
		}
	}
	
	
	/* 格式转换 amr 转MP3
	 */
	public function change_exts($url){
		/*你amr文件路径*/
		$amr=’’;
	 
		$file=  base64_encode(base64_encode($amr));//对文件路径进行base64加密
		/*接口返回status和f’’参数,f为转换后mp3的文件路径:*/
		$back=file_get_contents("http://api.yizhancms.com/video/index.php?i=1&f=$file");
		$result=(array)json_decode($back);
		
		/*把接口返回的mp3文件重命名为new.mp3保存到当目录*/
		copy($result['f'],"new.mp3");
	}
	
	
	
	/* 后缀名判断 格式的后缀
	 * @parm $exts 后缀  $class 验证内容  语音  图像
	 */
	public function judge_exts($exts,$class){
		$_exts = 'exts_'.$class;
		if(in_array($exts,$this->config[$_exts])){
			return true;
		}else{
			return false;
		}
	}
	
	



	
}