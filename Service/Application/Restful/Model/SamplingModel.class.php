<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/27
 * Time: 上午11:42
 */

namespace Restful\Model;
use Common\Model\CommonModel;
use Think\Storage\Driver\File;

class SamplingModel extends CommonModel{
	protected $tableName = 'ST_STBPRP_B';
	Protected $autoCheckFields = false;

	/**
	 * 列表查询水质采样数据
	 * @return array
	 */
	public function waterList(){
		$this->tableName = 'ST_WATER_SAMPLING_VIEW';
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
	
	public function samplingAdd($param){
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('TM', 'require', '测站报送时间必须填写！'),
		);
		$param['data']['TKTP'] = 'manual';
		$sttp = $param['data']['STTP'];
		unset($param['data']['STTP']);
		switch ($sttp){
			case 'MM':
			case 'PP':
				$this->tableName = 'ST_PPTN_R';
				$validate = array_merge($validate, array(
					array('DRP', 'require', '时段降水量必须填写！'),
				));
				$msg = '时段降水量';
				$return['type'] = 'Success';
				break;
			case 'ZQ':
			case 'ZZ':
				$this->tableName = 'ST_RIVER_R';
				$validate = array_merge($validate, array(
					array('Z', 'require', '水位必须填写！'),
					array('Q', 'require', '流量必须填写！'),
				));
				$msg = '河道水情';
				$return['type'] = 'Success';
				break;
			case 'RR':
				$data = array(
					'STCD'	=> $param['data']['STCD'],
					'TM'	=> $param['data']['TM'],
					'DRP'	=> $param['data']['DRP'],
					'TKTP'	=> $param['data']['TKTP'],
				);
				// $return = $this->curd(array(
				// 	'model'		=> '',
				// 	'validate'	=> array_merge($validate, array(array('DRP', 'require', '时段降水量必须填写！'))),
				// 	'type'		=> 'add',
				// 	'data'		=> $data,
				// 	'msg'		=> '时段降水量数据添加成功！'
				// ));
				$res = M('st_pptn_r')->add($data);

				if($res){
					$this->tableName = 'ST_RSVR_R';
					unset($param['data']['DRP']);
					$validate = array_merge($validate, array(
						array('RZ', 'require', '库上水位必须填写！'),
					));
					$msg = '水库水情';
				}
				break;
			case 'DD':
				$this->tableName = 'ST_GATE_R';
				$param['data']['EXKEY'] = 'A';
				$validate = array_merge($validate, array(
					array('GTOPHGT', 'require', '闸门开启高度必须填写！'),
				));
				$msg = '闸门启闭情况';
				$return['type'] = 'Success';
				break;
			case 'SS':
				$this->tableName = 'ST_SOIL_R';
				$param['data']['EXKEY'] = 'A';
				$validate = array_merge($validate, array(
					array('SLM20', 'require', '20cm深度含水量必须填写！'),
					array('SLM40', 'require', '40cm深度含水量必须填写！'),
					array('SLM60', 'require', '60cm深度含水量必须填写！'),
				));
				$msg = '土壤墒情';
				$return['type'] = 'Success';
				break;
		}
		if($return['type'] = 'Success'){
			return $this->curd(array(
				'validate'	=> $validate,
				'type'		=> 'add',
				'data'		=> $param['data'],
				'msg'		=> $msg.'数据添加成功！'
			));
		}else{
			return $return;
		}
	}
	
	public function samplingList(){
		$this->tableName = 'ST_TASKLIST_D';
		return $this->curd(array(
			'type'	=> 'select',
			'order' => 'id DESC',
			'msg'	=> '水质采样数据读取成功！'
		));
	}
}