/**
 * 水质采样管理
 * Created by gadfly on 2016/12/23.
 */
define(function (require){
	var app = require('../../app');
	app.controller('WaterSamplingCtrl', function($scope, $log, $uibModal){
		/*xhr.service('post', {action: 'ac'}, function(resp){
		 $scope.myData = resp.data;
		 });*/
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '水质采样列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.items = ['item1', 'item2', 'item3'];
		$scope.addWaterSampling = function(){
			var modalInstance = $uibModal.open({
				animation: true,
				templateUrl: 'myModalContent.html',
				controller: function($scope, items, $uibModalInstance){
					$scope.items = items;
					$scope.ok = function () {
						$uibModalInstance.close(items);
					};
					$scope.cancel = function () {
						$uibModalInstance.dismiss('cancel');
					};
				},
				controllerAs: '$scope',
				resolve: {
					items: function () {
						return $scope.items;
					}
				}
			});
			modalInstance.result.then(function (selectedItem) {
				$log.info(selectedItem);
			}, function (selectedItem) {
				$log.info(selectedItem);
				$log.info('Modal dismissed at: ' + new Date());
			});
		}
	});
});