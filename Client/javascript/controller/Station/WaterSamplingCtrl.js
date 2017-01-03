/**
 * 水质采样管理
 * Created by gadfly on 2016/12/23.
 */
define(function (require){
	var app = require('../../app');
	app.controller('WaterSamplingCtrl', function($scope, $log, $uibModal, $state, xhr){
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '水质采样数据列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);

		$scope.promise = xhr.getList({model: 'Sampling', module: 'waterList'}, {}, function(resp){
			console.log(resp);
			$scope.totalItems = resp.pagination.totalItems;
			$scope.allItem = resp.pagination.allItem;
			$scope.currentPage = resp.pagination.currentPage;
			$scope.itemsPerPage = resp.pagination.itemsPerPage;
			$scope.numPages = resp.pagination.numPages;
			$scope.maxSize = resp.pagination.maxSize;
		});
		$scope.action = function(param, id){
			$uibModal.open({
				animation: true,
				size: 'lg',
				templateUrl: 'actionModalContent.html',
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
						$scope.action = '新增';
					}else{
						$scope.promise = xhr.service('post', {model: 'Sampling', module: 'waterInfo', data: {id: id}}, function(resp){
							$scope.station =resp.station;
							$scope.sampling = {
								STCD: resp.data.STCD,
								TM: new Date(resp.data.TM),
								CODCR: Number(resp.data.CODCR),
								LAS: Number(resp.data.LAS),
								SLYQ: Number(resp.data.SLYQ),
								AO: Number(resp.data.AO),
								BOD5: Number(resp.data.BOD5),
								FCG: Number(resp.data.FCG),
								WT: Number(resp.data.WT),
								PH: Number(resp.data.PH),
								HG: Number(resp.data.HG),
								CD: Number(resp.data.CD),
								ARS: Number(resp.data.ARS),
								PB: Number(resp.data.PB),
								CU: Number(resp.data.CU),
								ZN: Number(resp.data.ZN),
								SE: Number(resp.data.SE),
								S2: Number(resp.data.S2),
								SS: Number(resp.data.SS),
								SO: Number(resp.data.SO),
								CL: Number(resp.data.CL),
								CR6: Number(resp.data.CR6),
								F: Number(resp.data.F),
								BXQ: Number(resp.data.BXQ),
								BEN: Number(resp.data.BEN),
								B: Number(resp.data.B),
								CN: Number(resp.data.CN),
								OIL: Number(resp.data.OIL),
								SE: Number(resp.data.SE),
							};
						});
						$scope.isShow = {
							STCD: true,
							TM: true,
						}
						$scope.action = '编辑';
					}
					$scope.submit = function () {
						if(param =='add'){
							$scope.promise = xhr.service('post', {model: 'Sampling', module: 'waterAdd', data: $scope.sampling}, function(resp){
								$state.reload();
								$uibModalInstance.close();
							});
						}else{
							$scope.promise = xhr.service('post', {model: 'Sampling', module: 'waterEdit', data: $scope.sampling}, function(resp){
								$state.reload();
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
				$scope.promise = xhr.service('post', {model: 'Sampling', module: 'waterDel', data: {id: id}}, function(resp){
					if(resp.type == 'Success'){
						$state.reload();
						swal("删除成功!", "您已经成功删除了一条水质采样数据", "success");
					}
				});
			});
		}
	});
});