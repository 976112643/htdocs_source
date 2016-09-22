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
var _ROOT_='/web';
var _STATIC_='/web/Public/Static';
var _PLUGIN_='/web/Public/Plugins';
var _JS_='/web/Public/Backend/js';
var _IMG_='/web/Public/Backend/img';
var _CSS_='/web/Public/Backend/css';
</script>
<link rel="stylesheet" type="text/css" href="/web/Public/Backend/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/web/Public/Backend/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/web/Public/Backend/css/admin.min.css" />
<link rel="stylesheet" type="text/css" href="/web/Public/Backend/css/backend.css" />
<link rel="stylesheet" type="text/css" href="/web/Public/Plugins/uploadify/uploadify.css" />
<link rel="stylesheet" type="text/css" href="/web/Public/Plugins/artdialog/css/ui-dialog.css" />
<script type="text/javascript" src="/web/Public/Backend/js/jquery.min.js"></script>
<script type="text/javascript" src="/web/Public/Backend/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/web/Public/Backend/js/app.min.js"></script>
<script type="text/javascript" src="/web/Public/Static/js/common.js"></script>
<script type="text/javascript" src="/web/Public/Backend/js/common.js"></script>
<script type="text/javascript" src="/web/Public/Plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/web/Public/Plugins/artdialog/js/dialog-plus-min.js"></script>
<script type="text/javascript" src="/web/Public/Plugins/my97date/WdatePicker.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="/web/Public/Backend/js/html5shiv.min.js"></script>
  <script type="text/javascript" src="/web/Public/Backend/js/respond.min.js"></script>
<![endif]-->
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="/web/Public/Backend/css/fix-ie.css" />
<script type="text/javascript" src="/web/Public/Backend/js/bootstrap-ie.js"></script>
<link rel="stylesheet" type="text/css" href="/web/Public/Backend/css/bootstrap-ie6.min.css" />
<![endif]-->
 
</head>
<body class="skin-gray sidebar-mini">
	<script type="text/javascript" src="/web/Public/Plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/web/Public/Plugins/ueditor/ueditor.all.min.js"></script>

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
	  <img src="/web/Public/Home/img/sc_template/logo.png"/>
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
 foreach(session('menu_result') as $key=>$row){ $a['title']=$row['title']; $a['url']=$row['_child'][0]['url']; $header_url[]=$a; if(!$need_display){ foreach($row['_child'] as $k=> $val){ if(strstr(trim( '/web/Backend/Base/Group/access/id/1.html','.html'),"/web/".$val['url']) && !empty($val['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['groups']; $page_small=$val['title']; $a=array('添加','启用','禁用','删除'); foreach($a as $aval){ foreach($val['_child'] as $v){ if($aval==$v['title']){ $page_child[]=$v; } } } break; } foreach($val['_child'] as $v){ if(strstr(trim( '/web/Backend/Base/Group/access/id/1.html','.html'),"/web/".$v['url']) && !empty($v['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['title']; $page_small=$v['title']; break; } } if($need_display){ break; } } } } foreach($header_url as $key=>$row){ ?>
      	
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
              <!-- <img src="/web/Public/Backend/img/user.jpg" class="user-image" alt="User Image"/> -->
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
					<img src="/web/Public/Backend/img/user.jpg" class="img-circle" alt="User Image" />
				</div>
				<div class="pull-left info">
					<p><?=session('username')?></p> -->
					<!-- Status -->
					<!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
			<!-- 	</div>
			</div> -->
		
			<!-- Sidebar Menu -->
			<ul class="sidebar-menu" >
				<!-- Optionally, you can add icons to the links -->
				<?php
 $group_menu=array(); foreach($menu_result[$need_display]['_child'] as $_row){ if($_row['groups']!=''){ $group_menu[$_row['groups']][]=$_row; } } foreach($group_menu as $k=>$v){ ?>
				<li class="treeview <?=$k==$group_class?'active':''?>"   >
					<a class="one one-hover"><i class='fa fa-th-large'></i> <span><?=$k?></span> <i class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu" >
						<?php
 foreach($v as $menu){ ?>
						
						<li class="<?=$menu['title']==$title_class?'cur':''?>"><a href="<?=U($menu['url'])?>"><i class="fa  fa-align-left"></i><?=$menu['title']?></a></li>

						<?php
 if($iframe_src==''){ $iframe_src=U($menu['url']); } } ?>
					</ul>
				</li>
				<?php
 } ?>
			</ul>
			<script>
					$(function(){
						$(".treeview-menu li").click(function(){
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
           	 权限管理
            <small> 访问授权</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="../../../../"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li><a href="<?=U('index')?>">  用户管理</a></li>
            <li class="active">
            	访问授权
            </li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header">
            </div><!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="<?=U('')?>" method="post">
            <input type="hidden" name="id" value="<?=$info['id']?>"/>
              	<table class="table table-bordered ga_j">
				<tr>
					<th width="100"></th>
		        	<td class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
		        		<label><input type="checkbox" class="check_all" value="">全选</label>
		        	</td>
				</tr>
				<?php
 $rules_arr=explode(',',$info['rules']); foreach($menus as $key=>$row){ ?>
				<tr>
					<th valign="top"><label><input type="checkbox" <?php if(in_array($row['id'],$rules_arr)){echo "checked";}?> class="top_ids ids" name="access_id[]" value="<?=$row['id']?>" /><?=$row['title']?></label></th>
					<td>
						<?php
 foreach($row['_child'] as $_key=>$_row){ ?>
							<div class="module_box">
								<label><input type="checkbox" <?php if(in_array($_row['id'],$rules_arr)){echo "checked";}?> class="child_ids ids" name="access_id[]" value="<?=$_row['id']?>" /><?=$_row['title']?></label>
								<span>
								<?php
 foreach($_row['_child'] as $k=>$v){ ?>
									<label><input type="checkbox" <?php if(in_array($v['id'],$rules_arr)){echo "checked";}?> class="last_ids ids" name="access_id[]" value="<?=$v['id']?>" /><?=$v['title']?></label>
								<?php
 } ?>
								</span>
							</div>
						<?php
 } ?>
					</td>
				</tr>
				<?php
 } ?>
                
                
			  </table>          
              <div class="box-footer">
                <button type="submit" class="btn btn-primary btn-sm">提交</button>
                <a href="<?=U('index')?>" class="btn btn-default btn-sm">取消返回</a>
              </div>
              
            </form>
          </div><!-- /.box -->
        </section><!-- /.content -->
      </div>

	</div>
	
</body>
</html>