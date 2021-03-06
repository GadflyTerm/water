/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	app.controller('StationIndexCtrl', function($scope, $state, xhr){
		$scope.nav = {
			home: {title: '检测站管理', url: 'Home'},
			library: {title: '检测站列表', url: ''},
		}
		$scope.currentPage =1;		// 初始当前页
		$scope.allitem=[];			// 存放所有页
		$scope.promise = xhr.getList({model: 'Station', module: 'stationList'}, {}, function(resp){
			$scope.totalItems = resp.pagination.totalItems;
			$scope.allItem = resp.pagination.allItem;
			$scope.currentPage = resp.pagination.currentPage;
			$scope.itemsPerPage = resp.pagination.itemsPerPage;
			$scope.numPages = resp.pagination.numPages;
			$scope.maxSize = resp.pagination.maxSize;
		});
		$scope.$emit('nav', $scope.nav);
		$scope.delete = function(STCD){
			swal({
				title: "您真的确认要删除数据吗？",
				text: "这是一条非常重要的测站基础数据，删除后将无法恢复!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "是的，现在删除它!",
				closeOnConfirm: false,
				html: false
			}, function(){
				$scope.promise = xhr.service('post', {model: 'Station', module: 'stationDel', data: {STCD: STCD}}, function(resp){
					if(resp.type == 'Success'){
						$state.reload();
						swal("删除成功!", "您已经成功删除了一条测站基础数据", "success");
					}
				});
			});
		}
		$scope.myData = {
			type: 'Success',
			msg: '数据获取成功',
			data: [
				{ss: 'ss0', dd: 'dd0'},
				{ss: 'ss1', dd: 'dd1'},
			]
		}
	});
});