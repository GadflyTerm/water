/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	app.controller('ReportReservoirCtrl', function($scope,xhr){
		/*xhr.service('post', {action: 'ac'}, function(resp){
		 $scope.myData = resp.data;
		 });*/
		$scope.nav = {
			home: {title: '监测成果统计', url: 'Home'},
			library: {title: '灌区报表管理', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.currentPage =1;		// 初始当前页
		$scope.allitem=[];	
		$scope.promise = xhr.getList({model: 'Monitor', module: 'get_sk_list'}, {}, function(resp){
			$scope.totalItems = resp.pagination.totalItems;
			$scope.allItem = resp.pagination.allItem;
			$scope.currentPage = resp.pagination.currentPage;
			$scope.itemsPerPage = resp.pagination.itemsPerPage;
			$scope.numPages = resp.pagination.numPages;
			$scope.maxSize = resp.pagination.maxSize;
		});

	});

});