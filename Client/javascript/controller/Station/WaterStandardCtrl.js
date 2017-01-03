/**
 * Created by gadfly on 2016/12/22.
 */
define(function (require){
	var app = require('../../app');
	app.controller('WaterStandardCtrl', function($scope, $filter, xhr){
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '水质异常参照标准数据列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.Standard = [];
		$scope.currentPage =1;		// 初始当前页
		$scope.allitem=[];			// 存放所有页
		$scope.numPages = 10;
		$scope.maxSize = 3
		$scope.promise = xhr.getList({action: 'station', module: 'getLists', op: 'WaterStandard'}, $scope.numPages, function(resp){
			console.log(resp);
			$scope.totalItems = resp.pagination.totalItems;
			$scope.allItem = resp.pagination.allItem;
		});
		$scope.statuses = [
			{value: 0, text: '禁用'},
			{value: 1, text: '启用'}
		];
		$scope.submit = function() {
			$scope.Standard = [];
			$scope.promise = xhr.service('POST', {action: 'station', module: 'setXediTable', op: 'WaterStandard', data: JSON.stringify($scope.Standard)}, function(resp){
				for (var p in resp.data){
					$scope.Standard.push(resp.data[p]);
				}
			});
		}
	});
});