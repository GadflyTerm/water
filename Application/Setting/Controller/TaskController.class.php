<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/1
 * Time: 下午2:41
 */

namespace Setting\Controller;
use Common\Controller\CommonController;

class TaskController extends CommonController{
	public function __construct(){
		parent::__construct();
		$this->nav = array(
			'home'		=> array('url' => U('station/index'), 'title' => '报送任务管理'),
			'library'	=> array('url' => U('station/lists'), 'title' => '报送任务列表')
		);
	}

	/**
	 * 检测站列表
	 */
	public function lists(){
		$this->assign('nav', $this->nav);
		$this->display();
	}
}