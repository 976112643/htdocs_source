<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

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
<body class="skin-gray sidebar-mini">
	<!-- Main Header -->
<header class="main-header">

	<!-- Logo -->
	<a href="#this" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>尚软</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"> <i>CNSunRun</i>
	</span>
	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a> <a href="#" class="sidebar-toggle topbar-toggle"
			data-toggle="collapse" data-target=".nav_box" role="button"> <span
			class="sr-only">Toggle navigation</span>
		</a>

		<!--navbar left menu-->
		<div class="nav_box">
			<?php
 $cur_path=MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME; $menu_info=getPathByUrl($cur_path); $menu_path=$menu_info['path']; $menuPathArr=explode("-",$menu_path); foreach($menu_result as $row){ if($row["_child"]){ $url=$row["_child"][0]['url']; $url_arr=explode('/',$url); $url_str=$url_arr[0].'/'.$url_arr[1].'/'.$url_arr[2]; }else{ $url=''; } if($row['id']==$menuPathArr[2]){ $class="cur"; $sideMenu=$row['_child']; }else{ $class=""; } ?>
			<a href="<?=U($url)?>" class="<?=$class?>">
				<?=$row['title']?>
			</a>
			<?php
 } ?>
		</div>
		<!--end -->

		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account Menu -->
				<li class="dropdown user user-menu">
					<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <!-- The user image in the navbar--> <img
						src="/Test/Public/Backend/img/user.jpg" class="user-image" alt="User Image" /> <!-- hidden-xs hides the username on small devices so only the image appears. -->
						<span class="hidden-xs">
							<?=session("username")?>
					</span>
				</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header"><img src="/Test/Public/Backend/img/user.jpg"
							class="img-circle" alt="User Image" />
							<p>
								<?=session("username")?>
								-
								<?=$member_info['title']?>
							</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<p>
								上次登陆时间：
								<?=$member_info['last_login_time']?>
							</p>
							<p>
								上次登陆地址：
								<?=getLocationByIp($member_info['last_login_ip'])?>
							</p>
							<p>
								本次登陆时间：
								<?=$member_info['login_time']?>
							</p>
							<p style="margin-bottom: 0;">
								本次登陆地址：
								<?=getLocationByIp($member_info['login_ip'])?>
							</p>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="<?=U('Backend/Base/Security/index')?>"
									class="btn btn-default btn-flat">账号安全</a>
							</div>
							<div class="pull-right">
								<a href="<?=U('Backend/Base/Public/logout')?>"
									class="btn btn-default btn-flat ajax-get">安全退出</a>
							</div>
						</li>
					</ul>
				</li>
				<?php
 ?>
			</ul>
		</div>
	</nav>
</header>
<?php
 ?>
	<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="/Test/Public/Backend/img/user.jpg" class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>
					<?=session('username')?>
				</p>
				<p>
					<?=$member_info['title']?>
				</p>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu">
			<!-- Optionally, you can add icons to the links -->
			<?php
 $group_menu=array(); foreach($sideMenu as $_row){ if($_row['groups']!=''){ $group_menu[$_row['groups']][]=$_row; } } ?>
			<?php
 foreach($group_menu as $k=>$val){ foreach($val as $menu){ if($k==$menu_info['groups'] || $menu['id']==$menuPathArr[3]){ $group_class='active'; $page_title=$k; break; }else{ $group_class=''; } } ?>
			<li class="treeview <?=$group_class?>"><a
				class="one one-hover"><i class="fa fa-th-large"></i><span>
						<?=$k?>
				</span> <i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<?php
 foreach($val as $menu){ if( $menu_info['id']==$menu['id'] || $menu['id']==$menuPathArr[3] ){ $sideClass='cur'; $small_title=$menu['title']; }else{ $sideClass=''; } ?>
					<li class="<?=$sideClass?>"><a href="<?=U($menu['url'])?>"><i
							class="fa fa-align-left"></i>
						<?=$menu['title']?></a></li>
					<?php
 } ?>
				</ul></li>
			<?php
 } ?>
		</ul>
	</section>
</aside>
	<div class="wrapper">
		 <!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 922px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<?=$page_title?>
			<small>
				<?=$small_title?>
			</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="<?=U('/Backend')?>"><i class="fa fa-dashboard"></i>
					首页</a></li>
			<li class="active">
				<?=$page_title?>
			</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<div id="example2_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-8">
								<form class="forms" action="" method="get">
									<input type="hidden" name="p" value='1'>
									<label>
										<select class="tuijian  form-control" name='role_id'>
											<option value=''>默认分组</option>
											<?php $role_id=array(); ?>
											<?php	foreach($role as $k=>$v): ?>
											<?php array_push($role_id,$v['id']); ?>
												<option value="<?=$v['id']?>"
											<?php if($roleid==$v['id']){echo "selected";} ?>><?=$v['title']?></option>
											<?php endforeach; ?>
											<option value='<?=implode(',',$role_id)?>' <?php if($roleid=='0'){echo "selected";} ?>>未分组</option>
											<?php
 ?>
										</select>
									</label>
									<label>
										<select class="tuijian  form-control" name='is_recommend' >
											<option value=''>默认推荐</option>
											<option value='1' <?php if($com=='1'){ echo "selected";} ?>>已推荐</option>
											<option value='0' <?php if($com=='0'){ echo "selected";} ?>>未推荐</option>
										</select>
										
									</label>
									
									<label>
										<input type="hidden" class="searchs"  value="<?php echo $search; ?>" />
					
										<select class="form-control" name="search" style="width:100px;">
											<option value="nickname" <?php if($search=='nickname'){ echo "selected";} ?>>用户名</option>
											<option value="mobile" <?php if($search=='mobile'){ echo "selected";} ?>>手机号</option>
										</select>
									</label>
									<label><input type="search" class="form-control keywords" placeholder="请输入搜索用户名或手机号" name="keywords" value="<?php echo $keywords; ?>" size="35" /></label>
									<label><input type="button" class="btn btn-info  sousuo" value='搜索' /></label>

								</form>
								</div>
								<div class="col-md-4 text-right">
									<?=getTopBtn($menu_info['id'],I('pid'))?>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table id="example2"
										class="table table-bordered table-striped dataTable text-center"
										role="grid" aria-describedby="example2_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="example2" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending "
													style="width: 3%">
													<label><input type="checkbox" class="js_check_all" value=""></label>
												</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending">id</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending"
													style="width: 20%">用户名</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending" >头像</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">手机号</th>
									
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">登录绑定方式</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">是否推荐</th>	
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">分组管理</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending"
													style="width: 30%">操作</th>
											</tr>
										</thead>
										<tbody>
											<?php	foreach($result as $k=>$v): ?>
											<tr>
												<td><label><input type="checkbox" class="ids"
													name="ids[]" value="<?=$v['id'] ?> "></label></td>
												<td class="cid"><?=$v['id']; ?></td>
												<td><?=$v['nickname']; ?></td>
												<td>
													<?php  if($v['icon'] != ""){ if(!empty(parse_url($v['icon'])['scheme'])){ echo "<img width='80' height='80' src='".$v['icon']."'>"; }else{ echo "<img width='80' height='80' src='/Test/".$v['icon']."'>"; } }else{ echo "<img width='80' height='80' src='/Test/Public/Backend/img/nopic.png'>"; } ?>
												</td>
												<td><?php if($v['mobile'] != ""){echo $v['mobile'];}else{ echo '--'; } ?></td>
												
												<td>
													<?php  if($v['mobile'] != ""){echo "手机登录<br>";} if($v['qq_open_id'] != ""){echo "QQ登录<br>";} if($v['sina_open_id'] != ""){echo "新浪登录<br>";} if($v['weixin_open_id'] != ""){echo "微信登录<br>";} ?>
												</td>
												
												<td><?php if($v['is_recommend'] == "1"){echo "已推荐";}else{ echo "未推荐"; } ?></td>
												<td class='fzid'>
													<?php  if($v['role_id']=='0'){ $g="未分组"; }else{ $g=get_role($v['role_id']); if(empty($g)){ $v['role_id']='0'; $g="未分组"; } } echo $g; echo "<input type='hidden' class='hid' value='".$v['role_id']."'>"; ?>
												</td>
												
												<td>
													<input type="hidden" class='recommend' value="<?=$v['is_recommend']?>">
													<?php
 $unique_url=array( 'is_hid'=>array( '1'=>U("enable"), '0'=>U("disable"), ) ); $url=array(); $url[]=$unique_url['is_hid'][$v['is_hid']]; getListBtn($menu_info['id'],$v['id'],$url,I('pid')); getListBtn($menu_info['id'],$v['id'],$unique_url,I('pid'),false); ?>
												</td>
											</tr>
											<?php endforeach; ?>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="pages">
								<?=$page?>
						</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">分组列表选择</h4>
			</div>
			<form class="form-horizontal operate_form" action="<?=U('update_role')?>" method="post">
			<div class="modal-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">分组列表</label>
					<div class="col-sm-10">
						<input type="hidden" name="ids" id="id_list">
						<input type="radio" class='fenzu' name="role_id" value="0" checked>未分组&nbsp;
						<?php	foreach($role as $k=>$v): ?>
						<input type="radio" class='fenzu'  name="role_id" value="<?=$v['id']?>"><?=$v['title']?>&nbsp;
						<?php endforeach; ?>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<input type="submit" class="btn btn-primary ajax-post" target-form="operate_form" value="确认">
			</div>
			</form>
		</div>
	</div>
</div>

<script>
$(function(){
	$(".role").attr("href","#");
	$(".role").click(function (){
		var zid=$(this).prevAll('input').val();
		
		if(zid){
			var id=$(this).parent().prevAll('.cid').html();
			var hid=$(this).parent().prevAll('.fzid').children('.hid').val();
			$('.fenzu').each(function (){
				if($(this).val()==hid){
					$(this).attr('checked',true);
				}
				console.log($(this).val(),hid);
			});
		}else{
			var id_list=new Array();
			$("INPUT[type='checkbox']").each( function() {
				if(this.checked==true){
					id_list.push($(this).val());
				}
			});
			var id=id_list.join(",");
		}
		
		$("#id_list").val(id);
		$("#myModal").modal();
	});
	
	$(".is_recommend").each(function (){
		var com=$(this).prevAll('input').val();
		var z=$(this).attr('href').split('/');
		
		if(com=='1'){
			z[z.indexOf('recommend')+1]=0;
			z=z.join("/");
			$(this).attr("href",z).removeClass('btn-info').addClass('btn-warning').html("取消");
		}
	});
	
	function trim(str){ //删除左右两端的空格
	　　return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	var search = $('.searchs').val();
	if(search == ""){
		search = 'nickname';
	}
	$('.search option[value='+search+']').attr('selected',true);
	$('.sousuo').click(function(){
		keys = trim($('.keywords').val());
		$('.keywords').val(keys);
		$('.forms').submit();
	})
})
</script>

		<!-- Main Footer -->
<footer class="main-footer">
	<!-- To the right -->
	<div class="pull-right hidden-xs">中国开源技术服务提供商</div>
	<!-- Default to the left -->
	<strong>Copyright &copy; 2015 <a
		href="http://www.cnsunrun.com" target="_blank">武汉尚软科技有限公司</a>.
	</strong> All rights reserved.
</footer>
<?php  ?>

<?php  ?>
<div style="display: none;">
	
</div>

	</div>
</body>
</html>