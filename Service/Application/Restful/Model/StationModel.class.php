<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/6
 * Time: 下午1:24
 */

namespace Restful\Model;
use Common\Model\CommonModel;

class StationModel extends CommonModel{
	protected $tableName = 'ST_STBPRP_B';
	Protected $autoCheckFields = false;
	/**
	 * 获取河道站列表
	 * @return array
	 */
	public function getZZlist(){
		return array(
			array('lable' => '请选择所关联的河道测站', 'value' => ''),
			array('lable' => '测试用河道一', 'value' => 'hd1'),
			array('lable' => '测试用河道二', 'value' => 'hd2'),
			array('lable' => '测试用河道三', 'value' => 'hd3'),
			array('lable' => '测试用河道四', 'value' => 'hd4'),
		);
	}

	/**
	 * 获取水库站列表
	 * @return array
	 */
	public function getRRlist(){
		return array(
			array('lable' => '请选择所关联的水库测站', 'value' => ''),
			array('lable' => '测试用水库一', 'value' => 'sk1'),
			array('lable' => '测试用水库二', 'value' => 'sk2'),
			array('lable' => '测试用水库三', 'value' => 'sk3'),
			array('lable' => '测试用水库四', 'value' => 'sk4'),
			array('lable' => '测试用水库五', 'value' => 'sk5'),
			array('lable' => '测试用水库六', 'value' => 'sk6'),
		);
	}

	/**
	 * 添加新的水质测站数据
	 * @param $param
	 * @return array
	 */
	public function addWater($param){
		$this->tableName = 'ST_SWSINF_B';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
			array('STNM', 'require', '测站名称必须填写！'),
			array('STNM', '', '测站名称已经存在！', 0, 'unique', 1),
			array('STCT', 'require', '测站类别必须选择！'),
			array('WATP', 'require', '水域类型必须选择！'),
			array('LGTD', 'require', '测站经度必须填写！'),
			array('LTTD', 'require', '测站纬度必须填写！'),
		);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $param['data'],
			'msg'		=> '水质测站数据添加成功！'
		));
	}

	/**
	 * 编辑水质测站数据
	 * @param $param
	 * @return array
	 */
	public function editWater($param){
		$this->tableName = 'ST_SWSINF_B';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STNM', 'require', '测站名称必须填写！'),
			array('STCT', 'require', '测站类别必须选择！'),
			array('WATP', 'require', '水域类型必须选择！'),
			array('LGTD', 'require', '测站经度必须填写！'),
			array('LTTD', 'require', '测站纬度必须填写！'),
		);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'save',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'data'		=> $param['data'],
			'msg'		=> '水质测站数据修改成功！'
		));
	}

	/**
	 * 查询指定记录的水质测站数据
	 * @param $param
	 * @return array
	 */
	public function infoWater($param){
		$this->tableName = 'ST_SWSINF_B';
		return $this->curd(array(
			'type'		=> 'find',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'msg'		=> '水质测站数据查询成功！'
		));
	}

	/**
	 * 删除水质测站数据
	 * @param $param
	 * @return array
	 */
	public function delWater($param){
		$this->tableName = 'ST_SWSINF_B';
		return $this->curd(array(
			'type'		=> 'delete',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'msg'		=> '水质测站数据删除成功！'
		));
	}

	/**
	 * 获得所有水质测站数据记录
	 * @return array
	 */
	public function listWater(){
		$this->tableName = 'ST_SWSINF_B';
		return $this->curd(array(
			'type'	=> 'select',
			'msg'	=> '成功获得所有水质测站数据记录'
		));
	}

	/**
	 * 添加测站基础信息
	 * @param $param
	 * @return array
	 */
	public function stationAdd($param){
		$this->tableName = 'ST_STBPRP_B';
		$validate_base = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
			array('STNM', 'require', '测站名称必须填写！'),
			array('STNM', '', '测站名称已经存在！', 0, 'unique', 1),
			array('STTP', 'require', '测站类别必须选择！'),
			array('STLC', 'require', '测站详细地址必须填写！'),
			array('LGTD', 'require', '测站经度必须填写！'),
			array('LTTD', 'require', '测站纬度必须填写！'),
		);
		$validate_task = array(
			array('OFFICER', 'require', '测站联系人必须填写！'),
			array('MPHONE', 'require', '测站联系人的手机号码必须填写！'),
		);
		$data = $param['data'];
		$data['STBPRP']['MODITIME'] = date("Y-m-d H:i:s");
		$base = $this->curd(array(
			'validate'	=> $validate_base,
			'type'		=> 'add',
			'data'		=> $data['STBPRP'],
			'msg'		=> '测站数据添加成功！'
		));
		if($base['type'] == 'Success'){
			$data['STSMTASK']['STCD'] = $data['STBPRP']['STCD'];
			$data['STSMTASK']['MODITIME'] = date("Y-m-d H:i:s");
			$task = $this->curd(array(
				'validate'	=> $validate_task,
				'type'		=> 'add',
				'data'		=> $data['STSMTASK'],
				'msg'		=> '测站报送任务数据添加成功！'
			));
			if($task['type'] == 'Suceess'){
				switch ($data['STBPRP']['STTP']){
					case 'MM':		// 气象站
					case 'PP':		// 雨量站
						$return = $base;
						break;
					case 'ZZ':		// 河道水位站
					case 'ZQ':		// 河道水文站
						$data['RVFCCH']['STCD'] = $data['STBPRP']['STCD'];
						$river = $this->addRVFCCH($data['RVFCCH']);
						if($river['type'] == 'Success'){
							if(is_array($data['ZQRL'])){
								$curve = $this->addZQRL($data['ZQRL'], $data['STBPRP']['STCD']);
								if($curve['type'] == 'Success')
									$return = $base;
								else
									$return = $curve;
							}else{
								$return = $base;
							}
						}else{
							$return = $river;
						}
						break;
					case 'DD':		// 堰闸水文站
						$data['WASRL']['STCD'] = $data['STBPRP']['STCD'];
						$WASRL = $this->addWASRL($data['WASRL']);
						if($WASRL['type'] == 'Success') $return = $base;
						else $return = $WASRL;
						break;
					case 'RR':		// 水库水文站
						$data['RSVRFCCH']['STCD'] = $data['STBPRP']['STCD'];
						$reservoir = $this->addRSVRFCCH($data['RSVRFCCH']);
						if($reservoir['type'] == 'Success'){
							$RSVRSTRL = $this->addRSVRSTRL($data['RSVRSTRL'], $data['STBPRP']['STCD']);
							if($RSVRSTRL['type'] == 'Success'){
								if(is_array($data['RSVRFSR'])){
									$this->addRSVRFSR($data['RSVRFSR'], $data['STBPRP']['STCD']);
								}
								if(is_array($data['ZVARL'])){
									$curve = $this->addZVARL($data['ZVARL'], $data['STBPRP']['STCD']);
									if($curve['type'] == 'Success')
										$return = $base;
									else
										$return = $curve;
								}else{
									$return = $base;
								}
							}else{
								$return = $RSVRSTRL;
							}
						}else{
							$return = $reservoir;
						}
						break;
					case 'SS':		// 墒情站
						$data['SOILCH']['STCD'] = $data['STBPRP']['STCD'];
						$SOILCH = $this->addSOILCH($data['SOILCH']);
						if($SOILCH['type'] == 'Success') $return = $base;
						else $return = $SOILCH;
						break;
					default:
				}
			}else{
				$return = $task;
			}
		}
		return $return;
	}

	/**
	 * 修改指定的测站数据
	 * @param $param
	 * @return array
	 */
	public function stationEdit($param){
		$this->tableName = 'ST_STBPRP_B';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STNM', 'require', '测站名称必须填写！'),
			array('STTP', 'require', '测站类别必须选择！'),
			array('STLC', 'require', '测站详细地址必须填写！'),
			array('LGTD', 'require', '测站经度必须填写！'),
			array('LTTD', 'require', '测站纬度必须填写！'),
		);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'save',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'data'		=> $param['data'],
			'msg'		=> '测站数据修改成功！'
		));
	}

	/**
	 * 删除指定的测站数据
	 * @param $param
	 * @return array
	 */
	public function stationDel($param){
		$this->tableName = 'ST_STBPRP_B';
		return $this->curd(array(
			'type'		=> 'delete',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'msg'		=> '测站数据删除成功！'
		));
	}

	/**
	 * 查询指定的测站数据
	 * @param $param
	 * @return array
	 */
	public function stationInfo($param){
		$this->tableName = 'ST_STBPRP_B';
		return $this->curd(array(
			'type'		=> 'find',
			'where'		=> array('[STCD]' => $param['data']['STCD']),
			'msg'		=> '测站数据查询成功！'
		));
	}

	/**
	 * 获得所有测站数据记录
	 * @return array
	 */
	public function stationList($param=null){
		$this->tableName = 'ST_STBPRP_B';
		return $this->curd(array(
			'type'	=> 'select',
			'where'	=> is_null($param)?'STCD<>"0"':$param['data'],
			'msg'	=> '成功获得所有测站数据记录'
		));
	}

	/**
	 * 新增河道防洪指标
	 * @param $param
	 * @return array
	 */
	protected function addRVFCCH($param){
		$this->tableName = 'ST_RVFCCH_B';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
		);
		$param['MODITIME'] = date("Y-m-d H:i:s");
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $param,
			'msg'		=> '河道防洪指标数据添加成功！'
		));
	}

	/**
	 * 新增库湖防汛指标数据
	 * @param $param
	 * @return array
	 */
	protected function addRSVRFCCH($param){
		$this->tableName = 'ST_RSVRFCCH_B';
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
		);
		$param['MODITIME'] = date("Y-m-d H:i:s");
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $param,
			'msg'		=> '库湖防汛指标数据添加成功！'
		));
	}

	/**
	 * 新增水位流量关系曲线
	 * @param $param
	 * @param $stcd
	 * @param string $table
	 * @return array
	 */
	protected function addZQRL($param, $stcd, $table='ST_ZQRL_B'){
		$this->tableName = $table;
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
		);
		foreach($param AS $key => $val){
			$data[$key] = $val;
			$data[$key]['STCD'] = $stcd;
			$data[$key]['MODITIME'] = date("Y-m-d H:i:s");
		}
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'addAll',
			'data'		=> $data,
			'msg'		=> '测站数据添加成功！'
		));
	}

	/**
	 * 新增水库库容关系曲线
	 * @param $param
	 * @param $stcd
	 * @return array
	 */
	protected function addZVARL($param, $stcd){
		return $this->addZQRL($param, $stcd, 'ST_ZVARL_B');
	}

	/**
	 * 新增堰闸关系数据
	 * @param $param
	 * @return array
	 */
	protected function addWASRL($param){
		$this->tableName - 'ST_WASRL_B';
		$param['MODITIME'] = date("Y-m-d H:i:s");
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
			array('RLSTCD', 'require', '关联测站代码必须填写！'),
			array('RLMRK', 'require', '堰闸关系标志必须填写！'),
		);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $param,
			'msg'		=> '测站堰闸关系数据添加成功！'
		));
	}

	/**
	 * 测站土壤墒情特征值
	 * @param $param
	 * @return array
	 */
	protected function addSOILCH($param){
		$this->tableName - 'ST_SOILCH_B';
		$param['MODITIME'] = date("Y-m-d H:i:s");
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
		);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $param,
			'msg'		=> '测站土壤墒情特征值数据添加成功！'
		));
	}

	/**
	 * 库（湖）站汛限水位
	 * @param $param
	 * @param $stcd
	 * @return array
	 */
	protected function addRSVRFSR($param, $stcd){
		$this->tableName - 'ST_RSVRFSR_B';
		foreach($param AS $key => $val){
			$data[$key] = $val;
			$data[$key]['STCD'] = $stcd;
			$data[$key]['MODITIME'] = date("Y-m-d H:i:s");
		}
		return $this->curd(array(
			'type'		=> 'addAll',
			'data'		=> $data,
			'msg'		=> '测站数据添加成功！'
		));
	}

	/**
	 * 测站库（湖）站关系
	 * @param $param
	 * @param $stcd
	 * @return array
	 */
	protected function addRSVRSTRL($param, $stcd){
		$this->tableName - 'ST_RSVRSTRL_B';
		$data = array(
			'STCD'		=> $stcd,
			'IOMRK'		=> $param['IOMRK'],
			'RLSTCD'	=> ($param['RLSTCD'])?$param['RLSTCD']:$stcd,
			'MODITIME'	=> date("Y-m-d H:i:s")
		);
		$validate = array(
			array('STCD', 'require', '测站代码必须填写！'),
			array('STCD', '', '测站代码已经存在！', 0, 'unique', 1),
		);
		return $this->curd(array(
			'validate'	=> $validate,
			'type'		=> 'add',
			'data'		=> $data,
			'msg'		=> '测站库（湖）站关系数据添加成功！'
		));
	}
}