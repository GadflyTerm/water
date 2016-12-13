/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require, exports, module) {
	var angular = require('angular');
	var asyncLoader = require('angular_async_loader');
	//require(['angular_animate', 'angular_busy', 'angular_toastr']);
	//require('angular-ui-router');

	var app = angular.module('starter', ['ngAnimate', 'toastr', 'cgBusy','starter.controllers']);

	// initialze app module for angular-async-loader
	asyncLoader.configure(app);

	module.exports = app;
});