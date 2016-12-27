/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	app.controller('MonitorConceptMapCtrl', function($scope){
		$scope.$emit('nav', {
			home: {title: '实时监控', url: 'StationIndex'},
			library: {title: '实时监控', url: ''},
			// sublib: {title: '概化图', url: ''}
		});
		
	});

});