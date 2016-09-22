<?php
return array(
	/* '配置项'=>'配置值' */
	'SESSION_OPTIONS'=>array(
		'type'=> 'db',       /* session采用数据库保存 */
		'expire'=>300,       /* session过期时间，如果不设就是php.ini中设置的默认值 */
	),
	'SESSION_TABLE'=>'sr_sessions',   /* 必须设置成这样，如果不加前缀就找不到数据表，这个需要注意 */
	
	
	
);