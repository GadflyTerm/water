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
						'data'	=> C('OPT.WaterStandard')
					);
				}
			case 'WaterStation':
				return array(
					'type'	=> 'Success',
					'msg'	=> '数据操作成功！',
					'data'	=> array(
						array('id'	=> 1,
							'STCD'	=> 'eerrtg45',
							'STNM'	=> '测试用水质测站',
							'STCT'	=> (string)1,
							'WATP'	=> (string)1,
							'LGTD'	=> 116.58548,
							'LTTD'	=> 89.436534634,
							'ASRL'	=> 235235,
							'WSFL'	=> '2')
					),
				);
			case 'WaterSampling':
				return array(
					'type'	=> 'Success',
					'msg'	=> '数据操作成功！',
					'data'	=> array(
						array(
							'id'		=> 1,
							'STCD'		=> 'eerrtg45',
							'STNM'		=> '测试用水质测站',
							'STCT'		=> (string)1,
							'WATP'		=> (string)1,
							'WSFL'		=> (string)2,
							'TM'		=> '2016-12-25 18:30:00',
							'anomaly'	=> null,
						)
					)
				);
			default:
				return array(
					'type'	=> 'Success',
					'msg'	=> 'Default-数据操作成功！',
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
	
	public function infoData($param){
		switch ($param['op']){
			case 'WaterStation':	//获取指定水质测站数据
				return array(
					'type'		=> 'Success',
					'msg'		=> '水质测站数据查询成功！',
					'data'		=> array(
						'id'	=> 1,
						'STCD'	=> 'eerrtg45',
						'STNM'	=> 'dfhdfhdfhdfh',
						'STCT'	=> '1',
						'WATP'	=> '1',
						'LGTD'	=> 116.58548,
						'LTTD'	=> 89.436534634,
						'ASRL'	=> 235235,
						'WSFL'	=> '2'
					)
				);
			case 'WaterSampling':	// 获取指定水质采样数据
				$station = $this->getLists(array('op' => 'WaterStation'));
				return array(
					'type'		=> 'Success',
					'msg'		=> '水质采样数据查询成功！',
					'station'	=> $station['data'],
					'data'		=> array(
						'id'		=> 1,
						'STCD'		=> 'eerrtg45',
						'TM'		=> date('Y-m-d H:i:s'),
						'CODCR'		=> 0.25,
						'LAS'		=> 0.26,
						'SLYQ'		=> 0.27,
						'AO'		=> 289,
						'BOD5'		=> 0.28,
						'FCG'		=> 529,
						'WT'		=> 28,
						'PH'		=> 6.2,
						'HG'		=> 0.29,
						'CD'		=> 0.31,
						'ARS'		=> 0.32,
						'PB'		=> 0.33,
						'CU'		=> 0.34,
						'ZN'		=> 0.35,
						'SE'		=> 0.36,
						'S2'		=> 0.37,
						'SS'		=> 0.38,
						'SO'		=> 0.39,
						'CL'		=> 0.41,
						'CR6'		=> 0.42,
						'F'			=> 0.43,
						'BXQ'		=> 0.44,
						'BEN'		=> 0.45,
						'B'			=> 0.46,
						'CN'		=> 0.47,
						'OIL'		=> 0.48,
						'SE'		=> 0.49,
					)
				);
		}
	}
	
	public function addData($param){
		$data = json_decode($param['data'], true);
		switch ($param['op']){
			case 'WaterStation':
				return array(
					'type'	=> 'Success',
					'msg'	=> '水质测站数据添加成功！',
					'data'	=> array(
						'id'	=> 1,
						'STCD'	=> $data['STCD'],
						'STNM'	=> $data['STNM'],
						'STCT'	=> $data['STCT'],
						'WATP'	=> $data['WATP'],
						'LGTD'	=> $data['LGTD'],
						'LTTD'	=> $data['LTTD'],
					)
				);
			case 'WaterSampling':
				return array(
					'type'	=> 'Success',
					'msg'	=> '水质监测数据添加成功！',
					'data'	=> array(
						'id'	=> 2,
						'STCD'	=> $data['STCD'],
						'STNM'	=> $data['STNM'],
						'STCT'	=> $data['STCT'],
						'WATP'	=> $data['WATP'],
						'WSFL'	=> $data['WSFL'],
						'TM'	=> $data['TM'],
					)
				);
		}
	}
	
	public function editData($param){
		switch ($param['op']){
			case 'WaterStation':
				$data = json_decode($param['data'], true);
				return array(
					'type'	=> 'Success',
					'msg'	=> '水库测站数据编辑成功！',
					'data'	=> array(
						'id'	=> $data['id'],
						'STCD'	=> $data['STCD'],
						'STNM'	=> $data['STNM'],
						'STCT'	=> $data['STCT'],
						'WATP'	=> $data['WATP'],
						'LGTD'	=> $data['LGTD'],
						'LTTD'	=> $data['LTTD'],
					)
				);
		}
	}
	
	public function delData($param){
		switch ($param['op']){
			case 'WaterStation':
				return array(
					'type'	=> 'Success',
					'msg'	=> '水库测站数据删除成功！'.$param['data'],
					'data'	=> array()
				);
		}
	}
	
	protected function is_anomaly($param){
		$File = new File();
		$filename = APP_ROOT.'Data/WaterStandard.json';
		$standard = json_decode($File->read($filename), true);
		$return = null;
		foreach ($param AS $key => $val){
			if($standard[$key]){
				if($standard[$key]['min'] > $val) 
					$return = array($key => 'down');
				elseif($val < $standard[$key]['value'])
					$return = array($key => 'up');
			}
		}
		return $return;
	}
}