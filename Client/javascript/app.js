/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require, exports, module) {
	var angular = require('angular');
	var asyncLoader = require('angular_async_loader');
	require('ui_router');
	require('angular_xeditable');
	var app = angular.module('starter', ['ui.router', 'ui.bootstrap', 'cgBusy', 'toastr', 'xeditable']);
	asyncLoader.configure(app);
	module.exports = app;
});