<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

$protocol = strpos(strtolower($_SERVER['SERVER_PROTOCOL']),'https')  === false ? 'http' : 'https';  //apache 下面注意区分大小写，不然会报错 server_protocol
define('APP_ROOT', rtrim(dirname(__FILE__), '/\\') . DIRECTORY_SEPARATOR);
define('APP_URL', $protocol.'://'.$_SERVER['SERVER_NAME'].(($_SERVER['SERVER_PORT']==80)?'':':'.$_SERVER['SERVER_PORT']));
/**
 * 系统调试设置
 * 项目正式部署后请设置为false
 */
define('APP_DEBUG', true );
define('BIND_MODULE','Home');

/**
 * 应用目录设置
 * 安全期间，建议安装调试完成后移动到非WEB目录
 */
define ( 'APP_PATH', './Application/' );

/**
 * 缓存目录设置
 * 此目录必须可写，建议移动到非WEB目录
 */
define ( 'RUNTIME_PATH', '../../Runtime/water.com/' );

/**
 * 引入核心入口
 * ThinkPHP亦可移动到WEB以外的目录
 */
require './ThinkPHP/ThinkPHP.php';