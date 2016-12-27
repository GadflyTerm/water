/**
 * 水质检测站管理
 * Created by gadfly on 2016/12/23.
 */
define(function (require){
	var app = require('../../app');
	app.filter('stationType', function(){
		return function(param){
			switch(param){
				case '1':
					return '地表水水质站';
				case '2':
					return '地下水水质站';
				case '3':
					return '大气降水水质站'
			}
		}
	});
	app.filter('waterType', function(){
		return function(param){
			switch(param){
				case '1':
					return '河流';
				case '2':
					return '湖泊';
				case '3':
					return '水库'
			}
		}
	});
	app.controller('WaterStationCtrl', function($scope, $log, $uibModal, xhr){
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '水质采样测站列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);

		$scope.currentPage =1;		// 初始当前页
		$scope.allitem=[];			// 存放所有页
		$scope.numPages = 25;
		$scope.promise = xhr.service('post', {model: 'station', module: 'listWater'}, function(resp){
			var num= resp.data.length;
			$scope.totalItems =num;	// 共有多少条数据
			for(var i=0; i<num; i+=$scope.numPages){
				$scope.allitem.push(resp.data.slice(i, i+$scope.numPages))
			}//此方法可以将一个数组分成多个数组并且放在了一个大数组里面，按每个数组10条数据【因为组件默认为10条数据一页】存放，假如41条数据的话我们将分成5页
		});
		$scope.action = function(param, stcd){
			$uibModal.open({
				animation: true,
				size: 'lg',
				templateUrl: 'actionModalContent.html',
				controller: function($scope, list, $uibModalInstance){
					if(param =='add'){
						$scope.station = {
							WATP: '1',
							WSFL: '2'
						};
						$scope.isShow = {
							ASRL: true,
							ASAR: false,
							ASRC: false
						}
						$scope.action = '新增';
					}else{
						$scope.station = {}
						$scope.promise = xhr.service('post', {model: 'station', module: 'infoWater', data: JSON.stringify({STCD: stcd})}, function(resp){
							$scope.station = resp.data;
							$scope.station = {
								STCD: resp.data.STCD,
								STNM: resp.data.STNM,
								STCT: resp.data.STCT,
								WATP: resp.data.WATP,
								LGTD: parseFloat(resp.data.LGTD),
								LTTD: parseFloat(resp.data.LTTD),
								ASRL: parseFloat(resp.data.ASRL),
								ASAR: parseFloat(resp.data.ASAR),
								ASRC: parseFloat(resp.data.ASRC),
							}
							$scope.isShow = {
								ASRL: ($scope.station.WATP=='1')?true:false,
								ASAR: ($scope.station.WATP=='2')?true:false,
								ASRC: ($scope.station.WATP=='3')?true:false
							}
						});
						$scope.action = '编辑';
					}
					$scope.relevance = function(){
						switch($scope.station.WATP){
							case '3':
								$scope.station.ASRL = '';
								$scope.station.ASAR = '';
								$scope.isShow = {
									ASRL: false,
									ASAR: false,
									ASRC: true
								}
								break;
							case '2':
								$scope.station.ASRL = '';
								$scope.station.ASRC = '';
								$scope.isShow = {
									ASRL: false,
									ASAR: true,
									ASRC: false
								}
								break;
							default:
								$scope.station.ASAR = '';
								$scope.station.ASRC = '';
								$scope.isShow = {
									ASRL: true,
									ASAR: false,
									ASRC: false
								}
						}
					}
					$scope.submit = function () {
						if(param =='add'){
							$scope.promise = xhr.service('post', {model: 'station', module: 'addWater', data: JSON.stringify($scope.station)}, function(resp){
								if(resp.type == 'Success'){
									list.push(resp.data);
									$uibModalInstance.close();
								}
							});
						}else{
							$scope.promise = xhr.service('post', {model: 'station', module: 'editWater', data: JSON.stringify($scope.station)}, function(resp){
								if(resp.type == 'Success'){
									$scope.list = resp.data;
									$uibModalInstance.close();
								}
							});
						}
						
					};
					$scope.cancel = function () {
						$uibModalInstance.dismiss('cancel');
					};
				},
				controllerAs: '$scope',
				resolve: {
					list: function () {
						return $scope.list;
					}
				}
			});
		}
		$scope.del = function(stcd){
			swal({
				title: "您真的确认要删除数据吗？",
				text: "这是一条非常重要的水质采样测站数据，删除后将无法恢复!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "是的，现在删除它!",
				closeOnConfirm: false,
				html: false
			}, function(){
				$scope.promise = xhr.service('post', {model: 'station', module: 'delWater', data: JSON.stringify({STCD: stcd})}, function(resp){
					$scope.list =resp.data;
					if(resp.type == 'Success'){
						swal("删除成功!", "您已经成功删除了一条水质采样测站数据", "success");
					}
				});
			});
		}
	});
});