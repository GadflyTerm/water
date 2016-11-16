<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/16
 * Time: 下午3:09
 */

namespace Setting\Controller;
use Common\Controller\CommonController;

class StationController extends CommonController{
	
	public function __construct(){
		parent::__construct();
		$this->nav['home'] = array('url' => U('station/index'), 'title' => '检测站管理');
	}
	
	/**
	 * 检测站列表
	 */
	public function lists(){
		$this->nav['library'] = array('url' => U('station/lists'), 'title' => '检测站列表');
		$this->assign('nav', $this->nav);
		$this->display();
	}

	/**
	 * 添加新的检测站
	 */
	public function add(){
		if(IS_POST){
			$add = D('Station')->addStation();
			if($add['errcode'] == 1)
				$this->success($add['msg'], U('Station/lists'));
			else
				$this->error($add['msg'], U('Station/lists'));
		}else{
			$this->nav['library'] = array('url' => U('station/lists'), 'title' => '检测站列表');
			$this->assign('nav', $this->nav);
			$this->display();
		}
	}

	/**
	 * 编辑检测站
	 */
	public function edit(){
		if(IS_POST){
			$this->success('成功编辑检测站',  U('Station/lists'));
		}else{
			$this->assign('info', D('Station')->infoStation());
			$this->display();
		}
	}

	/**
	 * 删除检测站
	 */
	public function del(){
		
	}
}