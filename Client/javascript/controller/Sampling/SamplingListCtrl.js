/**
 * Created by gadfly on 2017/1/3.
 */
define(function (require){
	var app = require('../../app');
	app.filter('taskType', function(){
		return function(param){
			var str = param.replace(/(^\s*)|(\s*$)/g, "");
			switch(str){
				case 'auto':
					return '自动报送';
				case 'manual':
					return '手动报送';
				default:
					return '其它报送';
			}
		}
	});
	app.filter('dateFormat', function(){
		return function(param){
			var dt = new Date(param);
			return dt.getFullYear()+'年'+dt.getMonth()+'月'+dt.getDate()+'日 '+dt.getHours()+'时'+dt.getMinutes()+'分';
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