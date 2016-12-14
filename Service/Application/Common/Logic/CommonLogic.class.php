<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/15
 * Time: 上午11:45
 */

namespace Common\Logic;
use Common\Model\CommonModel;

class CommonLogic extends CommonModel{
	public function ddd(){
		return array('errcode' => 1, 'msg' => 'ddd');
	}
}