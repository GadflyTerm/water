/**
 * Created by Mia on 2016/12/27.
 */
/**
 * 实时监测地图
 * Created by Mia on 2016/12/27.
 */
define(function (require){
	var app = require('../../app');
	app.controller('WaterSamplingCtrl', function($scope, $log, $uibModal, xhr){
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '实时监测 地图', url: ''},
		}
		$scope.$emit('nav', $scope.nav);

		$scope.action = function(param, id){
			$uibModal.open({
				animation: true,
				size: 'lg',
				templateUrl: 'dotModalContent.html',
				controller: function($scope, list, $uibModalInstance){
					if(param =='add'){
						$scope.promise = xhr.service('post', {model: 'station', module: 'listWater'}, function(resp){
							$scope.station =resp.data;
						});
						$scope.sampling = {}
						$scope.sampling.TM = new Date();
						$scope.isShow = {
							STCD: false,
							TM: false,
						}
						$scope.action = '模态';
					}else{
						$scope.promise = xhr.service('post', {model: 'Sampling', module: 'waterInfo', data: {id: id}}, function(resp){
							$scope.station =resp.station;
							$scope.sampling = {
								STCD: resp.data.STCD,
								TM: new Date(resp.data.TM),
								CODCR: Number(resp.data.CODCR)
							};
						});
						$scope.isShow = {
							STCD: true,
							TM: true,
						}
						$scope.action = '编辑';
					}
					$scope.close = function () {
						$uibModalInstance.dismiss('close');
					};
				},
				controllerAs: '$scope',
			});
		}
	});
});