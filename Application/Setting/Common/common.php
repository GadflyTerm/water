<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/2
 * Time: 下午3:09
 */

/**
 * 创建目录
 * @param $dir
 *
 * @return bool
 */
function mkdirs($dir){
	if(!is_dir($dir)){
		if(!mkdirs(dirname($dir))){
			return false;
		}
		if(!mkdir($dir,0777)){
			return false;
		}
	}
	return true;
}