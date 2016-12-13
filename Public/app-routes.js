/**
 * Created by gadfly on 2016/12/12.
 */
define(function (require){
	var app = require('../Public/app');
	var baseUrl = 'http://water.cn/restful.php?s=/Ajax/angular.html';
	function isNull(param){
		return (typeof(param) != 'undefined' && param && param !=0)?false:true;
	}
	function isUndefined(param){
		return (typeof(param) != 'undefined')?false:true;
	}
	app.config(function($httpProvider, toastrConfig){
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
			extendedTimeOut: 1000,
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
	});
	app.factory('xhr', function($http, toastr){
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
			}
		}
	});
	switch($('script[data-container]').data('container')){
		case 'Home_DemoIndex':
			require('Home_DemoIndex');
			break;
	}
});