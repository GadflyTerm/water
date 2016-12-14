/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var angular = require('angular');
	var app = angular.module('starter.controllers', []);
	app.controller('StationIndexCtrl', function($scope){
		/*xhr.service('post', {action: 'ac'}, function(resp){
			$scope.myData = resp.data;
		});*/
		$scope.myData = {
			type: 'Success',
			msg: '数据获取成功',
			data: [
				{ss: 'ss0', dd: 'dd0'},
				{ss: 'ss1', dd: 'dd1'},
			]
		}
	});
	app.controller('StationAddCtrl', function($scope){
		
	});
});