/**
 * Created by gadfly on 2016/11/17.
 */
var jq = $.noConflict();
function isNull(param){
	return (typeof(param) != 'undefined' && param && param !=0)?false:true;
}
function isUndefined(param){
	return (typeof(param) != 'undefined')?false:true;
}
(function(){
	var app = angular.module('starter', ['ui.bootstrap', 'xeditable', 'ngFileUpload', 'ngAnimate', 'toastr', 'cgBusy']);
	app.run(function(editableOptions) {
		editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
	});
	app.config(function($httpProvider, toastrConfig){
		$httpProvider.defaults.headers.post = {'Content-Type': 'application/x-www-form-urlencoded'};
		$httpProvider.defaults.transformRequest = function(obj){
			var str = [];
			for(var p in obj){
				str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
			}
			return str.join("&");
		};
		angular.extend(toastrConfig, {
			closeButton: true,
			closeHtml: '<button>&times;</button>',
			extendedTimeOut: 1000,
			autoDismiss: false,
			containerId: 'toast-container',
			maxOpened: 0,
			newestOnTop: true,
			positionClass: 'toast-top-right',
			preventDuplicates: false,
			preventOpenDuplicates: false,
			timeOut: 5000,
			target: 'body'
		});
	});
	app.factory('xhr', function($http, toastr){
		return {
			service: function(param, callback){
				return $http({
					url: '/restful.php?s=Ajax/angular.html',
					method: "POST",
					data: param,
					timeout: 30000
				}).success(function(resp){
					switch(resp.type){
						case 'Success':
							toastr.success(resp.msg, isNull(resp.title)?'操作成功！':resp.title);
							break;
						case 'Error':
							toastr.error(resp.msg, isNull(resp.title)?'操作失败！':resp.title);
							break;
						case 'Warning':
							toastr.warning(resp.msg, isNull(resp.title)?'操作警告！':resp.title);
							break;
						case 'info':
							toastr.info(resp.msg, isNull(resp.title)?'操作提醒！':resp.title);
							break;
					}
					if(typeof(callback) == 'function') callback(resp);
				});
			}
		}
	});
	app.controller('StationAddCtrl', function($scope, $http, xhr){
		"添加新的监测站控制器";
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
		$scope.jumpToUrl = function () {
			window.location.replace('/setting.php?s=/station/lists.html')
		};
		$scope.relevance = function(){
			switch($scope.ajax.relev){
				case 0:
					$scope.promise = xhr.service({ac: 'station', op: 'getZZlist'}, function(resp){
						$scope.RLSTCD = resp.data;
					});
					break;
				case 1:
					$scope.promise = xhr.service({ac: 'station', op: 'getRRlist'}, function(resp){
						$scope.RLSTCD = resp.data;
					});
					break;
			}
		}
		$scope.mySTTP = function(){
			switch($scope.station.STBPRP.STTP){
				case 'RR':
					$scope.tab = {
						RR_tab: true,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: true,
						active: 3,
						heading: '水库水文',
						STBPRP_title: '第一步 水库水文站基础信息'
					};
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
						STBPRP_title: '第一步 河道水文站基础信息'
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
						STBPRP_title: '第一步 河道水位站基础信息'
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
						STBPRP_title: '堰闸水文站基础信息'
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
						STBPRP_title: '雨量站基础信息'
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
						STBPRP_title: '第一步 墒情站基础信息'
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
						STBPRP_title: '气象监测站基础信息'
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
						STBPRP_title: '蒸发监测站基础信息'
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
						STBPRP_title: '潮位监测站基础信息'
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
						STBPRP_title: '泵站监测站基础信息'
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
						STBPRP_title: '地下水监测站基础信息'
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
						STBPRP_title: '分洪水位监测站基础信息'
					};
					break;
				default:
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						STBPRP_title: '监测站基础信息'
					};
			}
		};
		$scope.nextStep = function(param){
			$scope.activeJustified = isNull(param)?$scope.tab.active:param;
		};
		$scope.submit = function(){
			var postData;
			switch($scope.station.STBPRP.STTP){
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
					}
					$scope.$on('ZQRL', function(event, data){
						postData.ZQRL = data;
					});
					break;
				case 'RR':
					"水库水文站数据";
					postData = {
						STBPRP: $scope.station.STBPRP,
						STSMTASK: $scope.station.STSMTASK,
						RSVRFCCH: $scope.station.RSVRFCCH,
					}
					$scope.$on('ZQRL', function(event, data){
						postData.ZVARL = data;
					});
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
			console.log(postData);
			$scope.promise = xhr.service({ac: 'station', op: 'addStation'}, function(resp){
				console.log(resp);
			})
		}
	})
	.controller('riverwayCurveCtrl', function($scope, Upload, toastr){
		$scope.ZQRL = [];
		$scope.addRiverwayCurve = function(){
			$scope.inserted = {
				LNNM: '',
				BGTM: '',
				PTNO: '',
				Z: '',
				Q: '',
				COMMENTS: ''
			};
			$scope.ZQRL.push($scope.inserted);
			$scope.$emit('ZQRL', $scope.ZQRL);
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
	})
	.controller('reservoirCurveCtrl', function($scope, Upload){
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
			$scope.$emit('ZVARL', $scope.ZVARL);
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
						$scope.ZQRL.push({
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
	});
}());