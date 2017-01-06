/**
 * Created by gadfly on 2017/1/3.
 */
define(function (require){
	var app = require('../../app');
	app.filter('taskType', function(){
		return function(param){
			switch(param){
				case 'auto':
					return '自动报送';
				case 'manual':
					return '手动报送'
			}
		}
	});
	app.controller('SamplingListCtrl', function($scope, $state, xhr){
		$scope.nav = {
			home: {title: '测站报送数据管理', url: 'Home'},
			library: {title: '测站报送数据列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.promise = xhr.getList({model: 'Sampling', module: 'samplingList'}, {}, function(resp){
			$scope.totalItems = resp.pagination.totalItems;
			$scope.allItem = resp.pagination.allItem;
			$scope.currentPage = resp.pagination.currentPage;
			$scope.itemsPerPage = resp.pagination.itemsPerPage;
			$scope.numPages = resp.pagination.numPages;
			$scope.maxSize = resp.pagination.maxSize;
		});
	});
});