/**
 * Created by gadfly on 2016/12/15.
 */
define(function (require){
	var app = require('../../app');
	require('ng_file_upload');
	app.useModule('ngFileUpload');
	app.controller('StationAddCtrl', function($scope, $window, $state, xhr){
		$scope.option = JSON.parse($window.sessionStorage.getItem("baseData"));
		$scope.$emit('nav', {
			home: {title: '检测站管理', url: 'Home'},
			library: {title: '检测站列表', url: 'StationIndex'},
			sublib: {title: '添加新的检测站', url: ''}
		});
		$scope.ajax = {
			relev: 2
		}
		$scope.station = {
			STBPRP: {
				USFL: 1
			},
			WASRL: {
				RLMRK: 'D'
			},
			RSVRSTRL: {
				IOMRK: 'Z'
			},
			STSMTASK: {
				OFFICER: '',
				MPHONE: ''
			},
			RVFCCH: {},
			RSVRFCCH: {}
		};
		$scope.tab = {
			RR_tab: false,
			ZQ_tab: false,
			DD_tab: false,
			SS_tab: false,
			step: false,
			STBPRP_title: '监测站基础信息'
		};
		$scope.template = {
			base_tab: 'templates/Station/form/base_tab.html',
			ZQ_tab: 'templates/Station/form/ZQ_tab.html',
			RR_tab: 'templates/Station/form/RR_tab.html',
			SS_tab: 'templates/Station/form/SS_tab.html',
			riverway: 'templates/Station/form/riverwayCurve.html',
			reservoir: 'templates/Station/form/reservoirCurve.html',
			waterLevel: 'templates/Station/form/waterLevel.html'
		}
		$scope.relevance = function(param){
			switch(param){
				case 0:
					$scope.promise = xhr.service('post', {model: 'Station', module: 'stationList', data: 'STTP = "ZZ" OR STTP = "ZQ"'}, function(resp){
						$scope.RLSTCD = resp.data;
					});
					break;
				case 1:
					$scope.promise = xhr.service('post', {model: 'Station', module: 'stationList', data: {STTP: 'RR'}}, function(resp){
						$scope.RLSTCD = resp.data;
					});
					break;
			}
		}
		$scope.mySTTP = function(){
			switch($scope.station.STBPRP.STTP.value){
				case 'RR':
					$scope.tab = {
						RR_tab: true,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: true,
						active: 3,
						heading: '水库水文',
						STBPRP_title: '第一步 ' + $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					$scope.relevance(1);
					break;
				case 'ZZ':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: true,
						DD_tab: false,
						SS_tab: false,
						step: true,
						active: 1,
						heading: '河道水文',
						STBPRP_title: '第一步 ' + $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'ZQ':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: true,
						DD_tab: false,
						SS_tab: false,
						step: true,
						active: 1,
						heading: '河道水位',
						STBPRP_title: '第一步 ' + $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'DD':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: true,
						SS_tab: false,
						step: false,
						active: 1,
						heading: '堰闸水文',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					}
					break;
				case 'PP':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '雨量',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'SS':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: true,
						step: true,
						active: 5,
						heading: '墒情',
						STBPRP_title: '第一步 ' + $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'MM':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '气象',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'BB':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '蒸发',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'TT':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '潮位',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'DP':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '泵站',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'ZG':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '地下水',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				case 'ZB':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						heading: '分洪水位',
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
					break;
				default:
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						STBPRP_title: $scope.station.STBPRP.STTP.lable + '基础信息'
					};
			}
		};
		$scope.nextStep = function(param){
			$scope.activeJustified = isNull(param)?$scope.tab.active:param;
		};
		$scope.$on('ZQRL', function(event, data){
			$scope.station.ZQRL = data;
		});
		$scope.$on('ZVARL', function(event, data){
			$scope.station.ZVARL = data;
		});
		$scope.$on('RSVRFSR', function(event, data){
			$scope.station.RSVRFSR = data;
		});
		$scope.submit = function(){
			var postData;
			switch($scope.station.STBPRP.STTP.value){
				case 'PP':
					"雨量站数据";
					postData = {
						STBPRP: $scope.station.STBPRP,
						STSMTASK: $scope.station.STSMTASK
					}
					break;
				case 'SS':
					"墒情站数据";
					postData = {
						STBPRP: $scope.station.STBPRP,
						STSMTASK: $scope.station.STSMTASK,
						SOILCH: $scope.station.SOILCH
					}
					break;
				case 'ZQ':
					"河道水文站数据";
				case 'ZZ':
					"河道水位站数据";
					postData = {
						STBPRP: $scope.station.STBPRP,
						STSMTASK: $scope.station.STSMTASK,
						RVFCCH: $scope.station.RVFCCH,
						ZQRL: $scope.station.ZQRL
					}
					break;
				case 'RR':
					"水库水文站数据";
					postData = {
						STBPRP: $scope.station.STBPRP,
						RSVRSTRL: $scope.station.RSVRSTRL,
						STSMTASK: $scope.station.STSMTASK,
						RSVRFCCH: $scope.station.RSVRFCCH,
						RSVRFSR: $scope.station.RSVRFSR,
						ZVARL: $scope.station.ZVARL
					}
					break;
				case 'DD':
					"堰闸水文站数据";
					postData = {
						STBPRP: $scope.station.STBPRP,
						STSMTASK: $scope.station.STSMTASK,
						WASRL: $scope.station.WASRL,
					}
					break;
				default:
					postData = {
						STBPRP: $scope.station.STBPRP,
						STSMTASK: $scope.station.STSMTASK,
					}
					break;
			}
			postData.STBPRP.STTP = $scope.station.STBPRP.STTP.value;
			$scope.promise = xhr.service('post', {model: 'Station', module: 'stationAdd', data: postData}, function(resp){
				swal({
						title: "数据操作成功！",
						text: resp.msg,
						type: resp.type.toLowerCase(),
						showCancelButton: false,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "确定",
						closeOnConfirm: true
					},
					function(){
						$state.go('StationIndex');
					});
			});
		}
	});
	app.controller('riverwayCurveCtrl', function($scope, Upload, toastr){
		$scope.ZQRL = [];
		$scope.addRiverwayCurve = function(){
			$scope.inserted = {
				LNNM: 'dfhdfh',
				BGTM: '',
				PTNO: '',
				Z: '',
				Q: '',
				COMMENTS: ''
			};
			$scope.ZQRL.push($scope.inserted);
		}
		$scope.uploadFile = function(){
			if ($scope.file) {
				$scope.promise = Upload.upload({
					url: 'setting.php?s=/station/xlsUpload.html',
					method: 'POST',
					headers : {
						'Content-Type': $scope.file.type
					},
					data: {targetPath: '/Upload/Excel/Riverway/'},
					file: $scope.file
				}).then(function (resp) {
					if(resp.type == 'Success') toastr.success(resp.msg, '操作成功！');
					else toastr.error(resp.msg, '操作失败！');
					for(var s in resp.data.record){
						$scope.ZQRL.push({
							LNNM: resp.data.record[s][0],
							BGTM: resp.data.record[s][1],
							PTNO: resp.data.record[s][2],
							Z: resp.data.record[s][3],
							Q: resp.data.record[s][4],
							COMMENTS: resp.data.record[s][5]
						});
					}
					$scope.$emit('ZQRL', $scope.ZQRL);
					console.log('Success ' + resp.config.data.file.name + ' uploaded. Response: ' + resp.data.reason);
				}, function (resp) {
					console.log('Error status: ' + resp.status);
				}, function (evt) {
					var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
					console.log('progress: ' + progressPercentage + '% ' + evt.config.data.file.name);
				});
			}
		};
		$scope.saveZQRL = function(){
			$scope.$emit('ZQRL', $scope.ZQRL);
		}
		
	});
	app.controller('reservoirCurveCtrl', function($scope, Upload){
		$scope.ZVARL = []
		$scope.addReservoirCurve = function(){
			$scope.inserted = {
				MSTM: '',
				PTNO: '',
				RZ: '',
				W: '',
				WSFA: ''
			};
			$scope.ZVARL.push($scope.inserted);
		}
		$scope.uploadFile = function(){
			if ($scope.file) {
				$scope.promise = Upload.upload({
					url: 'setting.php?s=/station/xlsUpload.html',
					method: 'POST',
					headers : {
						'Content-Type': $scope.file.type
					},
					data: {targetPath: '/Upload/Excel/Reservoir/'},
					file: $scope.file
				}).then(function (resp) {
					for(var s in resp.data.record){
						$scope.ZVARL.push({
							MSTM: resp.data.record[s][0],
							PTNO: resp.data.record[s][1],
							RZ: resp.data.record[s][2],
							W: resp.data.record[s][3],
							WSFA: resp.data.record[s][4]
						});
					}
					$scope.$emit('ZVARL', $scope.ZVARL);
					console.log('Success ' + resp.config.data.file.name + ' uploaded. Response: ' + resp.data.reason);
				}, function (resp) {
					console.log('Error status: ' + resp.status);
				}, function (evt) {
					var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
					console.log('progress: ' + progressPercentage + '% ' + evt.config.data.file.name);
				});
			}
		};
		$scope.saveZVARL = function(){
			$scope.$emit('ZVARL', $scope.ZVARL);
		}
	});
	app.controller('waterLevelCtrl', function($scope, $filter, editableThemes){
		$scope.RSVRFSR = [
			{BGMD: '', EDMD: '', FSLTDZ: '', FSLTDW: '', FSTP: 1},
			{BGMD: '', EDMD: '', FSLTDZ: '', FSLTDW: '', FSTP: 2},
			{BGMD: '', EDMD: '', FSLTDZ: '', FSLTDW: '', FSTP: 3},
			{BGMD: '', EDMD: '', FSLTDZ: '', FSLTDW: '', FSTP: 4},
		];
		$scope.statuses = [
			{value: 1, text: '主汛期'},
			{value: 2, text: '后汛期'},
			{value: 3, text: '过渡期'},
			{value: 4, text: '其它'}
		];
		$scope.opened = {
			l: [],
			r: []
		}
		$scope.open = function($event, index, ac) {
			$event.preventDefault();
			$event.stopPropagation();
			var x;
			for (x in $scope.opened.l){
				$scope.opened.l[x] = false;
				$scope.opened.r[x] = false;
			}
			if(ac == 'l'){
				$scope.opened.l[index]= !$scope.opened.l[index];
			}
			if(ac == 'r'){
				$scope.opened.r[index]= !$scope.opened.r[index];
			}
		};
		$scope.addWaterLevel = function(){
			$scope.inserted = {
				BGMD: '',
				EDMD: '',
				FSLTDZ: '',
				FSLTDW: '',
				FSTP: 1
			};
			$scope.RSVRFSR.push($scope.inserted);
		}
		$scope.saveRSVRFSR = function(){
			$scope.$emit('RSVRFSR', $scope.RSVRFSR);
		}
	});
});