/**
 * Created by gadfly on 2016/12/15.
 */
define(function (require){
	var app = require('../../app');
	require('angular_xeditable');
	app.useModule('xeditable');
	require('ng_file_upload');
	app.useModule('ngFileUpload');
	app.controller('StationEditCtrl', function($scope, $window, $stateParams, xhr){
		xhr.service('get', {action: 'station', module: 'getInfo', op: 'getStationInfo', pk: $stateParams.id}, function(resp){
			
		});
	});
});