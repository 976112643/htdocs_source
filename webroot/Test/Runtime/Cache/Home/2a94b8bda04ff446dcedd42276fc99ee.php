<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no,minimal-ui' name='viewport'>
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no" />
	
<title>传道</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script>
var _ROOT_='/test';
var _STATIC_='/test/Public/Static';
var _PLUGIN_='/test/Public/Plugins';
var _JS_='/test/Public/Home/js';
var _IMG_='/test/Public/Home/img';
var _CSS_='/test/Public/Home/css';
</script>
<link rel="shortcut icon" href="/test/favicon.ico">
<link rel="stylesheet" type="text/css" href="/test/Public/Static/css/common.css" />
<link rel="stylesheet" type="text/css" href="/test/Public/Home/css/common.css" />
<link rel="stylesheet" type="text/css" href="/test/Public/Static/css/iconfont.css" />
<script type="text/javascript" src="/test/Public/Static/js/common.js"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/test/Public/Static/css/compatibility.css" />
<script type="text/javascript" src="/test/Public/Static/js/ie9.js"></script>
<![endif]-->
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="/test/Public/Static/css/ie6.css" />
<script type="text/javascript" src="/test/Public/Static/js/ie6.js"></script>
<![endif]-->
<!-- 占位符兼容ie10以下版本 -->
<!--[if lt IE 10]>
  <script>
		$(function(){
			$('[placeholder]').focus(function(){
			var input = $(this);
			if(input.val() == input.attr('placeholder')){
			input.removeClass("placeholder");
			input.val('');
			}
			}).blur(function(){
			var input = $(this);
			if(input.val() == '' || input.val() == input.attr('placeholder')){
			input.addClass("placeholder");
			input.val(input.attr('placeholder'));
			}
			}).blur();
		})
  </script>
<![endif]-->

	<link rel="stylesheet" type="text/css" href="/test/Public/Home/css/index.css" />
	<style>
		html, body {
			height: 100%;
			overflow-y: hidden;
		}
		.foot_content {
			border-top-color:transparent;
		}
		.wrap {
			overflow-y: hidden;
			min-width: 1200px;
			width: 100%;
			position: absolute;
			top: 0;
			left: 0;
			z-index: 4;
		}
	</style>



<?php
 if(is_mobile()){ ?>
	<script>

	$(function(){
		$("#now_download").on("click",function(){
		$('body,html').animate({scrollTop: 0},1000);
		})
		$(".er_down").on("click",function(){
		$('body,html').animate({scrollTop: 0},1000);
		})
	})
	

	</script>
	<?php
 }else{ ?>
    <script type="text/javascript" src="/test/Public/Home/js/jquery.mousewheel.js"></script>
    <script>
// var windowH = $(window).height();
var screen_height=$(window).height();
var screen_weight=window.screen.availWidth;
var cur_page_index=0,is_scroll=true,scroll_top=false;

$(function(){
	var footer_height=$(".foot_down").outerHeight()+$(".con_footer").outerHeight();
	var top_total_height=$(".header_nav").outerHeight();

	// $('.js_section').css('height',screen_height+"px");
	$('.wrap').mousewheel(function(event,delta){
		scroll_page($(this),delta,1)
	});
function quanp(){
		$('.js_section').height(screen_height);
		$('.js_section').width(screen_weight);
		setTimeout(function(){
			cur_page_index=0;
			scroll_page($(".wrap"),-1,0);
		},500);
	}
	quanp();

	// 首页底部二维码点击返回顶部
	$(".er_down,#now_download").click(function(){
		$(".wrap").css("margin-top","-82px");
		cur_page_index=0;
	})



function scroll_page(_this,delta,num){
	//判断当前滚屏动画是否结束
	if(is_scroll){
		is_scroll=false;
		//delta的值是负的即-1，那么滚轮就是向下滚动，正的1就是向上
		if(delta>=0){
			if(cur_page_index>0){
				cur_page_index--;
			}else{
				$("#navBar li").removeClass("current");
				$("#navBar li:eq("+cur_page_index+")").removeClass("current");
			}
		}else{
			if(cur_page_index<=$(".wrap .js_section").length){
				cur_page_index++;
			}else{
				$("#navBar li").removeClass("current");
			}
		}
		if(cur_page_index==1){
			$("#navBar li:eq(0)").addClass("current");
		}

		var page_top;
		var page_scroll=cur_page_index-1;
		if(page_scroll<0){
			page_scroll=0;
		}
		if(cur_page_index<1){
			page_top=0;
		}else{
			if(cur_page_index==($(".wrap .js_section").length+1)){
				page_top=screen_height*(page_scroll-1)+top_total_height+footer_height;
				$("#navBar li:eq("+(page_scroll-1)+")").removeClass("current");
			}else{
				page_top=screen_height*page_scroll+top_total_height;
			}
		}
		_this.stop(false,true).animate({"margin-top":-page_top+"px"},800,function(){
			$(".wrap .js_section:eq("+page_scroll+")").addClass("current").siblings('.js_section').removeClass("current");
			is_scroll=true;
		});

		if(cur_page_index>0){
			$("#navBar li:eq("+page_scroll+")").addClass("current").siblings('li').removeClass("current");
		}else{
			$("#navBar li:eq(0)").removeClass("current");
		}

	}
}
})


</script>

    <?php
 } ?>




</head>
<body>
	<div class="wrap">
		
	<!-- 导航代码 -->
	<!-- 头部导航 S-->
	<header class="header_nav">
		<nav class="navbar">
			<div class="container">
				<div class="row">
				<div class="navbar-header pull-left">
					  <a href="#" class="myBrand">
						  <img src="/test/Public/Home/img/logo.png" alt="">
					  </a>
				</div>

				<div class="pull-right"  id="myNavbarCollapse">
			      <ul class="nav navbar-nav navbar-right myNav">
			        <li class="active">
			        	<a href="<?=U("Home/Index/index/ids/$cid")?>">
				        	首页
				        	<span></span>
				        	<i></i>
			        	</a>
			        </li>

			        <li  <?php if(!$cid){echo "style='display:none'";}?> >
			        	<a href="<?=U("Home/Index/browse/ids/$cid")?>">
			        		浏览
			        		<span></span>
			        		<i></i>
			        	</a>
			        </li>
			        <li>
			        	<a href="<?=U("Home/Help/index/ids/$cid")?>">
				        	帮助中心
				        	<span></span>
				        	<i></i>
			        	</a>
			       </li>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			    </div><!-- /.row -->
			</div>
		</nav>
	</header>
	<!-- 头部导航 E-->

	<!-- 头部菜单字体变色js -->
	<script type="text/javascript">
		$(function (){
			var cid="<?=$cid?>";
			var con="/test/Home/Index/index"+"/ids/"+cid+".html";
			$('.myNav li').each(function (){
				var href=$(this).children('a').attr('href');
				if(con==href){
					$('.myNav li').removeClass('active');
					$(this).addClass('active');
				}
			});
		});
	</script>
	

	<!-- 首屏 S -->
	<div class="js_section section section1">
		<div class="container">
			<div class="download_box">
				<h2>传道轻博客，与成功者同行。</h2>
				<p>进入传道1.0的世界，寻找同好，轻松分享科技趣事。与数以万计的达人一起记录分享。</p>
				<div class="linkbtn_group">
					<div class="clearfix iPhone">
						<a href="#" class="download_btn">
							<i class="iconfont">&#xe606;</i>
							App Store 下载
						</a>
					</div>
					<div class="clearfix Android">
						<a href="<?=U('down_file')?>" class="download_btn">
							<i class="iconfont">&#xe602;</i>
							Android 下载
						</a>
					</div>
					<div class="ewm_img text-center">
						<img src="/test/Public/Home/img/User/qr_code.png" alt="" class="img-responsive">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 首屏 E -->
	<!-- 第二屏 S -->
	<div class="js_section section section2">
		<div class="container">
			<h2 class="fz_30 text-center section2_h2">轻巧的移动博客</h2>
			<span class="section2_span"></span>
			<p class="section2_p">通过iPhone及Android版客户端，体验轻巧博客的快速、漂亮。有趣，把你的科技干货告诉小伙伴，和大家一起分享。</p>
			<a href="#" id='now_download' class="section2_a">马上下载&nbsp;&gt;</a>
			<img src="/test/Public/Home/img/User/section2.png" class="section2_img img-responsive" >
		</div>
	</div>
	<!-- 第二屏 E -->
	<!-- 第三屏 S -->
	<div class="js_section section section3 clear">
		<div class="container text-center clear">
			<div class="row clear">
				<div class="col-xs-6">
					<img src="/test/Public/Home/img/User/section3_1.png" class="section3_img img-responsive">
					<h4 class="section3_h4">自动同步</h4>
					<p class="section3_p">方便同步你的内容到QQ空间、微信朋友圈、新浪微博等社交网络，让你的干货信息和小伙伴们一同分享</p>
				</div>
				<div class="col-xs-6">
					<img src="/test/Public/Home/img/User/section3_2.png" class="section3_img img-responsive">
					<h4 class="section3_h4">高质量图片</h4>
					<p class="section3_p">使用无损图片压缩技术，上传图片保留高质量细节，放你手机处于WiFi网络，将自动加载全高清图片</p>
				</div>
				<div class="col-xs-6">
					<img src="/test/Public/Home/img/User/section3_3.png" class="section3_img img-responsive">
					<h4 class="section3_h4">精彩达人</h4>
					<p class="section3_p">寻找兴趣的达人，时刻关注并了解动态信息，即刻互动分享趣事。</p>
				</div>
				<div class="col-xs-6">
					<img src="/test/Public/Home/img/User/section3_4.png" class="section3_img img-responsive">
					<h4 class="section3_h4">推荐算法</h4>
					<p class="section3_p">通过你的喜欢、关注，标签的使用情况，推出更多你敢兴趣的人与内容。</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 第三屏 E -->

	<!-- 第四屏 S -->
	<div class="js_section section section4">
		<div class="container">
			<h2 class="fz_30 text-center section4_h2">信息发掘、分享、交流</h2>
			<span class="section4_span"></span>
		</div>
		<img src="/test/Public/Home/img/User/app_section4_bg.png " class="img-responsive section4_img">
	</div>
	<!-- 第四屏 E -->
	<!-- 第五屏 S -->
	<div class="js_section section section5">
		<div class="container">
			<h2 class="fz_30 text-center section5_h2">搜罗全球有共同爱好的小伙伴</h2>
			<span class="section5_span"></span>
			<p>汇聚了数百万的开源、科技达人。设计师及源代码爱好者，并不断分享更多的干货，无论是软件研发、WEB开发、运维、服务器端开发、方案输出都有精彩的人与内容不断的产出。</p>
			<img src="/test/Public/Home/img/User/section5_img.png" class="img-responsive section5_img">
		</div>
	</div>
	<!-- 第五屏 E -->
	<div class="foot_down text-center clear">
		<div class="container clear">
			<h1>传道-与成功者，同行</h1>
			<ul class="list-unstyled list-inline clear">
				<li><a href="#" class="download_btn iphone_down">
						<i class="iconfont">&#xe606;</i>
							<span>苹果设备下载</span>
					</a>
				</li>
				<li><a href="<?=U('down_file')?>" class="download_btn android_down">
						<i class="iconfont">&#xe602;</i>
							<span>安卓设备下载</span>
					</a>
				</li>
				<li><a href="#" class="download_btn er_down">
						<i class="iconfont">&#xe600;</i>
							<span>扫码下载</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 页脚 S-->
<footer class="con_footer">
	<div class="container">
		<div class="foot_content">
			<div class="right_info">
				<a href="<?=U('Home/Help/index')?>">帮助中心&nbsp;&nbsp;&#124;</a>
				<span>尚软科技2005-<?=date('Y')?>版权所有&nbsp;&nbsp;<?=C('COPY_RIGHT')?></span>
			</div>
		</div>
	</div>
</footer>
<!-- 页脚 E-->	

	<?php
 if(is_mobile()){ ?>
	<link rel="stylesheet" type="text/css" href="/test/Public/Home/css/wap.css" />
	<?php
 }else{ ?>
    <?php
 } ?>

	</div>
</body>
</html>