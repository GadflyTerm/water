<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/15
 * Time: 上午11:56
 */

namespace Home\Logic;
use Common\Logic\CommonLogic;

class TestLogic extends CommonLogic{
	Protected $autoCheckFields = false;
	public function ddde(){
		return array('errcode'=>1, 'msg' => 'ddde');
	}
}