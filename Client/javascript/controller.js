/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require){
	var app = require('./app');
	app.controller('DemoIndexCtrl', function($scope, xhr){
		$scope.greeting = 'Welcome!';
		$scope.myPromise = xhr.service('delete', {action: 'Station', module: 'lists', op: 'getRRlist'}, function(resp){
			console.log(resp);
			$scope.ddd = resp;
		})
	});
});