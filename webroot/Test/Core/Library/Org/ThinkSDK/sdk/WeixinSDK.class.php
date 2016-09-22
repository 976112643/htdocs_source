<?php
class WeixinSDK extends ThinkOauth{
    /**
     * 获取requestCode的api接口
     * @var string
     */
    protected $GetRequestCodeURL = 'https://open.weixin.qq.com/connect/qrconnect';
    
    /**
     * 获取access_token的api接口
     * @var string
     */
    protected $GetAccessTokenURL = 'https://api.weixin.qq.com/sns/oauth2/access_token';
    
    /**
     * API根路径
     * @var string
     */
    protected $ApiBase = 'https://api.weixin.qq.com/';
	protected $openid ;
    
    public function getRequestCodeURL()
    {
        $this->config();
        $params = array(
                'appid' => $this->AppKey,          
                'redirect_uri'=>$this->Callback,
                'response_type'=>'code',
                'scope'=>'snsapi_login'
        );
        return $this->GetRequestCodeURL . '?' . http_build_query($params);
    }
    
    /**
     * 获取access_token
     * @param string $code 上一步请求到的code
     */
    public function getAccessToken($code, $extend = null){
        $this->config();
        $params = array(
                'appid'     => $this->AppKey,
                'secret'    => $this->AppSecret,
                'grant_type'    => $this->GrantType,
                'code'          => $code,
        );

        $data = $this->http($this->GetAccessTokenURL, $params, 'POST');
        $this->Token = $this->parseToken($data, $extend);
		//dump($this->Token);exit;
        return $this->Token;
    }

    
    /**
     * 组装接口调用参数 并调用接口
     * @param  string $api    微博API
     * @param  string $param  调用API的额外参数
     * @param  string $method HTTP请求方法 默认为GET
     * @return json
     */
    public function call($api, $param = '', $method = 'GET', $multi = false){
		$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$api['access_token']."&openid=".$api['openid']."&lang=zh_CN";
		$res = $this->https_request($url);
		return json_decode($res, true);
    }
     public function https_request($url, $data = null)
	{
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
		if (!empty($data)){
			curl_setopt($curl, CURLOPT_POST, 1);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
		}
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		$output = curl_exec($curl);
		curl_close($curl);
		return $output;
  }
    
    /**
     * 解析access_token方法请求后的返回值
     */
    protected function parseToken($result, $extend)
    {
        $data = json_decode($result,true);
        //parse_str($result, $data);
        if($data['access_token'] && $data['expires_in']){
            $this->Token    = $data;
            $data['openid'] = $this->openid();
            return $data;
        }else{
            throw new Exception("获取微信 ACCESS_TOKEN 出错：{$result}");
		}
    }
    
    /**
     * 获取当前授权应用的openid
     */
    public function openid()
    {
        $data = $this->Token;
		return $data['openid'];
		 if(!empty($data) ){
			 if( $data['openid'] ){
				$this->openid = $data['openid'];
				return $data['openid'];
			 }elseif($this->openid){
				 $data['openid'] = $this->openid;
				 return $data['openid'];
			 }else{
				 exit('没有获取到微信用户ID！');
			 }
		 }
    }
	
}

?>