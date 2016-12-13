<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/12
 * Time: 下午4:28
 */

namespace Census\Controller;
use Common\Controller\CommonController;

class IndexController extends CommonController{
	public function __construct(){
		parent::__construct();
		$this->nav = array(
			'home'		=> array('url' => U('station/index'), 'title' => '灌区统计信息'),
			'library'	=> array('url' => U('station/lists'), 'title' => '统计列表')
		);
	}
	
	public function index(){
		$this->assign('nav', $this->nav);
		$this->display();
	}
}