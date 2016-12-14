/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require, exports, module) {
	var angular = require('angular');
	var asyncLoader = require('angular_async_loader');
	//require(['angular_busy', 'angular_toastr']);
	//console.log(angular);
	require('ui_router');
	var app = angular.module('starter', ['ui.router', 'ui.bootstrap', 'cgBusy', 'toastr']);
	asyncLoader.configure(app);
	module.exports = app;
});