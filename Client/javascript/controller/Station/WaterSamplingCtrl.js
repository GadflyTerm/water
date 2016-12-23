/**
 * 水质采样管理
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
	app.filter('headwaterType', function(){
		return function(param){
			switch(param){
				case '1':
					return '水源地水质站';
				case '2':
					return '非水源地水质站'
			}
		}
	});
	app.controller('WaterSamplingCtrl', function($scope, $log, $uibModal, xhr){
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '水质采样数据列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.list = []
		$scope.promise = xhr.service('post', {action: 'station', module: 'getLists', op: 'WaterSampling', data: JSON.stringify($scope.station)}, function(resp){
			$scope.list =resp.data;
		});
		$scope.action = function(param, id){
			$uibModal.open({
				animation: true,
				size: 'lg',
				templateUrl: 'actionModalContent.html',
				controller: function($scope, list, $uibModalInstance){
					if(param =='add'){
						$scope.sampling = {}
						$scope.action = '新增';
					}else{
						$scope.promise = xhr.service('post', {action: 'station', module: 'infoData', op: 'WaterStation', data: id}, function(resp){
							$scope.sampling =resp.data;
						});
						$scope.action = '编辑';
					}
					$scope.submit = function () {
						if(param =='add'){
							$scope.promise = xhr.service('post', {action: 'station', module: 'addData', op: 'WaterSampling', data: JSON.stringify($scope.sampling)}, function(resp){
								list.push(resp.data);
								$uibModalInstance.close();
							});
						}else{
							$scope.promise = xhr.service('post', {action: 'station', module: 'editData', op: 'WaterSampling', data: JSON.stringify($scope.sampling)}, function(resp){
								$scope.list =resp.data;
								$uibModalInstance.close();
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
		$scope.del = function(id){
			swal({
				title: "您真的确认要删除数据吗？",
				text: "这是一条非常重要的水质采样数据，删除后将无法恢复!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "是的，现在删除它!",
				closeOnConfirm: false,
				html: false
			}, function(){
				$scope.promise = xhr.service('post', {action: 'station', module: 'delData', op: 'WaterSampling', data: id}, function(resp){
					$scope.list =resp.data;
					if(resp.type == 'Success'){
						swal("删除成功!", "您已经成功删除了一条水质采样数据", "success");
					}
				});
			});
		}
	});
});