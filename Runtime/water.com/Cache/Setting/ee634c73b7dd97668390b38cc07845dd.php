<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="../Client/node_modules/bootswatch/slate/bootstrap.min.css">
	<title><?php echo ($nav["home"]["title"]); ?></title>
</head>
<body>
<div class="container">
	<div cg-busy="myPromise"></div>
	<div class="row">
		<div class="col-md-1">
			<div class="btn-group" uib-dropdown is-open="status.isopen" style="margin-top: 15px;">
				<button id="single-button" type="button" class="btn btn-primary btn-block" uib-dropdown-toggle ng-disabled="disabled">
					系统功能列表 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" uib-dropdown-menu role="menu" aria-labelledby="single-button">
					<li role="menuitem"><a href="<?php echo U('Station/index');?>">测站管理</a></li>
					<li role="menuitem"><a href="#">Another action</a></li>
					<li role="menuitem"><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li role="menuitem"><a href="#">Separated link</a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-11">
			<h1><?php echo ($nav["library"]["title"]); ?> <small>Subtext for header</small></h1>
		</div>
	</div>
	<ol class="breadcrumb">
		<li><a href="<?php echo ($nav["home"]["url"]); ?>"><?php echo ($nav["home"]["title"]); ?></a></li>
		<?php if(isset($nav["sublib"])): ?><li><a href="<?php echo ($nav["library"]["url"]); ?>"><?php echo ($nav["library"]["title"]); ?></a></li>
			<li class="active"><?php echo ($nav["sublib"]["title"]); ?></li>
		<?php else: ?>
			<li class="active"><?php echo ($nav["library"]["title"]); ?></li><?php endif; ?>
	</ol>
	<div class="row" ng-controller="<?php echo ($ctrl); ?>Ctrl">
		<div class="col-md-12">
	<div class="panel panel-warning">
		<div class="panel-heading">
			<i class="fa fa-plus-circle"></i> 添加新的{{tab.heading}}监测站
		</div>
		<div class="panel-body">
			<div cg-busy="{promise:promise, message: '请等待，正在向服务器请求数据...', backdrop:true, delay:0, minDuration:10}">
				<uib-tabset active="activeJustified" justified="true">
					<uib-tab index="0" heading="{{tab.STBPRP_title}}">
						<div class="well">
							<form class="form-horizontal" role="form" method="post" action="/Service/setting.php?s=/station/add.html">
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
								<div class="form-group">
									<label class="col-sm-2 control-label">经度</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.GTD" name="LGTD" placeholder="测站代表点所在地理位置的东经度">
									</div>
									<label class="col-sm-2 control-label">纬度</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.LTTD" name="LTTD" placeholder="测站代表点所在地理位置的北纬度">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">测站类别</label>
									<div class="col-sm-4">
										<select class="form-control" ng-model="station.STBPRP.STTP" name="STTP" ng-change="mySTTP()">
											<?php if(is_array($STTP)): foreach($STTP as $key=>$vo): if(isset($vo["selected"])): ?><option value="<?php echo ($vo["value"]); ?>" selected><?php echo ($vo["lable"]); ?></option>
													<?php else: ?>
													<option value="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
									<label class="col-sm-2 control-label">启用标志</label>
									<div class="col-sm-4 btn-group">
										<?php if(is_array($USFL)): foreach($USFL as $key=>$vo): ?><label class="btn btn-success" ng-model="station.STBPRP.USFL" uib-btn-radio="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></label><?php endforeach; endif; ?>
									</div>
								</div>
								<div class="form-group" ng-show="tab.DD_tab">
									<label class="col-sm-2 control-label">堰闸关系标志</label>
									<div class="col-sm-3 btn-group">
										<label class="btn btn-success" ng-model="station.WASRL.RLMRK" uib-btn-radio="'D'">闸下站</label>
										<label class="btn btn-success" ng-model="station.WASRL.RLMRK" uib-btn-radio="'U'">闸上站</label>
										<label class="btn btn-success" ng-model="station.WASRL.RLMRK" uib-btn-radio="'L'">同断面</label>
									</div>
									<div class="col-sm-3 btn-group">
										<label class="btn btn-success" ng-change="relevance()" ng-model="ajax.relev" uib-btn-radio="0">关联河道
										</label>
										<label class="btn btn-success" ng-change="relevance()" ng-model="ajax.relev" uib-btn-radio="1">关联库（湖）</label>
									</div>
									<div class="col-sm-4">
										<select class="form-control" ng-model="station.WASRL.RLSTCD" name="RLSTCD" ng-options="item.label for item in RLSTCD track by item.value"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">测站联系人</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STSMTASK.OFFICER"
											   name="OFFICER" placeholder="测站联系人的姓名">
									</div>
									<label class="col-sm-2 control-label">联系人手机</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STSMTASK.MPHONE"
											   name="MPHONE" placeholder="测站联系人的手机号码">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">报送任务</label>
									<div class="col-sm-10">
										<?php if(is_array($TASK)): foreach($TASK as $key=>$vo): ?><div class="col-md-3">
												<label class="checkbox-inline">
													<input type="checkbox" value="1" ng-model="station.STSMTASK.<?php echo ($vo["value"]); ?>" name="<?php echo ($vo["value"]); ?>">
													<?php echo ($vo["lable"]); ?>
												</label>
											</div><?php endforeach; endif; ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">测站地址</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" ng-model="station.STBPRP.STLC" name="STLC" placeholder="测站代表点所在地县级以下详细地址">
									</div>
								</div>
								<!--<div class="form-group">
									<label class="col-sm-2 control-label">河流名称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.RVNM" name="RVNM" placeholder="测站所属河流的中文名称">
									</div>
									<label class="col-sm-2 control-label">水系名称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.HNNM" name="HNNM" placeholder="测站所属水系的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">流域名称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.BSNM" name="BSNM" placeholder="测站所属流域的中文名称">
									</div>
									<label class="col-sm-2 control-label">测站岸别</label>
									<div class="col-sm-4">
										<select class="form-control" ng-model="station.STBPRP.STBK" name="STBK">
											<?php if(is_array($STBK)): foreach($STBK as $key=>$vo): if(isset($vo["selected"])): ?><option value="<?php echo ($vo["value"]); ?>" selected><?php echo ($vo["lable"]); ?></option>
													<?php else: ?>
													<option value="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">测站方位</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.STAZT" name="STAZT" placeholder="测站岸边面向测验断面所处的方位，单位为度">
									</div>
									<label class="col-sm-2 control-label">至河口距离</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.DSTRVM" name="DSTRVM" placeholder="自测站基本水尺断面至该河直接汇入的河、库、湖、海汇合口的河流长度，灌渠 或无尾河取空值">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">基面名称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.DTMNM" name="DTMNM" placeholder="站观测水位时所采用的基面高程系的名称">
									</div>
									<label class="col-sm-2 control-label">基面高程</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.DTMEL" name="DTMEL" placeholder="测站观测水位时所采用基面高程系的基准面与该水文站所在流域的基准高程系基准
		面的高差">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">基面修正值</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.DTPR" name="DTPR" placeholder="测站基于基面高程的水位值，遇水位断面沉降等因素影响需要设置基面修正值来
		修正水位为基面高程">
									</div>
									<label class="col-sm-2 control-label">集水面积</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.DRNA" name="DRNA" placeholder="测站上游由该站控制的流域面积">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">建站年月</label>
									<div class="col-sm-4">
										<p class="input-group">
											<input type="text" class="form-control" uib-datepicker-popup="YYYY/MM" name="ESSTYM" ng-model="station.STBPRP.ESSTYM" is-open="popup1.opened" 
												   placeholder="测站完成建站的时间" datepicker-options="dateOptions" ng-required="true" close-text="Close" alt-input-formats="altInputFormats" />
											<span class="input-group-btn">
												<button type="button" class="btn btn-default" ng-click="open1()"><i class="fa fa-calendar"></i></button>
											</span>
										</p>
									</div>
									<label class="col-sm-2 control-label">始报年月</label>
									<div class="col-sm-4">
										<p class="input-group">
											<input type="text" class="form-control" uib-datepicker-popup="YYYY/MM" ng-model="station.STBPRP.BGFRYM" name="BGFRYM" is-open="popup1.opened"
												   placeholder="测站建站后开始报汛的时间" datepicker-options="dateOptions" ng-required="true" close-text="Close" alt-input-formats="altInputFormats" />
											<span class="input-group-btn">
												<button type="button" class="btn btn-default" ng-click="open1()"><i class="fa fa-calendar"></i></button>
											</span>
										</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">拼音码</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" ng-model="station.STBPRP.PHCD" name="PHCD" placeholder="用于快速输入测站名称的编码，采用测站名称的汉语拼音首字母构成">
									</div>
									<label class="col-sm-2 control-label">报汛等级</label>
									<div class="col-sm-4">
										<select class="form-control" ng-model="station.STBPRP.FRGRD" name="FRGRD">
											<?php if(is_array($FRGRD)): foreach($FRGRD as $key=>$vo): if(isset($vo["selected"])): ?><option value="<?php echo ($vo["value"]); ?>" selected><?php echo ($vo["lable"]); ?></option>
													<?php else: ?>
													<option value="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">站址</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" ng-model="station.STBPRP.STLC" name="STLC" placeholder="测站代表点所在地县级以下详细地址">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">交换管理单位</label>
									<div class="col-sm-10">
										<select class="form-control" ng-model="station.STBPRP.LOCALITY" name="LOCALITY">
											<?php if(is_array($LOCALITY)): foreach($LOCALITY as $key=>$vo): if(isset($vo["selected"])): ?><option value="<?php echo ($vo["value"]); ?>" selected><?php echo ($vo["lable"]); ?></option>
													<?php else: ?>
													<option value="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">备注</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" ng-model="station.STBPRP.COMMENTS" name="COMMENTS" placeholder="用于记载该测站的一些描述性的文字，最长不超过 100 个汉字"></textarea>
									</div>
								</div>-->
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-5">
										<button type="button" class="btn btn-default btn-block" ng-hide="tab.step" ng-click="submit()">
											<i class="fa fa-check-circle"></i> 添加
										</button>
										<button type="button" class="btn btn-default btn-block" ng-show="tab.step" ng-click="nextStep()">
											<i class="fa fa-long-arrow-right"></i> 下一步
										</button>
									</div>
									<div class="col-sm-5">
										<a href="#" ng-click="jumpToUrl()" class="btn btn-info btn-block"><i class="fa fa-times-circle"></i> 取消</a>
									</div>
								</div>
							</form>
						</div>
					</uib-tab>
					<uib-tab index="1" heading="第二步 河道防洪指标、水文特征" ng-show="tab.ZQ_tab">
						<div class="well">
							<form class="form-horizontal" role="form" method="post" action="/Service/setting.php?s=/station/add.html">
								<div class="form-group">
									<label class="col-sm-3 control-label">左堤高程</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.LDKEL" name="LDKEL" placeholder="测站测验断面左岸防洪大堤与水位同基面的堤顶高程">
									</div>
									<label class="col-sm-3 control-label">右堤高程</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.RDKEL" name="RDKEL" placeholder="测站测验断面右岸防洪大堤与水位同基面的堤顶高程">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">警戒水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.WRZ" name="WRZ" placeholder="测站测验断面临河防洪大堤，根据堤防质量、渗流现象以及历年防汛情况，有可能
出险的洪水水位">
									</div>
									<label class="col-sm-3 control-label">警戒流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.WRQ" name="WRQ" placeholder="测站测验断面，根据堤防质量、渗流现象以及历年防汛情况，有可能出险的通过流
量">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">保证水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.GRZ" name="GRZ" placeholder="测站测验断面的防洪设计水位或历史上防御过的最高洪水位">
									</div>
									<label class="col-sm-3 control-label">保证流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.GRQ" name="GRQ" placeholder="测站测验断面的防洪设计通过流量或历史上防御过的最大通过流量">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">平滩流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.FLPQ" name="FLPQ" placeholder="在有河槽和滩地分布的河段，河水上涨出槽开始漫滩的临界流量">
									</div>
									<label class="col-sm-3 control-label">实测最高水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.OBHTZ" name="OBHTZ" placeholder="测站测验断面历史上实测到的最高洪水位">
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-3 control-label">实测最高水位出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.OBHTZTM" name="OBHTZTM" placeholder="实测最高洪水位的发生时间">
									</div>
									<label class="col-sm-3 control-label">调查最高水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.IVHZ" name="IVHZ" placeholder="调查最高水位的发生时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">调查最高水位出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.IVHZTM" name="IVHZTM" placeholder="调查最高水位的发生时间">
									</div>
									<label class="col-sm-3 control-label">实测最大流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.OBMXQ" name="OBMXQ" placeholder="测站测验断面历史上实测到的最大流量">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">实测最大流量出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.OBMXQTM" name="OBMXQTM" placeholder="实测最大流量的发生时间">
									</div>
									<label class="col-sm-3 control-label">调查最大流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.IVMXQ" name="IVMXQ" placeholder="调查到的测站测验断面历史上曾经发生洪水的最大流量">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">调查最大流量出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.IVMXQTM" name="IVMXQTM" placeholder="调查最大流量的发生时间">
									</div>
									<label class="col-sm-3 control-label">历史最大含沙量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HMXS" name="HMXS" placeholder="测站测验断面历史上实测到的最大含沙量">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最大含沙量出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HMXSTM" name="HMXSTM" placeholder="历史最大含沙量的发生时间">
									</div>
									<label class="col-sm-3 control-label">实测最大流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HMXAVV" name="HMXAVV" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最大断面平均流速出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HMXAVVTM" name="HMXAVVTM" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
									<label class="col-sm-3 control-label">历史最低水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HLZ" name="HLZ" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最低水位出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HLZTM" name="HLZTM" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
									<label class="col-sm-3 control-label">历史最小流量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HMNQ" name="HMNQ" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">大流量告警值</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.TAQ" name="TAQ" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
									<label class="col-sm-3 control-label">高水位告警值</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.TAZ" name="TAZ" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">低水位告警值</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.LAZ" name="低水位告警值" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
									<label class="col-sm-3 control-label">小流量告警值</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.LAQ" name="LAQ" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最小流量出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.HMNQTM" name="HMNQTM" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
									<label class="col-sm-3 control-label">测站编码</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.STCD0" name="STCD" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">启动预报水位标准</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.SFZ" name="SFZ" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
									<label class="col-sm-3 control-label">启动预报流量标准</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RVFCCH.SFQ" name="SFQ" placeholder="测站编码所代表测站的中文名称">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-5">
										<button type="button" class="btn btn-default btn-block" ng-show="tab.step" ng-click="nextStep(2)">
											<i class="fa fa-long-arrow-right"></i> 下一步
										</button>
									</div>
									<div class="col-sm-5">
										<a href="#" ng-click="jumpToUrl()" class="btn btn-info btn-block"><i class="fa fa-times-circle"></i> 取消</a>
									</div>
								</div>
							</form>
						</div>
					</uib-tab>
					<uib-tab index="2" heading="第三步 设置河道水位流量曲线" ng-show="tab.ZQ_tab">
						<div class="well" ng-controller="riverwayCurveCtrl">
	<table class="table table-bordered table-hover table-condensed">
		<caption>
			<div class="col md-4 col-md-offset-8">
				<div class="button btn btn-info btn-block" ngf-select ng-model="file" name="file"
					 ngf-max-size="5MB" ngf-min-height="100" ng-change="uploadFile()">
					<i class="fa fa-file-excel-o"></i> 选择Excal水位流量曲线数据文件
				</div>
			</div>
		</caption>
		<tr style="font-weight: bold" class="">
			<th class="text-center vertical-center-30">曲线名称</th>
			<th class="text-center vertical-center-30">启用时间</th>
			<th class="text-center vertical-center-30">点序号</th>
			<th class="text-center vertical-center-30">水位</th>
			<th class="text-center vertical-center-30">流量</th>
			<th class="text-center vertical-center-30">备注</th>
			<th class="text-center col-md-2 vertical-center-30">
				<button type="button" class="btn btn-default btn-block btn-sm" ng-click="addRiverwayCurve()">
					<i class="fa fa-plus-circle"></i> 添加曲线数据
				</button>
			</th>
		</tr>
		<tr ng-repeat="val in ZQRL">
			<td class="vertical-center-30">
				<span editable-text="val.LNNM" e-name="LNNM" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.LNNM||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-date="val.BGTM" e-name="BGTM" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.BGTM||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.PTNO" e-name="PTNO" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.PTNO||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.Z" e-name="Z" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.Z||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.Q" e-name="Q" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.Q||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-text="val.COMMENTS" e-name="COMMENTS" e-form="rowform" 
					  onbeforesave="checkName($data, val.id)">
					{{val.COMMENTS||'empty'}}
				</span>
			</td>
			<td style="white-space: nowrap" class="text-center">
				<form editable-form name="rowform" onbeforesave="saveUser($data, val.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == val">
					<button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary"><i class="fa fa-check-circle"></i> 保存</button>
					<button type="button" ng-disabled="rowform.$waiting" ng-click="rowform.$cancel()" class="btn btn-default"><i class="fa fa-minus-circle"></i> 取消</button>
				</form>
				<div class="buttons vertical-center-30" ng-show="!rowform.$visible">
					<button type="button" class="btn btn-sm btn-primary" ng-click="rowform.$show()"><i class="fa fa-edit"></i> 编辑</button>
					<button type="button" class="btn btn-sm btn-danger" ng-click="removeUser($index)"><i class="fa fa-trash"></i> 删除</button>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<nav class="row" style="margin-right: 5px;">
					<ul class="pagination pagination-sm pull-right" style="margin: 0; padding-right: 10px;">
						<li><a href="#">第一页</a></li>
						<li><a href="#">上一页</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">下一页</a></li>
						<li><a href="#">最后一页</a></li>
					</ul>
				</nav>
			</td>
		</tr>
	</table>
</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-5">
								<button type="button" class="btn btn-default btn-block" ng-click="submit()">
									<i class="fa fa-check-circle"></i> 添加
								</button>
							</div>
							<div class="col-sm-5">
								<a href="#" ng-click="jumpToUrl()" class="btn btn-info btn-block"><i class="fa fa-times-circle"></i> 取消</a>
							</div>
						</div>
					</uib-tab>
					<uib-tab index="3" heading="第二步 库(湖)防洪指标、水文特征" ng-show="tab.RR_tab">
						<div class="well">
							<form class="form-horizontal" role="form" method="post" action="/Service/setting.php?s=/station/add.html">
								<div class="form-group">
									<label class="col-sm-3 control-label">水库类型</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.RSVRTP" name="RSVRTP" placeholder="测站编码所代表测站的中文名称">
									</div>
									<label class="col-sm-3 control-label">坝顶高程</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.DAMEL" name="DAMEL" placeholder="坝顶高程">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">校核洪水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.CKFLZ" name="CKFLZ" placeholder="校核洪水位">
									</div>
									<label class="col-sm-3 control-label">设计洪水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.DSFLZ" name="DSFLZ" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">正常高水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.NORMZ" name="NORMZ" placeholder="测站编码所代表测站的中文名称">
									</div>
									<label class="col-sm-3 control-label">死水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.DDZ" name="DDZ" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">兴利水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.ACTZ" name="ACTZ" placeholder="测站编码所代表测站的中文名称">
									</div>
									<label class="col-sm-3 control-label">总库容</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.TTCP" name="TTCP" placeholder="具有唯一性，由数字和大写字母组成的8位字符串">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">防洪库容</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.FLDCP" name="FLDCP" placeholder="测站编码所代表测站的中文名称">
									</div>
									<label class="col-sm-3 control-label">兴利库容</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.ACTCP" name="ACTCP" placeholder="兴利库容">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">死库容</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.DDCP" name="DDCP" placeholder="测死库容">
									</div>
									<label class="col-sm-3 control-label">历史最高库水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HHRZ" name="HHRZ" placeholder="历史最高库水位">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最大蓄水量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HMXW" name="HMXW" placeholder="历史最大蓄水量">
									</div>
									<label class="col-sm-3 control-label">历史最高库水位出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HHRZTM" name="HHRZTM" placeholder="历史最高库水位出现时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最大入流时段长</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.RSTDR" name="RSTDR" placeholder="历史最大入流时段长">
									</div>
									<label class="col-sm-3 control-label">历史最大入流出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HMXOTQ" name="HMXOTQ" placeholder="历史最大入流出现时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最大出流</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HMXOTQ" name="HMXOTQ" placeholder="历史最大出流">
									</div>
									<label class="col-sm-3 control-label">历史最大出流出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HMXOTQTM" name="HMXOTQTM" placeholder="历史最大出流出现时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最低库水位</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HLRZ" name="HLRZ" placeholder="历史最低库水位">
									</div>
									<label class="col-sm-3 control-label">历史最低库水位出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HLRZTM" name="HLRZTM" placeholder="历史最低库水位出现时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">历史最小日均入流</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HMNINQ" name="HMNINQ" placeholder="历史最大出流">
									</div>
									<label class="col-sm-3 control-label">历史最小日均入流出现时间</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.HMNINQTM" name="HMNINQTM" placeholder="历史最小日均入流出现时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">低水位告警值</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.LAZ" name="LAZ" placeholder="低水位告警值">
									</div>
									<label class="col-sm-3 control-label">启动预报流量标准</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.RSVRFCCH.SFQ" name="SFQ" placeholder="启动预报流量标准">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-5">
										<button type="button" class="btn btn-default btn-block" ng-show="tab.step" ng-click="nextStep(4)">
											<i class="fa fa-long-arrow-right"></i> 下一步
										</button>
									</div>
									<div class="col-sm-5">
										<a href="<?php echo U('station/lists');?>" class="btn btn-info btn-block"><i class="fa fa-times-circle"></i> 取消</a>
									</div>
								</div>
							</form>
						</div>
					</uib-tab>
					<uib-tab index="4" heading="第三步 设置库(湖)容量曲线" ng-show="tab.RR_tab">
						<style>
	.vertical-center-30 {line-height:30px!important;}
</style>
<div class="well" ng-controller="reservoirCurveCtrl">
	<table class="table table-bordered table-hover table-condensed">
		<caption>
			<div class="col md-4 col-md-offset-8">
				<div class="button btn btn-info btn-block" ngf-select ng-model="file" name="file"
					 ngf-max-size="5MB" ngf-min-height="100" ng-change="uploadFile()">
					<i class="fa fa-file-excel-o"></i> 选择Excal库容曲线数据文件
				</div>
			</div>
		</caption>
		<tr style="font-weight: bold" class="">
			<th class="text-center col-md-2 vertical-center-30" >实施时间</th>
			<th class="text-center col-md-2 vertical-center-30" >点序号</th>
			<th class="text-center col-md-2 vertical-center-30" >库水位</th>
			<th class="text-center col-md-2 vertical-center-30" >蓄水量</th>
			<th class="text-center col-md-2 vertical-center-30" >水面面积</th>
			<th class="text-center col-md-2 vertical-center-30">
				<button type="button" class="btn btn-default btn-block btn-sm" ng-click="addReservoirCurve()">
					<i class="fa fa-plus-circle"></i> 添加曲线数据
				</button>
			</th>
		</tr>
		<tr ng-repeat="val in ZQRL">
			<td class="vertical-center-30">
				<span editable-date="val.MSTM" e-name="MSTM" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.MSTM||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.PTNO" e-name="PTNO" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.PTNO||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.RZ" e-name="RZ" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.RZ||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.W" e-name="W" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.W||'empty'}}
				</span>
			</td>
			<td class="vertical-center-30">
				<span editable-number="val.WSFA" e-name="WSFA" e-form="rowform" onbeforesave="checkName($data, val.id)">
					{{val.WSFA||'empty'}}
				</span>
			</td>
			<td style="white-space: nowrap" class="text-center">
				<form editable-form name="rowform" onbeforesave="saveUser($data, val.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == val">
					<button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary"><i class="fa fa-check-circle"></i> 保存</button>
					<button type="button" ng-disabled="rowform.$waiting" ng-click="rowform.$cancel()" class="btn btn-default"><i class="fa fa-minus-circle"></i> 取消</button>
				</form>
				<div class="buttons vertical-center-30" ng-show="!rowform.$visible">
					<button type="button" class="btn btn-sm btn-primary" ng-click="rowform.$show()"><i class="fa fa-edit"></i> 编辑</button>
					<button type="button" class="btn btn-sm btn-danger" ng-click="removeUser($index)"><i class="fa fa-trash"></i> 删除</button>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<nav class="row" style="margin-right: 5px;">
					<ul class="pagination pagination-sm pull-right" style="margin: 0; padding-right: 10px;">
						<li><a href="#">第一页</a></li>
						<li><a href="#">上一页</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">下一页</a></li>
						<li><a href="#">最后一页</a></li>
					</ul>
				</nav>
			</td>
		</tr>
	</table>
</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-5">
								<button type="button" class="btn btn-default btn-block" ng-click="submit()">
									<i class="fa fa-check-circle"></i> 添加
								</button>
							</div>
							<div class="col-sm-5">
								<a href="#" ng-click="jumpToUrl()" class="btn btn-info btn-block"><i class="fa fa-times-circle"></i> 取消</a>
							</div>
						</div>
					</uib-tab>
					<uib-tab index="5" heading="第二步 设置墒情特征值" ng-show="tab.SS_tab">
						<div class="well">
							<form class="form-horizontal" role="form" method="post" action="/Service/setting.php?s=/station/add.html">
								<div class="form-group">
									<label class="col-sm-3 control-label">土壤类别</label>
									<div class="col-sm-3">
										<select class="form-control" ng-model="station.SOILCH.SLTP" name="SLTP">
											<?php if(is_array($SLTP)): foreach($SLTP as $key=>$vo): if(isset($vo["selected"])): ?><option value="<?php echo ($vo["value"]); ?>" selected><?php echo ($vo["lable"]); ?></option>
													<?php else: ?>
													<option value="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
									<label class="col-sm-3 control-label">土壤质地</label>
									<div class="col-sm-3">
										<select class="form-control" ng-model="station.SOILCH.SLTX" name="SLTX">
											<?php if(is_array($SLTX)): foreach($SLTX as $key=>$vo): if(isset($vo["selected"])): ?><option value="<?php echo ($vo["value"]); ?>" selected><?php echo ($vo["lable"]); ?></option>
													<?php else: ?>
													<option value="<?php echo ($vo["value"]); ?>"><?php echo ($vo["lable"]); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">土壤结构</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.SFBR" name="SFBR" placeholder="描述土壤为何种结构层次">
									</div>
									<label class="col-sm-3 control-label">土壤比重</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.SSPG" name="SSPG" placeholder="描述土壤比重">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">土壤干容重</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.DSD" name="DSD" placeholder="描述土壤干容重">
									</div>
									<label class="col-sm-3 control-label">土壤孔隙度</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.SPOR" name="SPOR" placeholder="描述土壤孔隙度">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">饱和含水量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.SHWC" name="SHWC" placeholder="描述饱和含水量">
									</div>
									<label class="col-sm-3 control-label">田间持水量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.FDCP" name="FDCP" placeholder="描述田间持水量">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">凋萎含水量</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.WLCP" name="WLCP" placeholder="描述凋萎含水量">
									</div>
									<label class="col-sm-3 control-label">备注</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" ng-model="station.SOILCH.COMMENTS" name="COMMENTS" placeholder="土壤墒情备注信息">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-5">
										<button type="button" class="btn btn-default btn-block" ng-click="submit()"><i class="fa fa-check-circle"></i> 添加</button>
									</div>
									<div class="col-sm-5">
										<a href="<?php echo U('station/lists');?>" class="btn btn-info btn-block"><i class="fa fa-times-circle"></i> 取消</a>
									</div>
								</div>
							</form>
						</div>
					</uib-tab>
				</uib-tabset>
			</div>
		</div>
	</div>
</div>
	</div>
</div>
<script type="text/javascript" src="../Client/node_modules/requirejs/require.js"
		data-main="../Client/node_modules/require_conf"
		data-container="<?php echo (MODULE_NAME); ?>_<?php echo ($ctrl); ?>"></script>
</body>
</html>