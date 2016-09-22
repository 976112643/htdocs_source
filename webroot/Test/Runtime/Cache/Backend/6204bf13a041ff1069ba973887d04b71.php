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
								<div class="col-sm-6">
								<form class="forms" action="" method="get">
									<input type="hidden" name="p" value="1">
									<label>
										<input type="search" class="form-control  titles"  name="keywords" value="<?php echo $keywords ?>" size="35" placeholder="请输入问题" />
									</label>
									<label>
										<input type="submit" class="btn btn-info sousuo" value='搜索' />
									</label>
								</form>
								</div>
								<div class="col-md-6 text-right">
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
													style="width: 3%"><label><input
														type="checkbox" class="js_check_all" value=""></label></th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending">id</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending" style="width: 60%">问题</th>
												
												
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending" >排序</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">操作</th>
											</tr>
										</thead>
										<tbody>
											<?php	foreach($res as $k=>$v): ?>
											<tr>
												<td>
													<label>
														<input type="checkbox" class="ids"
														name="ids[]" value="<?php echo $v['id'] ?> ">
													</label>
												</td>
												<td><?=$v['id']?></td>
												<td><?=$v['title']?></td>

												<td><?=$v['sort'] ?></td>
												<td>
													<button class="btn btn-info btn-xs" onclick="show_answer('<?=$v['id']?>');">查看答案</button>
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
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">答案详情</h4>
	      	</div>
	      	<div class="modal-body " style="word-break: break-all;">
	       		
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      	</div>
	    </div>
  	</div>
</div>
<script>
	function show_answer(id){
		$.ajax({
	 		type: "get",
        	url: "/Test/Backend/Help/Faq/ajax_get_answer",
        	dataType : "json",
        	data:{"ids":id},
        	success: function(s){ 
          		$('.modal-body').empty().append(s);
          		$('#myModal').modal();
        	}
		});
	}
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