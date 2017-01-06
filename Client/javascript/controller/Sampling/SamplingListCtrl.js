/**
 * Created by gadfly on 2017/1/3.
 */
define(function (require){
	var app = require('../../app');
	app.controller('SamplingListCtrl', function($scope, $state, xhr){
		$scope.nav = {
			home: {title: '测站报送数据管理', url: 'Home'},
			library: {title: '测站报送数据列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
	});
});