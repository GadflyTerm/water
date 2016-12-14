<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/15
 * Time: 上午11:11
 */

namespace Common\Model;
use Think\Model;

class CommonModel extends Model{
	public function base(){
		return array('errcode' => 1);
	}
}