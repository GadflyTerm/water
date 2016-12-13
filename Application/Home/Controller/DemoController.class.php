<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/12
 * Time: 上午9:51
 */

namespace Home\Controller;
use Common\Controller\CommonController;

class DemoController extends CommonController{
	public function index(){
		$this->display();
	}
	public function test(){
		$this->display();
	}
}