<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/6
 * Time: 下午1:24
 */

namespace Restful\Model;
use Think\Model;

class StationModel extends Model{
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
}