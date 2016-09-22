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
 foreach(session('menu_result') as $key=>$row){ $a['title']=$row['title']; $a['url']=$row['_child'][0]['url']; $header_url[]=$a; if(!$need_display){ foreach($row['_child'] as $k=> $val){ if(strstr(trim( '/webroot/Backend/Demo/index/form.html','.html'),"/webroot/".$val['url']) && !empty($val['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['groups']; $page_small=$val['title']; $a=array('添加','启用','禁用','删除'); foreach($a as $aval){ foreach($val['_child'] as $v){ if($aval==$v['title']){ $page_child[]=$v; } } } break; } foreach($val['_child'] as $v){ if(strstr(trim( '/webroot/Backend/Demo/index/form.html','.html'),"/webroot/".$v['url']) && !empty($v['url']) ){ $need_display=$key; $group_class=$val['groups']; $title_class=$val['title']; $page_title=$val['title']; $page_small=$v['title']; break; } } if($need_display){ break; } } } } foreach($header_url as $key=>$row){ ?>
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
						General Form Elements
						<small>Preview</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li><a href="#">Forms</a></li>
						<li class="active">General Elements</li>
					</ol>
				</section>

				<!-- Main content -->
				<section class="content">
					<div class="row">
						<!-- left column -->
						<div class="col-md-6">
							<!-- general form elements -->
							<div class="box box-primary">
								<div class="box-header">
									<h3 class="box-title">Quick Example</h3>
								</div><!-- /.box-header -->
								<!-- form start -->
								<form role="form">
									<div class="box-body">
										<div class="form-group">
											<label for="exampleInputEmail1">Email address</label>
											<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">Password</label>
											<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
										</div>
										<div class="form-group">
											<label for="exampleInputFile">File input</label>
											<input type="file" id="exampleInputFile">
											<p class="help-block">Example block-level help text here.</p>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox"> Check me out
											</label>
										</div>
									</div><!-- /.box-body -->

									<div class="box-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>
							</div><!-- /.box -->

							<!-- Form Element sizes -->
							<div class="box box-success">
								<div class="box-header">
									<h3 class="box-title">Different Height</h3>
								</div>
								<div class="box-body">
									<input class="form-control input-lg" type="text" placeholder=".input-lg">
									<br>
									<input class="form-control" type="text" placeholder="Default input">
									<br>
									<input class="form-control input-sm" type="text" placeholder=".input-sm">
								</div><!-- /.box-body -->
							</div><!-- /.box -->

							<div class="box box-danger">
								<div class="box-header">
									<h3 class="box-title">Different Width</h3>
								</div>
								<div class="box-body">
									<div class="row">
										<div class="col-xs-3">
											<input type="text" class="form-control" placeholder=".col-xs-3">
										</div>
										<div class="col-xs-4">
											<input type="text" class="form-control" placeholder=".col-xs-4">
										</div>
										<div class="col-xs-5">
											<input type="text" class="form-control" placeholder=".col-xs-5">
										</div>
									</div>
								</div><!-- /.box-body -->
							</div><!-- /.box -->

							<!-- Input addon -->
							<div class="box box-info">
								<div class="box-header">
									<h3 class="box-title">Input Addon</h3>
								</div>
								<div class="box-body">
									<div class="input-group">
										<span class="input-group-addon">@</span>
										<input type="text" class="form-control" placeholder="Username">
									</div>
									<br>
									<div class="input-group">
										<input type="text" class="form-control">
										<span class="input-group-addon">.00</span>
									</div>
									<br>
									<div class="input-group">
										<span class="input-group-addon">$</span>
										<input type="text" class="form-control">
										<span class="input-group-addon">.00</span>
									</div>

									<h4>With icons</h4>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
										<input type="email" class="form-control" placeholder="Email">
									</div>
									<br>
									<div class="input-group">
										<input type="text" class="form-control">
										<span class="input-group-addon"><i class="fa fa-check"></i></span>
									</div>
									<br>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-dollar"></i></span>
										<input type="text" class="form-control">
										<span class="input-group-addon"><i class="fa fa-ambulance"></i></span>
									</div>

									<h4>With checkbox and radio inputs</h4>
									<div class="row">
										<div class="col-lg-6">
											<div class="input-group">
												<span class="input-group-addon">
													<input type="checkbox">
												</span>
												<input type="text" class="form-control">
											</div><!-- /input-group -->
										</div><!-- /.col-lg-6 -->
										<div class="col-lg-6">
											<div class="input-group">
												<span class="input-group-addon">
													<input type="radio">
												</span>
												<input type="text" class="form-control">
											</div><!-- /input-group -->
										</div><!-- /.col-lg-6 -->
									</div><!-- /.row -->

									<h4>With buttons</h4>
									<p class="margin">Large: <code>.input-group.input-group-lg</code></p>
									<div class="input-group input-group-lg">
										<div class="input-group-btn">
											<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">Action <span class="fa fa-caret-down"></span></button>
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
									<p class="margin">Normal</p>
									<div class="input-group">
										<div class="input-group-btn">
											<button type="button" class="btn btn-danger">Action</button>
										</div><!-- /btn-group -->
										<input type="text" class="form-control">
									</div><!-- /input-group -->
									<p class="margin">Small <code>.input-group.input-group-sm</code></p>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
										<span class="input-group-btn">
											<button class="btn btn-info btn-flat" type="button">Go!</button>
										</span>
									</div><!-- /input-group -->
								</div><!-- /.box-body -->
							</div><!-- /.box -->

						</div><!--/.col (left) -->
						<!-- right column -->
						<div class="col-md-6">
							<!-- general form elements disabled -->
							<div class="box box-warning">
								<div class="box-header">
									<h3 class="box-title">General Elements</h3>
								</div><!-- /.box-header -->
								<div class="box-body">
									<form role="form">
										<!-- text input -->
										<div class="form-group">
											<label>Text</label>
											<input type="text" class="form-control" placeholder="Enter ...">
										</div>
										<div class="form-group">
											<label>Text Disabled</label>
											<input type="text" class="form-control" placeholder="Enter ..." disabled="">
										</div>

										<!-- textarea -->
										<div class="form-group">
											<label>Textarea</label>
											<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
										</div>
										<div class="form-group">
											<label>Textarea Disabled</label>
											<textarea class="form-control" rows="3" placeholder="Enter ..." disabled=""></textarea>
										</div>

										<!-- input states -->
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess"><i class="fa fa-check"></i> Input with success</label>
											<input type="text" class="form-control" id="inputSuccess" placeholder="Enter ...">
										</div>
										<div class="form-group has-warning">
											<label class="control-label" for="inputWarning"><i class="fa fa-bell-o"></i> Input with warning</label>
											<input type="text" class="form-control" id="inputWarning" placeholder="Enter ...">
										</div>
										<div class="form-group has-error">
											<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> Input with error</label>
											<input type="text" class="form-control" id="inputError" placeholder="Enter ...">
										</div>

										<!-- checkbox -->
										<div class="form-group">
											<div class="checkbox">
												<label>
													<input type="checkbox">
													Checkbox 1
												</label>
											</div>

											<div class="checkbox">
												<label>
													<input type="checkbox">
													Checkbox 2
												</label>
											</div>

											<div class="checkbox">
												<label>
													<input type="checkbox" disabled="">
													Checkbox disabled
												</label>
											</div>
										</div>

										<!-- radio -->
										<div class="form-group">
											<div class="radio">
												<label>
													<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
													Option one is this and that—be sure to include why it's great
												</label>
											</div>
											<div class="radio">
												<label>
													<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
													Option two can be something else and selecting it will deselect option one
												</label>
											</div>
											<div class="radio">
												<label>
													<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled="">
													Option three is disabled
												</label>
											</div>
										</div>

										<!-- select -->
										<div class="form-group">
											<label>Select</label>
											<select class="form-control">
												<option>option 1</option>
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
												<option>option 5</option>
											</select>
										</div>
										<div class="form-group">
											<label>Select Disabled</label>
											<select class="form-control" disabled="">
												<option>option 1</option>
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
												<option>option 5</option>
											</select>
										</div>

										<!-- Select multiple-->
										<div class="form-group">
											<label>Select Multiple</label>
											<select multiple="" class="form-control">
												<option>option 1</option>
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
												<option>option 5</option>
											</select>
										</div>
										<div class="form-group">
											<label>Select Multiple Disabled</label>
											<select multiple="" class="form-control" disabled="">
												<option>option 1</option>
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
												<option>option 5</option>
											</select>
										</div>

									</form>
								</div><!-- /.box-body -->
							</div><!-- /.box -->
						</div><!--/.col (right) -->
					</div>   <!-- /.row -->
				</section><!-- /.content -->
			</div>

	</div>
	
</body>
</html>