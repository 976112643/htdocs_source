<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
<?php  ?>
<?php
 if($title){ $title=$title.' | '.C('SITE_TITLE'); }else{ $title=C('SITE_TITLE'); } if(!$keywords){ $keywords=C('SITE_KEYWORD'); } if(!$description){ $description=C('SITE_DESCRIPTION'); } $get_param=$_GET; $_GET=null; foreach ($get_param as $key => $val) { $_GET[strtolower($key)]=$val; } if(I("get.extension")){ cookie("register_extension_link",I("get.extension")); } ?>
<title><?=$title?></title>
<meta name="keywords" content="<?=$keywords?>" /> 
<meta name="description" content="<?=$description?>" />
<script>
var _ROOT_='/webroot';
var _STATIC_='/webroot/Public/Static';
var _PLUGIN_='/webroot/Public/Plugins';
var _JS_='/webroot/Public/Backend/js';
var _IMG_='/webroot/Public/Backend/img';
var _CSS_='/webroot/Public/Backend/css';
</script>
<link rel="stylesheet" type="text/css" href="/webroot/Public/Backend/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/webroot/Public/Backend/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/webroot/Public/Backend/css/admin.min.css" />
<link rel="stylesheet" type="text/css" href="/webroot/Public/Backend/css/backend.css" />
<link rel="stylesheet" type="text/css" href="/webroot/Public/Plugins/uploadify/uploadify.css" />
<link rel="stylesheet" type="text/css" href="/webroot/Public/Plugins/artdialog/css/ui-dialog.css" />
<script type="text/javascript" src="/webroot/Public/Backend/js/jquery.min.js"></script>
<script type="text/javascript" src="/webroot/Public/Backend/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/webroot/Public/Backend/js/app.min.js"></script>
<script type="text/javascript" src="/webroot/Public/Static/js/common.js"></script>
<script type="text/javascript" src="/webroot/Public/Backend/js/common.js"></script>
<script type="text/javascript" src="/webroot/Public/Plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/webroot/Public/Plugins/artdialog/js/dialog-plus-min.js"></script>
<script type="text/javascript" src="/webroot/Public/Plugins/my97date/WdatePicker.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="/webroot/Public/Backend/js/html5shiv.min.js"></script>
  <script type="text/javascript" src="/webroot/Public/Backend/js/respond.min.js"></script>
<![endif]-->
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="/webroot/Public/Backend/css/fix-ie.css" />
<script type="text/javascript" src="/webroot/Public/Backend/js/bootstrap-ie.js"></script>
<link rel="stylesheet" type="text/css" href="/webroot/Public/Backend/css/bootstrap-ie6.min.css" />
<![endif]-->
 
</head>
<body class="skin-gray sidebar-mini">
	<script type="text/javascript" src="/webroot/Public/Plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/webroot/Public/Plugins/ueditor/ueditor.all.min.js"></script>

<script type="text/javascript">
var config={
	serverUrl:"<?=U('ueditor')?>",
};
</script>
	<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="#this" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>N邦</b></span>
      <!-- logo for regular state and mobile devices -->
      <!-- <span class="logo-lg">
        <i>CNSunRun</i>
      </span> -->
	  
	  <!-- <span class="logo_pic">
	  <img src="/webroot/Public/Home/img/sc_template/logo.png"/>
	  </span> -->
	  <span class="logo-lg">
        <i>N邦翻译</i>
      </span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
      <a href="#" class="sidebar-toggle topbar-toggle" data-toggle="collapse" data-target=".nav_box" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
      <!--navbar left menu-->
      <div class="nav_box">
      <?php
 foreach(session('menu_result') as $key=>$row){ $a['title']=$row['title']; $a['url']=$row['_child'][0]['url']; $header_url[]=$a; if(!$need_display){ foreach($row['_child'] as $k=> $val){ if(strstr(trim( '/webroot/Backend/Demo/index/buttons.html','.html'),"/webroot/".$val['url']) && !empty($val['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['groups']; $page_small=$val['title']; $a=array('添加','启用','禁用','删除'); foreach($a as $aval){ foreach($val['_child'] as $v){ if($aval==$v['title']){ $page_child[]=$v; } } } break; } foreach($val['_child'] as $v){ if(strstr(trim( '/webroot/Backend/Demo/index/buttons.html','.html'),"/webroot/".$v['url']) && !empty($v['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['title']; $page_small=$v['title']; break; } } if($need_display){ break; } } } } foreach($header_url as $key=>$row){ ?>
      	<a href="<?=U($row['url'])?>" class="<?=$key==$need_display?'cur':''?>"  ><?=$row['title']?></a>
      	
      	<?php
 } ?>
      </div>
      <!--end -->
      
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

		          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
           
            <ul class="dropdown-menu">
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li><!-- /.messages-menu -->


    
          <!-- Notifications Menu -->
          
          <!-- Tasks Menu -->
         
          <!-- User Account Menu -->
          <li class="dropdown user user-menu111">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle111" data-toggle="dropdown111">
              <!-- The user image in the navbar-->
              <!-- <img src="/webroot/Public/Backend/img/user.jpg" class="user-image" alt="User Image"/> -->
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs"><?=session('username')?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              
              <!-- Menu Body -->
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  
                </div>
                <div class="pull-right">
                  <a href="<?=U('Backend/Base/Public/logout')?>" class="btn btn-default btn-flat ajax-get">安全退出</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
		  <a href="<?=U('Backend/Base/Public/logout')?>" class="ajax-get">安全退出</a>
            <!-- <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> -->
          </li>
        </ul>
      </div>
    </nav>
</header>
<!-- Control Sidebar -->      
<aside class="control-sidebar control-sidebar-dark">                
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class='control-sidebar-menu'>
          <li>
            <a href='javascript::;'>
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>              
        </ul><!-- /.control-sidebar-menu -->
    
        <h3 class="control-sidebar-heading">Tasks Progress</h3> 
        <ul class='control-sidebar-menu'>
          <li>
            <a href='javascript::;'>               
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>
              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>                                    
            </a>
          </li>                         
        </ul><!-- /.control-sidebar-menu -->         
    
      </div><!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">            
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>
          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked />
            </label>
            <p>
              Some information about this general settings option
            </p>
          </div><!-- /.form-group -->
        </form>
      </div><!-- /.tab-pane -->
    </div>
</aside>
	<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<section class="sidebar">
		<br />
		<!-- Sidebar user panel (optional) -->
		<!-- <div class="user-panel">
				<div class="pull-left image">
					<img src="/webroot/Public/Backend/img/user.jpg" class="img-circle" alt="User Image" />
				</div>
				<div class="pull-left info">
					<p><?=session('username')?></p> -->
		<!-- Status -->
		<!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
		<!-- 	</div>
			</div> -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu">
			<!-- Optionally, you can add icons to the links -->
			<?php
 $group_menu=array(); foreach($menu_result[$need_display]['_child'] as $_row){ if($_row['groups']!=''){ $group_menu[$_row['groups']][]=$_row; } } foreach($group_menu as $k=>$v){ ?>
			<li class="treeview <?=$k==$group_class?'active':''?>"><a class="one one-hover"><i
					class='fa fa-th-large'></i> <span>
						<?=$k?>
				</span> <i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<?php
 foreach($v as $menu){ ?>

					<li class="<?=$menu['title']==$title_class?'cur':''?>"><a href="<?=U($menu['url'])?>"><i
							class="fa  fa-align-left"></i>
						<?=$menu['title']?></a></li>

					<?php
 if($iframe_src==''){ $iframe_src=U($menu['url']); } } ?>
				</ul></li>
			<?php
 } ?>
		</ul>
		<script>
			$(function() {
				$(".treeview-menu li").click(function() {
					$(this).addClass("cur").siblings(this).removeClass("cur");
				});
			});
		</script>
		<!-- /.sidebar-menu -->
	</section>
</aside>
	<div class="wrapper">
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>
						Buttons
						<small>Control panel</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li><a href="#">UI</a></li>
						<li class="active">Buttons</li>
					</ol>
				</section>

				<!-- Main content -->
				<section class="content">

					<div class="row">
						<div class="col-md-12">
							<div class="box box-primary">
								<div class="box-header">
									<i class="fa fa-edit"></i>
									<h3 class="box-title">Buttons</h3>
								</div>
								<div class="box-body pad table-responsive">
									<p>Various types of buttons. Using the base class <code>.btn</code></p>
									<table class="table table-bordered text-center">
										<tbody>
											<tr>
												<th>Normal</th>
												<th>Large <code>.btn-lg</code></th>
												<th>Small <code>.btn-sm</code></th>
												<th>X-Small <code>.btn-xs</code></th>
												<th>Flat <code>.btn-flat</code></th>
												<th>Disabled <code>.disabled</code></th>
											</tr>
											<tr>
												<td><button class="btn btn-block btn-default">Default</button></td>
												<td><button class="btn btn-block btn-default btn-lg">Default</button></td>
												<td><button class="btn btn-block btn-default btn-sm">Default</button></td>
												<td><button class="btn btn-block btn-default btn-xs">Default</button></td>
												<td><button class="btn btn-block btn-default btn-flat">Default</button></td>
												<td><button class="btn btn-block btn-default disabled">Default</button></td>
											</tr>
											<tr>
												<td><button class="btn btn-block btn-primary">Primary</button></td>
												<td><button class="btn btn-block btn-primary btn-lg">Primary</button></td>
												<td><button class="btn btn-block btn-primary btn-sm">Primary</button></td>
												<td><button class="btn btn-block btn-primary btn-xs">Primary</button></td>
												<td><button class="btn btn-block btn-primary btn-flat">Primary</button></td>
												<td><button class="btn btn-block btn-primary disabled">Primary</button></td>
											</tr>
											<tr>
												<td><button class="btn btn-block btn-success">Success</button></td>
												<td><button class="btn btn-block btn-success btn-lg">Success</button></td>
												<td><button class="btn btn-block btn-success btn-sm">Success</button></td>
												<td><button class="btn btn-block btn-success btn-xs">Success</button></td>
												<td><button class="btn btn-block btn-success btn-flat">Success</button></td>
												<td><button class="btn btn-block btn-success disabled">Success</button></td>
											</tr>
											<tr>
												<td><button class="btn btn-block btn-info">Info</button></td>
												<td><button class="btn btn-block btn-info btn-lg">Info</button></td>
												<td><button class="btn btn-block btn-info btn-sm">Info</button></td>
												<td><button class="btn btn-block btn-info btn-xs">Info</button></td>
												<td><button class="btn btn-block btn-info btn-flat">Info</button></td>
												<td><button class="btn btn-block btn-info disabled">Info</button></td>
											</tr>
											<tr>
												<td><button class="btn btn-block btn-danger">Danger</button></td>
												<td><button class="btn btn-block btn-danger btn-lg">Danger</button></td>
												<td><button class="btn btn-block btn-danger btn-sm">Danger</button></td>
												<td><button class="btn btn-block btn-danger btn-xs">Danger</button></td>
												<td><button class="btn btn-block btn-danger btn-flat">Danger</button></td>
												<td><button class="btn btn-block btn-danger disabled">Danger</button></td>
											</tr>
											<tr>
												<td><button class="btn btn-block btn-warning">Warning</button></td>
												<td><button class="btn btn-block btn-warning btn-lg">Warning</button></td>
												<td><button class="btn btn-block btn-warning btn-sm">Warning</button></td>
												<td><button class="btn btn-block btn-warning btn-xs">Warning</button></td>
												<td><button class="btn btn-block btn-warning btn-flat">Warning</button></td>
												<td><button class="btn btn-block btn-warning disabled">Warning</button></td>
											</tr>
										</tbody>
									</table>
								</div><!-- /.box -->
							</div>
						</div><!-- /.col -->
					</div><!-- ./row -->
					<div class="row">
						<div class="col-md-6">
							<!-- Block buttons -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Block Buttons</h3>
								</div>
								<div class="box-body">
									<button class="btn btn-default btn-block">.btn-block</button>
									<button class="btn btn-default btn-block btn-flat">.btn-block .btn-flat</button>
									<button class="btn btn-default btn-block btn-sm">.btn-block .btn-sm</button>
								</div>
							</div><!-- /.box -->

							<!-- Horizontal grouping -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Horizontal Button Group</h3>
								</div>
								<div class="box-body table-responsive pad">
									<p>
										Horizontal button groups are easy to create with bootstrap. Just add your buttons
										inside <code>&lt;div class="btn-group"&gt;&lt;/div&gt;</code>
									</p>

									<table class="table table-bordered">
										<tbody>
											<tr>
												<th>Button</th>
												<th>Icons</th>
												<th>Flat</th>
												<th>Dropdown</th>
											</tr>
											<!-- Default -->
											<tr>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-default">Left</button>
														<button type="button" class="btn btn-default">Middle</button>
														<button type="button" class="btn btn-default">Right</button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-default"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-default"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-default"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-default btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-default btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-default btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-default">1</button>
														<button type="button" class="btn btn-default">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr><!-- ./default -->
											<!-- Info -->
											<tr>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-info">Left</button>
														<button type="button" class="btn btn-info">Middle</button>
														<button type="button" class="btn btn-info">Right</button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-info"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-info"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-info"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-info btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-info btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-info btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-info">1</button>
														<button type="button" class="btn btn-info">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /. info -->
											<!-- /.danger -->
											<tr>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-danger">Left</button>
														<button type="button" class="btn btn-danger">Middle</button>
														<button type="button" class="btn btn-danger">Right</button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-danger"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-danger"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-danger"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-danger btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-danger btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-danger btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-danger">1</button>
														<button type="button" class="btn btn-danger">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /.danger -->
											<!-- warning -->
											<tr>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-warning">Left</button>
														<button type="button" class="btn btn-warning">Middle</button>
														<button type="button" class="btn btn-warning">Right</button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-warning"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-warning"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-warning"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-warning btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-warning btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-warning btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-warning">1</button>
														<button type="button" class="btn btn-warning">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /.warning -->
											<!-- success -->
											<tr>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-success">Left</button>
														<button type="button" class="btn btn-success">Middle</button>
														<button type="button" class="btn btn-success">Right</button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-success"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-success"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-success"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-success btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-success btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-success btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-success">1</button>
														<button type="button" class="btn btn-success">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /.success -->
										</tbody>
									</table>
								</div>
							</div><!-- /.box -->

							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Button Addon</h3>
								</div>
								<div class="box-body">
									<p>With dropdown</p>
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Action <span class="fa fa-caret-down"></span></button>
											<ul class="dropdown-menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div><!-- /btn-group -->
										<input type="text" class="form-control">
									</div><!-- /input-group -->
									<p>Normal</p>
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-danger">Action</button>
										</div><!-- /btn-group -->
										<input type="text" class="form-control">
									</div><!-- /input-group -->
									<p>Flat</p>
									<div class="input-group margin">
										<input type="text" class="form-control">
										<span class="input-group-btn">
											<button class="btn btn-info btn-flat" type="button">Go!</button>
										</span>
									</div><!-- /input-group -->
								</div><!-- /.box-body -->
							</div><!-- /.box -->
							<!-- split buttons box -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Split buttons</h3>
								</div>
								<div class="box-body">
									<!-- Split button -->
									<p>Normal split buttons:</p>
									<div class="margin">
										<div class="btn-group">
											<button type="button" class="btn btn-default">Action</button>
											<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-info">Action</button>
											<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-danger">Action</button>
											<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-success">Action</button>
											<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-warning">Action</button>
											<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
									</div>
									<!-- flat split buttons -->
									<p>Flat split buttons:</p>
									<div class="margin">
										<div class="btn-group">
											<button type="button" class="btn btn-default btn-flat">Action</button>
											<button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-info btn-flat">Action</button>
											<button type="button" class="btn btn-info btn-flat dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-danger btn-flat">Action</button>
											<button type="button" class="btn btn-danger btn-flat dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-success btn-flat">Action</button>
											<button type="button" class="btn btn-success btn-flat dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-warning btn-flat">Action</button>
											<button type="button" class="btn btn-warning btn-flat dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
											</ul>
										</div>
									</div>
								</div><!-- /.box-body -->
							</div><!-- end split buttons box -->

							<!-- social buttons -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Social Buttons (By <a href="https://github.com/lipis/bootstrap-social">Lipis</a>)</h3>
								</div>
								<div class="box-body">
									<a class="btn btn-block btn-social btn-bitbucket">
										<i class="fa fa-bitbucket"></i> Sign in with Bitbucket
									</a>
									<a class="btn btn-block btn-social btn-dropbox">
										<i class="fa fa-dropbox"></i> Sign in with Dropbox
									</a>
									<a class="btn btn-block btn-social btn-facebook">
										<i class="fa fa-facebook"></i> Sign in with Facebook
									</a>
									<a class="btn btn-block btn-social btn-flickr">
										<i class="fa fa-flickr"></i> Sign in with Flickr
									</a>
									<a class="btn btn-block btn-social btn-foursquare">
										<i class="fa fa-foursquare"></i> Sign in with Foursquare
									</a>
									<a class="btn btn-block btn-social btn-github">
										<i class="fa fa-github"></i> Sign in with GitHub
									</a>
									<a class="btn btn-block btn-social btn-google-plus">
										<i class="fa fa-google-plus"></i> Sign in with Google
									</a>
									<a class="btn btn-block btn-social btn-instagram">
										<i class="fa fa-instagram"></i> Sign in with Instagram
									</a>
									<a class="btn btn-block btn-social btn-linkedin">
										<i class="fa fa-linkedin"></i> Sign in with LinkedIn
									</a>
									<a class="btn btn-block btn-social btn-tumblr">
										<i class="fa fa-tumblr"></i> Sign in with Tumblr
									</a>
									<a class="btn btn-block btn-social btn-twitter">
										<i class="fa fa-twitter"></i> Sign in with Twitter
									</a>
									<a class="btn btn-block btn-social btn-vk">
										<i class="fa fa-vk"></i> Sign in with VK
									</a>
									<br>
									<div class="text-center">
										<a class="btn btn-social-icon btn-bitbucket"><i class="fa fa-bitbucket"></i></a>
										<a class="btn btn-social-icon btn-dropbox"><i class="fa fa-dropbox"></i></a>
										<a class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
										<a class="btn btn-social-icon btn-flickr"><i class="fa fa-flickr"></i></a>
										<a class="btn btn-social-icon btn-foursquare"><i class="fa fa-foursquare"></i></a>
										<a class="btn btn-social-icon btn-github"><i class="fa fa-github"></i></a>
										<a class="btn btn-social-icon btn-google-plus"><i class="fa fa-google-plus"></i></a>
										<a class="btn btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
										<a class="btn btn-social-icon btn-linkedin"><i class="fa fa-linkedin"></i></a>
										<a class="btn btn-social-icon btn-tumblr"><i class="fa fa-tumblr"></i></a>
										<a class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
										<a class="btn btn-social-icon btn-vk"><i class="fa fa-vk"></i></a>
									</div>
								</div>
							</div><!-- /.box -->

						</div><!-- /.col -->
						<div class="col-md-6">
							<!-- Application buttons -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Application Buttons</h3>
								</div>
								<div class="box-body">
									<p>Add the classes <code>.btn.btn-app</code> to an <code>&lt;a&gt;</code> tag to achieve the following:</p>
									<a class="btn btn-app">
										<i class="fa fa-edit"></i> Edit
									</a>
									<a class="btn btn-app">
										<i class="fa fa-play"></i> Play
									</a>
									<a class="btn btn-app">
										<i class="fa fa-repeat"></i> Repeat
									</a>
									<a class="btn btn-app">
										<i class="fa fa-pause"></i> Pause
									</a>
									<a class="btn btn-app">
										<i class="fa fa-save"></i> Save
									</a>
									<a class="btn btn-app">
										<span class="badge bg-yellow">3</span>
										<i class="fa fa-bullhorn"></i> Notifications
									</a>
									<a class="btn btn-app">
										<span class="badge bg-green">300</span>
										<i class="fa fa-barcode"></i> Products
									</a>
									<a class="btn btn-app">
										<span class="badge bg-purple">891</span>
										<i class="fa fa-users"></i> Users
									</a>
									<a class="btn btn-app">
										<span class="badge bg-teal">67</span>
										<i class="fa fa-inbox"></i> Orders
									</a>
									<a class="btn btn-app">
										<span class="badge bg-aqua">12</span>
										<i class="fa fa-envelope"></i> Inbox
									</a>
									<a class="btn btn-app">
										<span class="badge bg-red">531</span>
										<i class="fa fa-heart-o"></i> Likes
									</a>
								</div><!-- /.box-body -->
							</div><!-- /.box -->
							<!-- Various colors -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Different colors</h3>
								</div>
								<div class="box-body">
									<p>Mix and match with various background colors. Use base class <code>.btn</code> and add any available <code>.bg-*</code> class</p>
									<!-- You may notice a .margin class added
									here but that's only to make the content
									display correctly without having to use a table-->
									<p>
										<button class="btn bg-maroon btn-flat margin">.btn.bg-maroon.btn-flat</button>
										<button class="btn bg-purple btn-flat margin">.btn.bg-purple.btn-flat</button>
										<button class="btn bg-navy btn-flat margin">.btn.bg-navy.btn-flat</button>
										<button class="btn bg-orange btn-flat margin">.btn.bg-orange.btn-flat</button>
										<button class="btn bg-olive btn-flat margin">.btn.bg-olive.btn-flat</button>
									</p>

									<p>
										<button class="btn bg-maroon margin">.btn.bg-maroon</button>
										<button class="btn bg-purple margin">.btn.bg-purple</button>
										<button class="btn bg-navy margin">.btn.bg-navy</button>
										<button class="btn bg-orange margin">.btn.bg-orange</button>
										<button class="btn bg-olive margin">.btn.bg-olive</button>
									</p>
								</div>
							</div><!-- /.box -->

							<!-- Vertical grouping -->
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Vertical Button Group</h3>
								</div>
								<div class="box-body table-responsive pad">

									<p>
										Vertical button groups are easy to create with bootstrap. Just add your buttons
										inside <code>&lt;div class="btn-group-vertical"&gt;&lt;/div&gt;</code>
									</p>

									<table class="table table-bordered">
										<tbody>
											<tr>
												<th>Button</th>
												<th>Icons</th>
												<th>Flat</th>
												<th>Dropdown</th>
											</tr>
											<!-- Default -->
											<tr>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-default">Top</button>
														<button type="button" class="btn btn-default">Middle</button>
														<button type="button" class="btn btn-default">Bottom</button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-default"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-default"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-default"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-default btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-default btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-default btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-default">1</button>
														<button type="button" class="btn btn-default">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr><!-- ./default -->
											<!-- Info -->
											<tr>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-info">Top</button>
														<button type="button" class="btn btn-info">Middle</button>
														<button type="button" class="btn btn-info">Bottom</button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-info"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-info"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-info"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-info btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-info btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-info btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-info">1</button>
														<button type="button" class="btn btn-info">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /. info -->
											<!-- /.danger -->
											<tr>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-danger">Top</button>
														<button type="button" class="btn btn-danger">Middle</button>
														<button type="button" class="btn btn-danger">Bottom</button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-danger"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-danger"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-danger"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-danger btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-danger btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-danger btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-danger">1</button>
														<button type="button" class="btn btn-danger">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /.danger -->
											<!-- warning -->
											<tr>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-warning">Top</button>
														<button type="button" class="btn btn-warning">Middle</button>
														<button type="button" class="btn btn-warning">Bottom</button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-warning"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-warning"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-warning"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-warning btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-warning btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-warning btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-warning">1</button>
														<button type="button" class="btn btn-warning">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /.warning -->
											<!-- success -->
											<tr>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-success">Top</button>
														<button type="button" class="btn btn-success">Middle</button>
														<button type="button" class="btn btn-success">Bottom</button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-success"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-success"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-success"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-success btn-flat"><i class="fa fa-align-left"></i></button>
														<button type="button" class="btn btn-success btn-flat"><i class="fa fa-align-center"></i></button>
														<button type="button" class="btn btn-success btn-flat"><i class="fa fa-align-right"></i></button>
													</div>
												</td>
												<td>
													<div class="btn-group-vertical">
														<button type="button" class="btn btn-success">1</button>
														<button type="button" class="btn btn-success">2</button>

														<div class="btn-group">
															<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
																<span class="caret"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#">Dropdown link</a></li>
																<li><a href="#">Dropdown link</a></li>
															</ul>
														</div>
													</div>
												</td>
											</tr>  <!-- /.success -->
										</tbody>
									</table>
								</div><!-- /.box-body -->
							</div><!-- /.box -->
						</div><!-- /.col -->
					</div><!-- /. row -->
				</section><!-- /.content -->
			</div>

	</div>
	
</body>
</html>