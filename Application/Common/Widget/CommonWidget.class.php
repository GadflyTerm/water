<?php

/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/12/1
 * Time: 下午4:41
 */
namespace Common\Widget;
use Think\Controller;
class CommonWidget extends Controller{
	public function form($param, $pre){
		foreach ($param AS $val){
			foreach ($val AS $v){
				switch (count($v)){
					case 1:
						$lable = $v[0]['lable'];
						$model = $pre.'.'.$v[0]['name'];
						$html = <<<EOF
<div class="form-group">
	<label class="col-sm-2 control-label">$lable</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" ng-model="station.STBPRP.STNM" name="STNM" placeholder="测站编码所代表测站的中文名称">
	</div>
</div>
EOF;
						break;
					case 2:
						$html = <<<EOF
<div class="form-group">
	<label class="col-sm-2 control-label">测站编码</label>
	<div class="col-sm-4">
		<input type="text" class="form-control" ng-model="station.STBPRP.STCD" name="STCD" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
	</div>
	<label class="col-sm-2 control-label">测站名称</label>
	<div class="col-sm-4">
		<input type="text" class="form-control" ng-model="station.STBPRP.STNM" name="STNM" placeholder="测站编码所代表测站的中文名称">
	</div>
</div>
EOF;
						break;
					case 3:
						$html = <<<EOF
<div class="form-group">
	<label class="col-sm-2 control-label">测站编码</label>
	<div class="col-sm-2">
		<input type="text" class="form-control" ng-model="station.STBPRP.STCD" name="STCD" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
	</div>
	<label class="col-sm-2 control-label">测站名称</label>
	<div class="col-sm-2">
		<input type="text" class="form-control" ng-model="station.STBPRP.STNM" name="STNM" placeholder="测站编码所代表测站的中文名称">
	</div>
	<label class="col-sm-2 control-label">测站名称</label>
	<div class="col-sm-2">
		<input type="text" class="form-control" ng-model="station.STBPRP.STNM" name="STNM" placeholder="测站编码所代表测站的中文名称">
	</div>
</div>
EOF;
				}
			}
		}
		

	}
}