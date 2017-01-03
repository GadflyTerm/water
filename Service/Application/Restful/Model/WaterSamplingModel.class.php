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
		'StStbprpB' => 'STCD, ANOMALY, TM',
		'StSwsinfB'	=> 'STCD, STNM, STCT, WATP, WSFL',
		'_on'=>'StStbprpB.STCD=StSwsinfB.STCD'
	);
}