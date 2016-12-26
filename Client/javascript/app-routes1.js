/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require){
	var app = require('./app');
	var baseUrl = 'http://water.cn/Service/restful.php?s=/Ajax/angular.html';

	// app.controller('QuickSidebarController', ['$scope', function($scope) {
	// 	$scope.$on('$includeContentLoaded', function() {
	// 		setTimeout(function(){
	// 			QuickSidebar.init(); // init quick sidebar        
	// 		}, 2000)
	// 	});
	// }]);
	
	app.config(function($httpProvider, $urlRouterProvider, $stateProvider, toastrConfig){
		$httpProvider.defaults.headers = {
			post: {'Content-Type': 'application/x-www-form-urlencoded'},
			get: {'Content-Type': 'application/x-www-form-urlencoded'},
			put: {'Content-Type': 'application/x-www-form-urlencoded'},
			delete: {'Content-Type': 'application/x-www-form-urlencoded'}
		}
		$httpProvider.defaults.transformRequest = function(obj){
			var str = [];
			for(var p in obj){
				str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
			}
			return str.join("&");
		};
		angular.extend(toastrConfig, {
			closeButton: true,
			closeHtml: '<button>&times;</button>',
			extendedTimeOut: 1001,
			autoDismiss: false,
			containerId: 'toast-container',
			maxOpened: 0,
			newestOnTop: true,
			positionClass: 'toast-top-right',
			preventDuplicates: false,
			preventOpenDuplicates: false,
			timeOut: 5000,
			target: 'body'
		});
		//路由
		$stateProvider.state('Home', {
			url: "/Home",
			template: '<h1>首页</h1>'
		}).state('StationIndex', {
			url: "/StationIndex",
			templateUrl: "templates/Station/index.html",
			controller: 'StationIndexCtrl',
			resolve: {
				StationIndexCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/StationIndexCtrl'], function(){	//异步加载controller／directive/filter/service
						deferred.resolve(); 
					});
					return deferred.promise;
				}]
			}
		}).state('StationAdd', {            // 登陆
			url: '/StationAdd',
			templateUrl: 'templates/Station/action.html',
			controller: 'StationAddCtrl',
			resolve: {
				StationAddCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/StationAddCtrl'], function(){	//异步加载controller／directive/filter/service
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('StationEdit', {            // 登陆
			url: '/StationEdit:id',
			templateUrl: 'templates/Station/action.html',
			controller: 'StationEditCtrl',
			resolve: {
				StationAddCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/StationEditCtrl'], function(){	//异步加载controller／directive/filter/service
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('ReportIndex', {            // 报表
			url: '/ReportIndex',
			templateUrl: 'templates/Report/index.html',
			controller: 'ReportIndexCtrl',
			resolve: {
				ReportIndexCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Report/ReportIndexCtrl'], function(){	//异步加载controller／directive/filter/service
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('ReportReservoir', { 				//站点报表
			url: '/ReportReservoir:id',
			templateUrl: 'templates/Report/reservoir.html',
			controller: 'ReportReservoirCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Report/ReportReservoirCtrl'], function(){	//异步加载controller／directive/filter/service
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('MonitorMap', {				//实时地图
			url: '/MonitorMap',
			templateUrl: 'templates/Monitor/monitorMap.html',
			controller: 'MonitorMapCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Monitor/MonitorMapCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('MonitorTable', {				//实时表格
			url: '/MonitorTable',
			templateUrl: 'templates/Monitor/monitorTable.html',
			controller: 'MonitorTableCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Monitor/MonitorTableCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('MonitorConceptMap', {				//实时概化图
			url: '/MonitorConceptMap',
			templateUrl: 'templates/Monitor/monitorConceptMap.html',
			controller: 'MonitorConceptMapCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Monitor/MonitorConceptMapCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('SideBar', {				//实时概化图
			url: '/SideBar',
			templateUrl: 'templates/SideBar/quick-sidebar.html',
			controller: 'SideBarCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/SideBar/SideBarCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('WaterStandard', {			// 水质标准管理
			url: '/WaterStandard',
			templateUrl: 'templates/Station/WaterStandard.html',
			controller: 'WaterStandardCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/WaterStandardCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('WaterSampling', {			//水质采样管理
			url: '/WaterSampling',
			templateUrl: 'templates/Station/WaterSampling.html',
			controller: 'WaterSamplingCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/WaterSamplingCtrl'], function(){	
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		}).state('WaterStation', {			// 水质测站管理
			url: '/WaterStation',
			templateUrl: 'templates/Station/WaterStation.html',
			controller: 'WaterStationCtrl',
			resolve: {
				ReportReservoirCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/WaterStationCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		});
		$urlRouterProvider.otherwise('/Home');
	});
	app.factory('xhr', function($http, $window, toastr){
		return {
			service: function(method, param, callback){
				var config = {
					url: baseUrl,
					cache: false,
					timeout: 30000,
				}
				switch(method.toLowerCase()){
					case 'get':
					case 'delete':
						config.method = method.toLowerCase();
						config.params = param;
						break;
					case 'post':
					case 'put':
					default:
						config.method = method.toLowerCase();
						config.data = param;
				}
				return $http(config).success(function(resp){
					switch(resp.type){
						case 'Success':
							toastr.success(resp.msg, isNull(resp.title) ? '操作成功！' : resp.title);
							break;
						case 'Error':
							toastr.error(resp.msg, isNull(resp.title) ? '操作失败！' : resp.title);
							break;
						case 'Warning':
							toastr.warning(resp.msg, isNull(resp.title) ? '操作警告！' : resp.title);
							break;
						case 'info':
						default:
							toastr.info(resp.msg, isNull(resp.title) ? '操作提醒！' : resp.title);
					}
					if(typeof(callback) == 'function') callback(resp);
				});
			},
			getBase: function(refresh){
				if(!$window.sessionStorage.getItem('baseData') || refresh){
					$http({
						url: baseUrl,
						cache: false,
						method: 'get',
						params: {action: 'Ajax', module: 'getBase'},
						timeout: 30000
					}).success(function(resp){
						$window.sessionStorage.setItem("baseData", JSON.stringify(resp.data));
					});
				}
			}
		}
	});
	app.run(function(xhr) {
		xhr.getBase(true);
	});
	app.controller('topCtrl', function($scope){
		$scope.$on('nav', function(event, data){
			$scope.nav = data;
		});
	});
});