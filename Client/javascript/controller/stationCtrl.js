/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	/*var angular = require('angular');
	var app = angular.module('starter.controllers', []);*/
	var app = require('../app');
	require('angular_wizard');
	app.useModule('mgo-angular-wizard');
	require('angular_xeditable');
	app.useModule('xeditable');
	/*require('ng_file_upload');
	app.useModule('ng_file_upload');*/
	app.run(function(editableOptions) {
		editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
	});
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
	app.controller('StationAddCtrl', function($scope, $window){
		console.log($window.sessionStorage.getItem("baseData"));
		$scope.template = {
			url: 'templates/Station/form/base.html'
		}
		$scope.ZQRL = [
			{
				LNNM: '1987-12-21',
				BGTM: 'sfsdf',
				PTNO: '1',
				Z: '123',
				Q: '321',
				COMMENTS: 'fweff'
			}
		];
		$scope.addReservoirCurve = function(){
			$scope.inserted = {
				LNNM: '',
				BGTM: '',
				PTNO: '',
				Z: '',
				Q: '',
				COMMENTS: ''
			};
			$scope.ZQRL.push($scope.inserted);
			//$scope.$emit('ZQRL', $scope.ZQRL);
		}
	});
});