<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/16
 * Time: 下午9:23
 */

namespace Setting\Model;
use Think\Model;

class StationModel extends Model{
	protected $trueTableName = 'ST_STBPRP_B';
	protected $_auto = array(
		array('STCD', 'randstr', 1, 'function'),
		array('LOCALITY', 33, 1),
		array('MODITIME', 'time', 1, 'function'),
	);
	protected $_validate = array(
		array('STNM', 'require', '测站名称必须填写！'),
		array('LGTD', 'require', '经度必须填写！'),
		array('LTTD', 'require', '纬度必须填写！'),
		array('STLC', 'require', '测站站址必须填写！'),
	);
	
	public function addStation(){
		if (!$this->create()){
			return array('errcode' => 0, 'msg' => $this->getError());
		}else{
			if($this->add()) return array('errcode' => 1, 'msg' => '成功添加新的检测站');
			else return array('errcode' => 0, 'msg' => '添加新的检测站失败');
		}
	}
	
	public function editStation(){
		if (!$this->create()){
			return array('errcode' => 0, 'msg' => $this->getError());
		}else{
			if($this->where('id='.I('get.pk'))->save()) return array('errcode' => 1, 'msg' => '成功编辑检测站');
			else return array('errcode' => 0, 'msg' => '编辑检测站失败');
		}
	}
	
	public function delStation(){
		if($this->where('id='.I('get.pk'))->delete())
			return array('errcode' => 1, 'msg' => '成功删除检测站');
		else
			return array('errcode' => 0, 'msg' => '删除检测站失败');
	}
	
	public function listStation(){
		return $this->page(I('get.p', 1), 25)->select();
	}
	
	public function infoStation(){
		return $this->where('id='.I('get.pk'))->find();
	}
}