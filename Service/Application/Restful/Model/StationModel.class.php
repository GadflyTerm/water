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
			'type'		=> 'save',
			'where'		=> '[STCD]="'.$param['data']['STCD'].'"',
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
			'where'		=> '[STCD]="'.$param['data']['STCD'].'"',
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
			'where'		=> '[STCD]="'.$param['data']['STCD'].'"',
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
		));
	}
}