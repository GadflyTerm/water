/**
 * 水质采样管理
 * Created by gadfly on 2016/12/23.
 */
define(function (require){
	var app = require('../../app');
	app.controller('WaterSamplingCtrl', function($scope){
		/*xhr.service('post', {action: 'ac'}, function(resp){
		 $scope.myData = resp.data;
		 });*/
		$scope.nav = {
			home: {title: '水质检测站管理', url: 'Home'},
			library: {title: '检测站列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.lists = [
			{id:1, STNM:'dsgsdg',RVNM:'fasa',STLC:'sdfdsv'}
		];
		$scope.delete = function(id){
			alert(id);
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