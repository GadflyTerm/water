<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/16
 * Time: 下午9:33
 */

/**
 * 生成随机字符串
 * @param int    $len
 * @param string $chars
 *
 * @return string
 */
function randstr($len=6, $chars='abcdefghijklmnopqrstuvwxyz0123456789'){
	mt_srand((double)microtime()*1000000*getmypid());
	$randstr='';
	while(strlen($randstr)<$len)
		$randstr.=substr($chars,(mt_rand()%strlen($chars)),1);
	return $randstr;
}