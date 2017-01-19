/**
 * Created by lengyan on 2016/12/20.
 */
define(function (require){
	var app = require('../../app');
	//var app = require('quick_sidebar');
	app.controller('MonitorCtrl', function($scope, $log, $uibModal, xhr){
		/*xhr.service('post', {action: 'ac'}, function(resp){
		 $scope.myData = resp.data;
		 });*/
		$scope.$emit('nav', {
			home: {title: '实时监控', url: 'Home'},
			library: {title: '地图', url: ''},
		});
		$scope.template = {
			quick_sidebar: 'templates/Monitor/quick-sidebar.html',
			monitorMap: 'templates/Monitor/monitorMap.html',
			monitorTable: 'templates/Monitor/monitorTable.html',
			monitorConceptMap: 'templates/Monitor/monitorConceptMap.html',
		}
		$scope.action = function(){
			$uibModal.open({
				animation: true,
				size: 'lg',
				templateUrl: 'actionModalContent.html',
				controller: function($scope, $uibModalInstance){
					$scope.close = function () {
						$uibModalInstance.dismiss();
					};
					$scope.detail = function(){
						$uibModal.open({
							animation: true,
							size: 'lg',
							templateUrl: 'detailModalContent.html',
							controller: function($scope, $uibModalInstance){
								$scope.close = function () {
									$uibModalInstance.dismiss();
								};
							},
							controllerAs: '$scope',
						});
					}
				},
				controllerAs: '$scope',
			});
		}
    $scope.currentPage =1;		// 初始当前页
	$scope.allitem=[];			// 存放所有页
    $scope.promise = xhr.getList({model: 'Monitor', module: 'get_sk_list',data:{STTDRCD:'1'}}, {}, function(resp){
			$scope.totalItems = resp.pagination.totalItems;
			$scope.allItem = resp.pagination.allItem;
			$scope.currentPage = resp.pagination.currentPage;
			$scope.itemsPerPage = resp.pagination.itemsPerPage;
			$scope.numPages = resp.pagination.numPages;
			$scope.maxSize = resp.pagination.maxSize;
	  });
	$scope.Reservoirlists = [{
			id:1,
			Rname:'TEST水库',
			Dtime:'2016-12-08',
			wline:'19',
			Rfall:'25',
		},{
			id:2,
			Rname:'TEST水库2',
			Dtime:'2016-12-02',
			wline:'18',
			Rfall:'19',
		},{
			id:3,
			Rname:'TEST水库3',
			Dtime:'2016-12-07',
			wline:'17',
			Rfall:'26',
		},]
		$scope.Rainfalllists = [{
			id:1,
			Rname:'江川站',
			Dtime:'2016-12-08',
			TRline:'20',
			ARfall:'66',
		},{
			id:2,
			Rname:'红河站',
			Dtime:'2016-12-08',
			TRline:'20',
			ARfall:'66',
		}]
		$scope.Gateslists = [{
			id:1,
			Gname:'开合闸',
			open:'2m',
			Sfall:'120',
			ARfall:'10-33',
		},{
			id:2,
			Gname:'姚丰闸',
			open:'2m',
			Sfall:'110',
			ARfall:'10-33',
		}]
		$scope.FlowLlists = [{
			id:1,
			Rname:'成功站',
			Dtime:'2016-12-08',
			Wline:'20',
			Sfall:'10-25',
		},{
			id:2,
			Rname:'理想站',
			Dtime:'2016-12-08',
			Wline:'20',
			Sfall:'10-25',
		}]
		$scope.Moisturelists = [{
			id:1,
			Rname:'成功站',
			Dtime:'2016-12-12',
			Rt:'60',
			Rf:'25',
			Rs:'10-26',
		},{
			id:1,
			Rname:'姚丰站',
			Dtime:'2016-12-11',
			Rt:'60',
			Rf:'25',
			Rs:'10-26',
		}]
		
	});

});