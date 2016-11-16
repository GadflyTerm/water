<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/15
 * Time: 上午11:15
 */

namespace Home\Model;
use Common\Model\CommonModel;

class TestModel extends CommonModel{
	protected $tableName = 'ST_FIELD_D';
	
	public function base1(){
		return array('errcode' => 1, 'msg' => 'ok');
	}
	
	public function mssql(){
		return array('errcode' => 1, 'msg' => 'ok', 'data' => $this->select(), 'sql' => $this->getLastSql());
	}
}