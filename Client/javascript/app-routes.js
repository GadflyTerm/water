/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require){
	var app = require('./app');
	var baseUrl = '/Service/restful.php?s=/Ajax/angular.html';
	var restUrl = 'http://water.com:8080/Service/restful.php?s=/Ajax/angular.html';
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
		}).state('StationAdd', {            
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
		}).state('StationEdit', {           
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
		}).state('WaterStandard', {			// 水质标准管理
			url: '/WaterStandard',
			templateUrl: 'templates/Station/WaterStandard.html',
			controller: 'WaterStandardCtrl',
			resolve: {
				WaterStandardCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/WaterStandardCtrl'], function(){	//异步加载controller／directive/filter/service
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
				WaterSamplingCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/WaterSamplingCtrl'], function(){	//异步加载controller／directive/filter/service
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
				WaterStationCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Station/WaterStationCtrl'], function(){	//异步加载controller／directive/filter/service
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		})

			.state('ReportIndex', {            // 报表
				url: '/ReportIndex',
				templateUrl: 'templates/Report/index.html',
				controller: 'ReportCtrl',
				resolve: {
					ReportCtrl: ["$q", function($q){
						var deferred = $q.defer();
						require(['../javascript/controller/Report/ReportCtrl'], function(){
							deferred.resolve();
						});
						return deferred.promise;
					}]
				}
			}).state('ReportReservoir', {
			url: '/ReportReservoir:id',
			templateUrl: 'templates/Report/reservoir.html',
			controller: 'ReportCtrl',
			resolve: {
				ReportCtrl: ["$q", function($q){
					var deferred = $q.defer();
					require(['../javascript/controller/Report/ReportCtrl'], function(){
						deferred.resolve();
					});
					return deferred.promise;
				}]
			}
		})
			.state('Monitor', {				//实时监测
				url: '/Monitor',
				templateUrl: 'templates/Monitor/monitor.html',
				controller: 'MonitorCtrl',
				resolve: {
					MonitorCtrl: ["$q", function($q){
						var deferred = $q.defer();
						require(['../javascript/controller/Monitor/MonitorCtrl'], function(){
							deferred.resolve();
						});
						return deferred.promise;
					}]
				}
			})
		;
		$urlRouterProvider.otherwise('/Home');
	});
	app.factory('xhr', function($http, $window, toastr){
		var config = {
			url: baseUrl,
			cache: false,
			timeout: 30000,
		}
		return {
			service: function(method, param, callback){
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
				if(!isNull(param.data))
					param.data = (typeof param.data == 'object')?JSON.stringify(param.data):param.data
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
			getList: function(param, numPages,callback){
				config.method = 'get';
				config.params = param;
				$http(config).success(function(resp){
					if(angular.isUndefined(resp.data)){
						var num = 0;
					}else{
						var num = angular.isArray(resp.data)?resp.data.length:1
					}
					resp.pagination.totalItems =num;	// 共有多少条数据
					resp.pagination.allItem=[];
					for(var i=0; i<num; i+=numPages){
						resp.pagination.allItem.push(resp.data.slice(i, i+numPages));
					}
					if(typeof(callback) == 'function') callback(resp);
				});
			},
			getBase: function(refresh){
				if(!$window.sessionStorage.getItem('baseData') || refresh){
					config.method = 'get';
					config.params = {action: 'Ajax', module: 'getBase'};
					$http(config).success(function(resp){
						$window.sessionStorage.setItem("baseData", JSON.stringify(resp.data));
					});
				}
			}
		}
	});
	app.run(function(editableOptions, editableThemes, xhr) {
		xhr.getBase(true);
		editableThemes.bs3.inputClass = 'input-sm';
		editableThemes.bs3.buttonsClass = 'btn-sm';
		editableOptions.theme = 'bs3';
	});
	app.controller('topCtrl', function($scope){
		$scope.$on('nav', function(event, data){
			$scope.nav = data;
		});
	});
});