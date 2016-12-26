/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	app.controller('MonitorConceptMapCtrl', function($scope){
		/*xhr.service('post', {action: 'ac'}, function(resp){
		 $scope.myData = resp.data;
		 });*/
		// $scope.nav = {
		// 	home: {title: '监测成果统计', url: 'Home'},
		// 	library: {title: '灌区报表管理', url: ''},
		// }
		$scope.$emit('nav', {
			home: {title: '实时监控', url: 'StationIndex'},
			library: {title: '实时监控', url: ''},
			// sublib: {title: '概化图', url: ''}
		});

		$scope.template = {
			quick_sidebar: 'templates/Monitor/quick-sidebar.html',
		}
		
	});

});