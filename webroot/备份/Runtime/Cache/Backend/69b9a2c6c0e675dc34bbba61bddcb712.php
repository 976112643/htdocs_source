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
 foreach(session('menu_result') as $key=>$row){ $a['title']=$row['title']; $a['url']=$row['_child'][0]['url']; $header_url[]=$a; if(!$need_display){ foreach($row['_child'] as $k=> $val){ if(strstr(trim( '/webroot/Backend/Demo/index/generalElement.html','.html'),"/webroot/".$val['url']) && !empty($val['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['groups']; $page_small=$val['title']; $a=array('添加','启用','禁用','删除'); foreach($a as $aval){ foreach($val['_child'] as $v){ if($aval==$v['title']){ $page_child[]=$v; } } } break; } foreach($val['_child'] as $v){ if(strstr(trim( '/webroot/Backend/Demo/index/generalElement.html','.html'),"/webroot/".$v['url']) && !empty($v['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['title']; $page_small=$v['title']; break; } } if($need_display){ break; } } } } foreach($header_url as $key=>$row){ ?>
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
				General UI
				<small>Preview of UI elements</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">UI</a></li>
				<li class="active">General</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<!-- START ALERTS AND CALLOUTS -->
			<h2 class="page-header">Alerts and Callouts</h2>
			<div class="row">
				<div class="col-md-6">
					<div class="box box-default">
						<div class="box-header with-border">
							<i class="fa fa-warning"></i>
							<h3 class="box-title">Alerts</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<div class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<h4><i class="icon fa fa-ban"></i> Alert!</h4>
								Danger alert preview. This alert is dismissable. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.
							</div>
							<div class="alert alert-info alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<h4><i class="icon fa fa-info"></i> Alert!</h4>
								Info alert preview. This alert is dismissable.
							</div>
							<div class="alert alert-warning alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<h4><i class="icon fa fa-warning"></i> Alert!</h4>
								Warning alert preview. This alert is dismissable.
							</div>
							<div class="alert alert-success alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<h4>	<i class="icon fa fa-check"></i> Alert!</h4>
								Success alert preview. This alert is dismissable.
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col -->

				<div class="col-md-6">
					<div class="box box-default">
						<div class="box-header with-border">
							<i class="fa fa-bullhorn"></i>
							<h3 class="box-title">Callouts</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<div class="callout callout-danger">
								<h4>I am a danger callout!</h4>
								<p>There is a problem that we need to fix. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
							</div>
							<div class="callout callout-info">
								<h4>I am an info callout!</h4>
								<p>Follow the steps to continue to payment.</p>
							</div>
							<div class="callout callout-warning">
								<h4>I am a warning callout!</h4>
								<p>This is a yellow callout.</p>
							</div>
							<div class="callout callout-success">
								<h4>I am a success callout!</h4>
								<p>This is a green callout.</p>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col -->
			</div> <!-- /.row -->
			<!-- END ALERTS AND CALLOUTS -->
			<!-- START CUSTOM TABS -->
			<h2 class="page-header">AdminLTE Custom Tabs</h2>
			<div class="row">
				<div class="col-md-6">
					<!-- Custom Tabs -->
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab_1" data-toggle="tab">Tab 1</a></li>
							<li><a href="#tab_2" data-toggle="tab">Tab 2</a></li>
							<li><a href="#tab_3" data-toggle="tab">Tab 3</a></li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									Dropdown <span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
								</ul>
							</li>
							<li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1">
								<b>How to use:</b>
								<p>Exactly like the original bootstrap tabs except you should use
									the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
								A wonderful serenity has taken possession of my entire soul,
								like these sweet mornings of spring which I enjoy with my whole heart.
								I am alone, and feel the charm of existence in this spot,
								which was created for the bliss of souls like mine. I am so happy,
								my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
								that I neglect my talents. I should be incapable of drawing a single stroke
								at the present moment; and yet I feel that I never was a greater artist than now.
							</div><!-- /.tab-pane -->
							<div class="tab-pane" id="tab_2">
								The European languages are members of the same family. Their separate existence is a myth.
								For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
								in their grammar, their pronunciation and their most common words. Everyone realizes why a
								new common language would be desirable: one could refuse to pay expensive translators. To
								achieve this, it would be necessary to have uniform grammar, pronunciation and more common
								words. If several languages coalesce, the grammar of the resulting language is more simple
								and regular than that of the individual languages.
							</div><!-- /.tab-pane -->
							<div class="tab-pane" id="tab_3">
								Lorem Ipsum is simply dummy text of the printing and typesetting industry.
								Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
								when an unknown printer took a galley of type and scrambled it to make a type specimen book.
								It has survived not only five centuries, but also the leap into electronic typesetting,
								remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
								sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
								like Aldus PageMaker including versions of Lorem Ipsum.
							</div><!-- /.tab-pane -->
						</div><!-- /.tab-content -->
					</div><!-- nav-tabs-custom -->
				</div><!-- /.col -->

				<div class="col-md-6">
					<!-- Custom Tabs (Pulled to the right) -->
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs pull-right">
							<li class="active"><a href="#tab_1-1" data-toggle="tab">Tab 1</a></li>
							<li><a href="#tab_2-2" data-toggle="tab">Tab 2</a></li>
							<li><a href="#tab_3-2" data-toggle="tab">Tab 3</a></li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									Dropdown <span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
								</ul>
							</li>
							<li class="pull-left header"><i class="fa fa-th"></i> Custom Tabs</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1-1">
								<b>How to use:</b>
								<p>Exactly like the original bootstrap tabs except you should use
									the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
								A wonderful serenity has taken possession of my entire soul,
								like these sweet mornings of spring which I enjoy with my whole heart.
								I am alone, and feel the charm of existence in this spot,
								which was created for the bliss of souls like mine. I am so happy,
								my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
								that I neglect my talents. I should be incapable of drawing a single stroke
								at the present moment; and yet I feel that I never was a greater artist than now.
							</div><!-- /.tab-pane -->
							<div class="tab-pane" id="tab_2-2">
								The European languages are members of the same family. Their separate existence is a myth.
								For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
								in their grammar, their pronunciation and their most common words. Everyone realizes why a
								new common language would be desirable: one could refuse to pay expensive translators. To
								achieve this, it would be necessary to have uniform grammar, pronunciation and more common
								words. If several languages coalesce, the grammar of the resulting language is more simple
								and regular than that of the individual languages.
							</div><!-- /.tab-pane -->
							<div class="tab-pane" id="tab_3-2">
								Lorem Ipsum is simply dummy text of the printing and typesetting industry.
								Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
								when an unknown printer took a galley of type and scrambled it to make a type specimen book.
								It has survived not only five centuries, but also the leap into electronic typesetting,
								remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
								sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
								like Aldus PageMaker including versions of Lorem Ipsum.
							</div><!-- /.tab-pane -->
						</div><!-- /.tab-content -->
					</div><!-- nav-tabs-custom -->
				</div><!-- /.col -->
			</div> <!-- /.row -->
			<!-- END CUSTOM TABS -->
			<!-- START PROGRESS BARS -->
			<h2 class="page-header">Progress Bars</h2>
			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Progress Bars Different Sizes</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<p><code>.progress</code></p>
							<div class="progress">
								<div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
							<p>Class: <code>.sm</code></p>
							<div class="progress progress-sm active">
								<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
									<span class="sr-only">20% Complete</span>
								</div>
							</div>
							<p>Class: <code>.xs</code></p>
							<div class="progress progress-xs">
								<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
							<p>Class: <code>.xxs</code></p>
							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col (left) -->
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Progress bars</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<div class="progress">
								<div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
							<div class="progress">
								<div class="progress-bar progress-bar-aqua" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
									<span class="sr-only">20% Complete</span>
								</div>
							</div>
							<div class="progress">
								<div class="progress-bar progress-bar-yellow" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
							<div class="progress">
								<div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
									<span class="sr-only">80% Complete</span>
								</div>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col (right) -->
			</div><!-- /.row -->
			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Vertical Progress Bars Different Sizes</h3>
						</div><!-- /.box-header -->
						<div class="box-body text-center">
							<p>By adding the class <code>.vertical</code> and <code>.progress-sm</code>, <code>.progress-xs</code> or <code>.progress-xxs</code>we achieve:</p>
							<div class="progress vertical active">
								<div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="height: 40%">
									<span class="sr-only">40%</span>
								</div>
							</div>
							<div class="progress vertical progress-sm">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="height: 100%">
									<span class="sr-only">100%</span>
								</div>
							</div>
							<div class="progress vertical progress-xs">
								<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="height: 60%">
									<span class="sr-only">60%</span>
								</div>
							</div>
							<div class="progress vertical progress-xxs">
								<div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="height: 60%">
									<span class="sr-only">60%</span>
								</div>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col (left) -->
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Vertical Progress bars</h3>
						</div><!-- /.box-header -->
						<div class="box-body text-center">
							<p>By adding the class <code>.vertical</code> we achieve:</p>
							<div class="progress vertical">
								<div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="height: 40%">
									<span class="sr-only">40%</span>
								</div>
							</div>
							<div class="progress vertical">
								<div class="progress-bar progress-bar-aqua" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="height: 20%">
									<span class="sr-only">20%</span>
								</div>
							</div>
							<div class="progress vertical">
								<div class="progress-bar progress-bar-yellow" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="height: 60%">
									<span class="sr-only">60%</span>
								</div>
							</div>
							<div class="progress vertical">
								<div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="height: 80%">
									<span class="sr-only">80%</span>
								</div>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col (right) -->
			</div><!-- /.row -->
			<!-- END PROGRESS BARS -->

			<!-- START ACCORDION & CAROUSEL-->
			<h2 class="page-header">Bootstrap Accordion &amp; Carousel</h2>
			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Collapsible Accordion</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<div class="box-group" id="accordion">
								<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
								<div class="panel box box-primary">
									<div class="box-header with-border">
										<h4 class="box-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
												Collapsible Group Item #1
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="box-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
										</div>
									</div>
								</div>
								<div class="panel box box-danger">
									<div class="box-header with-border">
										<h4 class="box-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
												Collapsible Group Danger
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="box-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
										</div>
									</div>
								</div>
								<div class="panel box box-success">
									<div class="box-header with-border">
										<h4 class="box-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
												Collapsible Group Success
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="box-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
										</div>
									</div>
								</div>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col -->
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Carousel</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
									<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
									<li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
								</ol>
								<div class="carousel-inner">
									<div class="item active">
										<img src="http://placehold.it/900x500/39CCCC/ffffff&amp;text=I+Love+Bootstrap" alt="First slide">
										<div class="carousel-caption">
											First Slide
										</div>
									</div>
									<div class="item">
										<img src="http://placehold.it/900x500/3c8dbc/ffffff&amp;text=I+Love+Bootstrap" alt="Second slide">
										<div class="carousel-caption">
											Second Slide
										</div>
									</div>
									<div class="item">
										<img src="http://placehold.it/900x500/f39c12/ffffff&amp;text=I+Love+Bootstrap" alt="Third slide">
										<div class="carousel-caption">
											Third Slide
										</div>
									</div>
								</div>
								<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
									<span class="fa fa-angle-left"></span>
								</a>
								<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
									<span class="fa fa-angle-right"></span>
								</a>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- /.col -->
			</div><!-- /.row -->
			<!-- END ACCORDION & CAROUSEL-->

			<!-- START TYPOGRAPHY -->
			<h2 class="page-header">Typography</h2>
			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Headlines</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<h1>h1. Bootstrap heading</h1>
							<h2>h2. Bootstrap heading</h2>
							<h3>h3. Bootstrap heading</h3>
							<h4>h4. Bootstrap heading</h4>
							<h5>h5. Bootstrap heading</h5>
							<h6>h6. Bootstrap heading</h6>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Text Emphasis</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<p class="lead">Lead to emphasize importance</p>
							<p class="text-green">Text green to emphasize success</p>
							<p class="text-aqua">Text aqua to emphasize info</p>
							<p class="text-light-blue">Text light blue to emphasize info (2)</p>
							<p class="text-red">Text red to emphasize danger</p>
							<p class="text-yellow">Text yellow to emphasize warning</p>
							<p class="text-muted">Text muted to emphasize general</p>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
			</div><!-- /.row -->

			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Block Quotes</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<blockquote>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
								<small>Someone famous in <cite title="Source Title">Source Title</cite></small>
							</blockquote>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Block Quotes Pulled Right</h3>
						</div><!-- /.box-header -->
						<div class="box-body clearfix">
							<blockquote class="pull-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
								<small>Someone famous in <cite title="Source Title">Source Title</cite></small>
							</blockquote>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
			</div><!-- /.row -->

			<div class="row">
				<div class="col-md-4">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Unordered List</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<ul>
								<li>Lorem ipsum dolor sit amet</li>
								<li>Consectetur adipiscing elit</li>
								<li>Integer molestie lorem at massa</li>
								<li>Facilisis in pretium nisl aliquet</li>
								<li>Nulla volutpat aliquam velit
									<ul>
										<li>Phasellus iaculis neque</li>
										<li>Purus sodales ultricies</li>
										<li>Vestibulum laoreet porttitor sem</li>
										<li>Ac tristique libero volutpat at</li>
									</ul>
								</li>
								<li>Faucibus porta lacus fringilla vel</li>
								<li>Aenean sit amet erat nunc</li>
								<li>Eget porttitor lorem</li>
							</ul>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
				<div class="col-md-4">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Ordered Lists</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<ol>
								<li>Lorem ipsum dolor sit amet</li>
								<li>Consectetur adipiscing elit</li>
								<li>Integer molestie lorem at massa</li>
								<li>Facilisis in pretium nisl aliquet</li>
								<li>Nulla volutpat aliquam velit
									<ol>
										<li>Phasellus iaculis neque</li>
										<li>Purus sodales ultricies</li>
										<li>Vestibulum laoreet porttitor sem</li>
										<li>Ac tristique libero volutpat at</li>
									</ol>
								</li>
								<li>Faucibus porta lacus fringilla vel</li>
								<li>Aenean sit amet erat nunc</li>
								<li>Eget porttitor lorem</li>
							</ol>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
				<div class="col-md-4">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Unstyled List</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<ul class="list-unstyled">
								<li>Lorem ipsum dolor sit amet</li>
								<li>Consectetur adipiscing elit</li>
								<li>Integer molestie lorem at massa</li>
								<li>Facilisis in pretium nisl aliquet</li>
								<li>Nulla volutpat aliquam velit
									<ul>
										<li>Phasellus iaculis neque</li>
										<li>Purus sodales ultricies</li>
										<li>Vestibulum laoreet porttitor sem</li>
										<li>Ac tristique libero volutpat at</li>
									</ul>
								</li>
								<li>Faucibus porta lacus fringilla vel</li>
								<li>Aenean sit amet erat nunc</li>
								<li>Eget porttitor lorem</li>
							</ul>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
			</div><!-- /.row -->

			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Description</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<dl>
								<dt>Description lists</dt>
								<dd>A description list is perfect for defining terms.</dd>
								<dt>Euismod</dt>
								<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
								<dd>Donec id elit non mi porta gravida at eget metus.</dd>
								<dt>Malesuada porta</dt>
								<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
							</dl>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<i class="fa fa-text-width"></i>
							<h3 class="box-title">Description Horizontal</h3>
						</div><!-- /.box-header -->
						<div class="box-body">
							<dl class="dl-horizontal">
								<dt>Description lists</dt>
								<dd>A description list is perfect for defining terms.</dd>
								<dt>Euismod</dt>
								<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
								<dd>Donec id elit non mi porta gravida at eget metus.</dd>
								<dt>Malesuada porta</dt>
								<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
								<dt>Felis euismod semper eget lacinia</dt>
								<dd>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>
							</dl>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div><!-- ./col -->
			</div><!-- /.row -->
			<!-- END TYPOGRAPHY -->

		</section><!-- /.content -->
	</div>

	</div>
	
</body>
</html>