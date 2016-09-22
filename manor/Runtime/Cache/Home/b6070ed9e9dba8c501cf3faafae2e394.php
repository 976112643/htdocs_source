<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文件上传</title>
</head>
<body>
	<h1 align="center">文件列表</h1>
	<hr />
	<p><?php echo ($console); ?></p>
	<?php if(empty($file_list)): ?><h1>暂无数据</h1>
	<?php else: ?>
	<table width='70%' border='1' align='center' >
		<tr>
			<th scope='col'>预览</th>
			<th scope='col'>Name</th>
			<th scope='col'>MD5</th>
		</tr>
		<?php if(is_array($file_list)): $i = 0; $__LIST__ = $file_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
			<th scope='col'>
			<?php if(empty($vo["thumbnail"])): ?><img
				width='50px' height='50px' src='../images/no_type.png' />
			<?php else: ?> 
			<img
				width='50px' height='50px' src='../upload/<?php echo ($vo["thumbnail"]); ?>' /><?php endif; ?> 
				<th scope='col'><a href="./Download?file_id=<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></a></th>
				<th scope='col'><?php echo ($vo["md5_value"]); ?></th>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
	</table><?php endif; ?>
</body>
</html>