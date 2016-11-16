<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/15
 * Time: 上午10:20
 */
namespace Common\Controller;
use Think\Controller;

class CommonController extends Controller{
	protected $nav;

	public function __construct(){
		parent::__construct();
	}
	
	public function info(){
		phpinfo();
	}

}