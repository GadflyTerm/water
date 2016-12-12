/**
 * Created by gadfly on 2016/12/12.
 */
	var app = angular.module('starter.controllers', []);
	app.controller('demoCtrl', function($scope, xhr){
		$scope.greeting = 'Welcome!';
		$scope.myPromise = xhr.service('get', {action: 'Station', module: 'lists', op: 'getRRlist'}, function(resp){
			console.log(resp);
		})
	});