<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/16
 * Time: 下午3:09
 */

namespace Setting\Controller;
use Common\Controller\CommonController;

class IndexController extends CommonController{
	/**
	 * 检测站设置
	 */
	public function station(){
		$this->display();
	}
}