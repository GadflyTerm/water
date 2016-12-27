<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/27
 * Time: 上午11:42
 */

namespace Restful\Model;
use Common\Model\CommonModel;

class SamplingModel extends CommonModel{
	protected $tableName = 'ST_STBPRP_B';
	Protected $autoCheckFields = false;

	/**
	 * 列表查询水质采样数据
	 * @return array
	 */
	public function waterList(){
		$this->tableName = 'ST_AWQMD_D';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '水质采样数据读取成功！'
		));
	}

	/**
	 * 新增水质采样数据
	 * @param $param
	 * @return array
	 */
	public function waterAdd($param){
		$this->tableName = 'ST_AWQMD_D';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
		);
		$param['data']['ANOMALY'] = $this->_waterAnalyze($param['data']);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $param['data'],
			'msg'		=> '水质采样数据添加成功！'
		));
	}

	/**
	 * 修改指定的水质采样数据
	 * @param $param
	 * @return array
	 */
	public function waterEdit($param){
		$this->tableName = 'ST_AWQMD_D';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
		);
		$param['data']['ANOMALY'] = $this->_waterAnalyze($param['data']);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'edit',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'data'		=> $param['data'],
			'msg'		=> '水质采样数据修改成功！'
		));
	}

	/**
	 * 删除指定的水质采样数据
	 * @param $param
	 * @return array
	 */
	public function waterDel($param){
		$this->tableName = 'ST_AWQMD_D';
		return $this->curd(array(
			'type'		=> 'delete',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'msg'		=> '水质采样数据删除成功！'
		));
	}

	/**
	 * 获取指定的水质采样数据
	 * @param $param
	 * @return array
	 */
	public function waterInfo($param){
		$this->tableName = 'ST_AWQMD_D';
		$station = D('Station')->listWater();
		return $this->curd(array(
			'type'		=> 'find',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'station'	=> $station['data'],
			'msg'		=> '水质采样数据查询成功！'
		));
	}

	/**
	 * 水质数据分析
	 * @param $param
	 * @return null|string
	 */
	protected function _waterAnalyze($param){
		$File = new File();
		$filename = APP_ROOT.'Data/WaterStandard.json';
		if($File->has($filename))
			$standard = json_decode($File->read($filename), true);
		else
			$standard = C('OPT.WaterStandard');
		$return = null;
		foreach ($param AS $key => $val){
			if($standard[$key]){
				if($standard[$key]['min'] > $val)
					$return[] = array('label' => $standard[$key]['label'], 'field' => $key, 'analyze' => 'down', 'standard' => $standard[$key]['min'], 'value' => $val);
				elseif($val < $standard[$key]['value'])
					$return[] = array('label' => $standard[$key]['label'], 'field' => $key, 'analyze' => 'up', 'standard' => $standard[$key]['value'], 'value' => $val);
			}
		}
		return is_null($return)?null:json_encode($return);
	}
}