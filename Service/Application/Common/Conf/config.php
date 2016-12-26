<?php
return array(
	'URL_MODEL'	=> '3',
	'URL_PARAMS_BIND'   =>  true, 						// URL变量绑定到操作方法作为参数
	'MODULE_DENY_LIST'	=> array('Common','Runtime'),
	'MODULE_ALLOW_LIST'	=> array('Home', 'Setting', 'Census', 'Restful'),

	'LOAD_EXT_CONFIG' => array('OPT' => 'option'),		// 加载扩展配置文件

	'STATIC_URL'            => APP_URL,
	'STATIC_PATH'           => dirname(APP_ROOT).'/static',
	'UPLOAD_PATH'           => dirname(APP_ROOT).'/static',
	
	'TOKEN_ON'		=> false,
	'TOKEN_NAME'	=> '__hash__',
	'TOKEN_TYPE'	=> 'md5',
	'TOKEN_RESET'	=> false,
	
/*	'DB_TYPE'   		=> 'Sqlsrv', 			// 数据库类型
	'DB_HOST'   		=> '114.55.231.186', 	// 服务器地址
	'DB_NAME'   		=> 'Hydrology_pygq', 	// 数据库名
	'DB_USER'   		=> 'PYGQ', 				// 用户名
	'DB_PWD'    		=> 'lonhwin@2011sql',  	// 密码
	'DB_PORT'   		=> '1433', 				// 端口
	'DB_PREFIX' 		=> 'dbo.', 				// 数据库表前缀
	'DB_FIELDS_CACHE'	=> false,				// 关闭字段缓存*/

	'DB_TYPE'   		=> 'Sqlsrv', 			// 数据库类型
	'DB_HOST'   		=> '127.0.0.1', 	// 服务器地址
	'DB_NAME'   		=> 'master', 	// 数据库名
	'DB_USER'   		=> 'sa', 				// 用户名
	'DB_PWD'    		=> 'weA3#q7*',  	// 密码
	'DB_PORT'   		=> '1433', 				// 端口
	'DB_PREFIX' 		=> 'dbo.', 				// 数据库表前缀
	'DB_FIELDS_CACHE'	=> false,				// 关闭字段缓存
);