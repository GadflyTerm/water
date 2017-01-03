<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2017/1/3
 * Time: 下午2:06
 */

namespace Restful\Model;
use Think\Model\ViewModel;

class WaterSamplingModel extends ViewModel{
	public $viewFields = array(
		'StAwqmdD' => 'STCD, ANOMALY, TM',
		'StSwsinfB'	=> 'STCD, STNM, STCT, WATP, WSFL',
		'_on'=>'StAwqmdD.[STCD]=StSwsinfB.[STCD]'
	);
}