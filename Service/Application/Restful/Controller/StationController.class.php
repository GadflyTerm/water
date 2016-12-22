<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/12
 * Time: 下午12:54
 */

namespace Restful\Controller;


use think\Controller;
use Think\Storage\Driver\File;

class StationController extends Controller{
	public function getLists($param){
		switch ($param['op']){
			case 'GetZZlist':
				return array(
					'type'	=> 'Success',
					'msg'	=> '河道测站数据列表读取成功！',
					'data'	=> array(
						array('label' => '请选择所关联的河道测站'),
						array('label' => '测试用河道一', 'value' => 'hd1'),
						array('label' => '测试用河道二', 'value' => 'hd2'),
						array('label' => '测试用河道三', 'value' => 'hd3'),
						array('label' => '测试用河道四', 'value' => 'hd4'),
					)
				);
			case 'GetRRlist':
				return array(
					'type'	=> 'Success',
					'msg'	=> '水库测站数据列表读取成功！',
					'data'	=> array(
						array('label' => '请选择所关联的水库测站'),
						array('label' => '测试用水库一', 'value' => 'sk1'),
						array('label' => '测试用水库二', 'value' => 'sk2'),
						array('label' => '测试用水库三', 'value' => 'sk3'),
						array('label' => '测试用水库四', 'value' => 'sk4'),
						array('label' => '测试用水库五', 'value' => 'sk5'),
						array('label' => '测试用水库六', 'value' => 'sk6'),
					)
				);
			case 'WaterStandard':
				$File = new File();
				$filename = APP_ROOT.'Data/WaterStandard.json';
				if($File->has($filename)) {
					return array(
						'type'	=> 'Success',
						'msg'	=> '水库测站数据列表读取成功！',
						'data'	=> json_decode($File->read($filename), true),
						'file'	=> $filename,
					);
				}else{
					return array(
						'type'	=> 'Success',
						'msg'	=> '水质异常参照标准数据读取成功！',
						'data'	=> array(
							array('label' => '水温', 'field' => 'WT', 'min' => 2, 'value' => 25, 'prickle' => '℃', 'status' => 1),
							array('label' => 'pH值', 'field' => 'PH', 'min' => 5.5, 'value' => 8.5, 'prickle' => '', 'status' => 1),
							array('label' => '五日生化需氧量', 'field' => 'BOD5', 'min' => 15, 'value' => 40, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '化学需氧量', 'field' => 'CODCR', 'min' => 60, 'value' => 100, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '悬浮物', 'field' => 'SS', 'min' => 15, 'value' => 60, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '阴离子表面活性剂', 'field' => 'LAS', 'min' => 0, 'value' => 5, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '全盐量', 'field' => 'SO', 'min' => 0, 'value' => 1000, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '氯化物', 'field' => 'CL', 'min' => 0, 'value' => 350, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '硫化物', 'field' => 'S2', 'min' => 0, 'value' => 1, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总汞', 'field' => 'HG', 'min' => 0, 'value' => 0.001, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总镉', 'field' => 'CD', 'min' => 0, 'value' => 0.01, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总砷', 'field' => 'ARS', 'min' => 0, 'value' => 0.05, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '六价铬', 'field' => 'CR6', 'min' => 0, 'value' => 0.1, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总铅', 'field' => 'PB', 'min' => 0, 'value' => 0.2, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总铜', 'field' => 'CU', 'min' => 0, 'value' => 1, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总锌', 'field' => 'ZN', 'min' => 0, 'value' => 2, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '总硒', 'field' => 'SE', 'min' => 0, 'value' => 0.02, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '氟化物', 'field' => 'F', 'min' => 0, 'value' => 2, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '氰化物', 'field' => 'CN', 'min' => 0, 'value' => 0.5, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '石油类', 'field' => 'OIL', 'min' => 0, 'value' => 1, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '挥发酚', 'field' => 'VLPH', 'min' => 0, 'value' => 1, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '苯', 'field' => 'BEN', 'min' => 0, 'value' => 2.5, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '三氯乙醛', 'field' => 'SLYQ', 'min' => 0, 'value' => 0.5, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '丙烯醛', 'field' => 'BXQ', 'min' => 0, 'value' => 0.5, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '硼', 'field' => 'B', 'min' => 0, 'value' => 0.5, 'prickle' => 'mg/L', 'status' => 1),
							array('label' => '粪大肠菌群数', 'field' => 'FCG', 'min' => 1000, 'value' => 2000, 'prickle' => '个/L', 'status' => 1),
							array('label' => '蛔虫卵数', 'field' => 'AO', 'min' => 1, 'value' => 2, 'prickle' => '个/L', 'status' => 1),
						)
					);
				}
			default:
				return array(
					'type'	=> 'Success',
					'msg'	=> '数据操作成功！',
					'data'	=> $param,
				);
		}
	}
	
	public function setXediTable($param){
		switch ($param['op']){
			case 'WaterStandard':
				$File = new File();
				$filename = APP_ROOT.'Data/WaterStandard.json';
				if($File->has($filename)) $File->unlink($filename);
				if($File->put($filename, $param['data']))
					return array(
						'type'	=> 'Success',
						'msg'	=> '水库测站数据列表写入成功！',
						'data'	=> $File->read($filename),
					);
				else
					return array(
						'type'	=> 'Error',
						'msg'	=> '水库测站数据列表写入失败！',
					);
				break;
		}
	}
}