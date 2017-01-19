<?php
namespace Restful\Model;
use Common\Model\CommonModel;

class MonitorModel extends CommonModel{

	protected $tableName ;
	Protected $autoCheckFields = false;

	/**
	 * 列表查询水质采样数据
	 * @return array
	 */
	public function get_skavg_list($param){
		$this->tableName = 'ST_REPORT_SK_VIEW';
		$param['data']['STTDRCD'] = isset($param['data']['STTDRCD'])?$param['data']['STTDRCD']:1;
		return $this->curd(array(
			'where'		=> array('[STTDRCD]' => $param['data']['STTDRCD']),
			'type'	=> 'select',
			'msg'	=> '灌区报表数据读取成功！'
		));
	}
	public function get_sk_list($param){
		$this->tableName = 'ST_MONITOR_SK_VIEW';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '水库报表数据读取成功！'
		));
	}
	public function get_yl_list($param){
		$this->tableName = 'ST_MONITOR_YL_VIEW';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '水库报表数据读取成功！'
		));
	}
	public function get_ll_list($param){
		$this->tableName = 'ST_MONITOR_LL_VIEW';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '灌区报表数据读取成功！'
		));
	}
	public function get_sq_list($param){
		$this->tableName = 'ST_MONITOR_SQ_VIEW';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '灌区报表数据读取成功！'
		));	
	}
	public function get_yz_list($param){
		$this->tableName = 'ST_MONITOR_YZ_VIEW';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '灌区报表数据读取成功！'
		));		
	}


}