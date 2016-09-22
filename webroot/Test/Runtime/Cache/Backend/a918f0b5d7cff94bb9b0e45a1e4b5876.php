<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<?php  ?>
<?php
 if($title){ $title=$title.' | '.C('SITE_TITLE'); }else{ $title=C('SITE_TITLE'); } if(!$keywords){ $keywords=C('SITE_KEYWORD'); } if(!$description){ $description=C('SITE_DESCRIPTION'); } $member_info=session("member_info"); ?>
<title><?=$title?></title>
<meta name="keywords" content="<?=$keywords?>" />
<meta name="description" content="<?=$description?>" />
<script>
var _ROOT_='/Test';
var _STATIC_='/Test/Public/Static';
var _PLUGIN_='/Test/Public/Plugins';
var _JS_='/Test/Public/Backend/js';
var _IMG_='/Test/Public/Backend/img';
var _CSS_='/Test/Public/Backend/css';
</script>
<link rel="stylesheet" type="text/css" href="/Test/Public/Static/css/common.css" />
<link rel="stylesheet" type="text/css" href="/Test/Public/Plugins/select2/select2.css" />
<link rel="stylesheet" type="text/css" href="/Test/Public/Backend/css/admin.min.css" />
<link rel="stylesheet" type="text/css" href="/Test/Public/Backend/css/backend.css" />
<link rel="stylesheet" type="text/css" href="/Test/Public/Plugins/uploadify/uploadify.css" />
<link rel="stylesheet" type="text/css" href="/Test/Public/Plugins/artdialog/css/ui-dialog.css" />

<script type="text/javascript" src="/Test/Public/Static/js/common.js"></script>
<script type="text/javascript" src="/Test/Public/Backend/js/common.js"></script>
<script type="text/javascript" src="/Test/Public/Plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/Test/Public/Plugins/artdialog/js/dialog-plus-min.js"></script>
<script type="text/javascript" src="/Test/Public/Plugins/my97date/WdatePicker.js"></script>
<script type="text/javascript" src="/Test/Public/Plugins/select2/select2.full.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="/Test/Public/Static/js/ie9.js"></script>
<![endif]-->
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="/Test/Public/Static/css/ie6.css" />
<script type="text/javascript" src="/Test/Public/Static/js/ie6.js"></script>
<![endif]-->


</head>
<body class="login-page">
	<div class="wrapper">
		<div class="login-box">
			<div class="login-logo">
				<a href="http://www.cnsunrun.com" target="_blank"><img src="/Test/Public/Backend/img/login_logo.png"></a>
			</div>
			<!-- /.login-logo -->
			<div class="login-box-body">
				<form action="<?=U('Backend/Base/Public/login')?>" class="login_form" method="post">
					<div class="form-group has-feedback">
						<input type="text" name="username" class="form-control" placeholder="请输入您的账号" />
						<span class="glyphicon glyphicon-user form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="password" class="form-control" placeholder="请输入您的密码" />
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input class="form-control" type="text" name="code" placeholder="输入验证码" />
					</div>
					<div class="form-group has-feedback">
						<img class="verifyimg" src="<?=U('Backend/Base/Public/verify')?>">
					</div>
					<div class="social-auth-links">
						<div class="js_tips alert alert-danger alert-dismissable" style="display: none;">
							<div class="js_tipsContent"></div>
						</div>
						<input type="submit" func="Login" target-form="login_form"
							class="ajax-post btn btn-block btn-primary btn-flat text-center"
							value="登录" />
					</div>
					<!-- /.social-auth-links -->

				</form>
			</div>
			<!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->
	</div>

	<script>
	var verifyimg = $(".verifyimg").attr("src");
	$(".verifyimg").click(function(){
		if( verifyimg.indexOf('?')>0){
			$(".verifyimg").attr("src", verifyimg+'&random='+Math.random());
		}else{
			$(".verifyimg").attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
		}
	});
	$(".reloadverify").click(function(){
		if( verifyimg.indexOf('?')>0){
			$(".verifyimg").attr("src", verifyimg+'&random='+Math.random());
		}else{
			$(".verifyimg").attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
		}
	});
	function ajaxPostCallbackLogin(obj,status,info){
		if(status!=1){
			$(".verifyimg").click();
			$(".js_tipsContent").text(info);
			$(".js_tips").slideDown();
			setTimeout(function(){
				obj.removeClass('disable').attr('autocomplete','off').prop('disabled',false);
				$(".js_tips").slideUp();
			},1500);
			return false;
		}else{
			$(".js_tips").removeClass("alert-danger").addClass("alert-success");
			return true;
		}
	}
</script>
</body>
</html>