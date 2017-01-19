/**
 * Created by lengyan on 2016/12/20.
 */
define(function (require){
	var app = require('../../app');
	//var app = require('quick_sidebar');
	app.filter('dateFormat', function(){
		return function(param){
			var dt = new Date(param);
			return dt.getFullYear()+'-'+(dt.getMonth()+1)+'-'+dt.getDate()+' '+dt.getHours()+':'+dt.getMinutes();
		}
	});
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
		$scope.RR_LIST = xhr.getList({
	      model: 'Monitor',
	      module: 'get_sk_list',
	    }, {}, function(resp) {
	      $scope.SKtotalItems = resp.pagination.totalItems;
	      $scope.SKallItem = resp.pagination.allItem;
	      $scope.SKcurrentPage = resp.pagination.currentPage;
	      $scope.SKitemsPerPage = resp.pagination.itemsPerPage;
	      $scope.SKnumPages = resp.pagination.numPages;
	      $scope.SKmaxSize = resp.pagination.maxSize;
	    });
	    $scope.PP_LIST = xhr.getList({
	      model: 'Monitor',
	      module: 'get_yl_list',
	    }, {}, function(resp) {
	      $scope.YLtotalItems = resp.pagination.totalItems;
	      $scope.YLallItem = resp.pagination.allItem;
	      $scope.YLcurrentPage = resp.pagination.currentPage;
	      $scope.YLitemsPerPage = resp.pagination.itemsPerPage;
	      $scope.YLnumPages = resp.pagination.numPages;
	      $scope.YLmaxSize = resp.pagination.maxSize;
	    });
	    $scope.YZ_LIST = xhr.getList({
	      model: 'Monitor',
	      module: 'get_yz_list',
	    }, {}, function(resp) {
	      $scope.YZtotalItems = resp.pagination.totalItems;
	      $scope.YZallItem = resp.pagination.allItem;
	      $scope.YZcurrentPage = resp.pagination.currentPage;
	      $scope.YZitemsPerPage = resp.pagination.itemsPerPage;
	      $scope.YZnumPages = resp.pagination.numPages;
	      $scope.YZmaxSize = resp.pagination.maxSize;
	    });
	    $scope.LL_LIST = xhr.getList({
	      model: 'Monitor',
	      module: 'get_ll_list',
	    }, {}, function(resp) {
	      $scope.LLtotalItems = resp.pagination.totalItems;
	      $scope.LLallItem = resp.pagination.allItem;
	      $scope.LLcurrentPage = resp.pagination.currentPage;
	      $scope.LLitemsPerPage = resp.pagination.itemsPerPage;
	      $scope.LLnumPages = resp.pagination.numPages;
	      $scope.LLmaxSize = resp.pagination.maxSize;
	    });
	    $scope.SQ_LIST = xhr.getList({
	      model: 'Monitor',
	      module: 'get_sq_list',
	    }, {}, function(resp) {
	      $scope.SQtotalItems = resp.pagination.totalItems;
	      $scope.SQallItem = resp.pagination.allItem;
	      $scope.SQcurrentPage = resp.pagination.currentPage;
	      $scope.SQitemsPerPage = resp.pagination.itemsPerPage;
	      $scope.SQnumPages = resp.pagination.numPages;
	      $scope.SQmaxSize = resp.pagination.maxSize;
	    });

		
		
	});

});