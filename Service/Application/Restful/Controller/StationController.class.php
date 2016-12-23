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
							'STNM'	=> 'dfhdfhdfhdfh',
							'STCT'	=> '1',
							'WATP'	=> '1',
							'LGTD'	=> 116.58548,
							'LTTD'	=> 89.436534634,
							'ASRL'	=> 235235,
							'WSFL'	=> '2')
					),
				);
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
	
	public function infoData($param){
		switch ($param['op']){
			case 'WaterStation':
				return array(
					'type'	=> 'Success',
					'msg'	=> '水库测站数据查询成功！',
					'data'	=> array(
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
		}
	}
	
	public function addData($param){
		switch ($param['op']){
			case 'WaterStation':
				$data = json_decode($param['data'], true);
				return array(
					'type'	=> 'Success',
					'msg'	=> '水库测站数据添加成功！',
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
}