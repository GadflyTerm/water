<?php
return array(
	//'配置项'=>'配置值'
	'URL_MODEL'	=> '3',
	'MODULE_DENY_LIST'	=> array('Common','Runtime'),
	'MODULE_ALLOW_LIST'	=> array('Home', 'Setting'),

	'TMPL_LAYOUT_ITEM'	=> '{__CONTENT__}',		// 布局模板的内容替换标识
	'LAYOUT_ON'			=> true, 				// 是否启用布局
	'LAYOUT_NAME'		=> 'layout', 			// 当前布局名称 默认为layout
	
	'TOKEN_ON'		=> true,
	'TOKEN_NAME'	=> '__hash__',
	'TOKEN_TYPE'	=> 'md5',
	'TOKEN_RESET'	=> true,
	
	'DB_TYPE'   => 'sqlsrv', 			// 数据库类型
	'DB_HOST'   => '114.55.231.186', 	// 服务器地址
	'DB_NAME'   => 'Hydrology_pygq', 	// 数据库名
	'DB_USER'   => 'PYGQ', 				// 用户名
	'DB_PWD'    => 'lonhwin@2011sql',  	// 密码
	'DB_PORT'   => '1433', 				// 端口
	'DB_PREFIX' => 'dbo.', 				// 数据库表前缀
);