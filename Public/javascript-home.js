/**
 * Created by gadfly on 2016/12/12.
 */
var baseUrl = 'http://water.cn/restful.php?s=Ajax/angular.html';
var jq = $.noConflict();
function isNull(param){
	return (typeof(param) != 'undefined' && param && param !=0)?false:true;
}
function isUndefined(param){
	return (typeof(param) != 'undefined')?false:true;
}
(function(){
	var app = angular.module('starter', ['ui.bootstrap', 'xeditable', 'ngFileUpload', 'ngAnimate', 'toastr', 'cgBusy']);
	app.config(function($httpProvider, toastrConfig){
		$httpProvider.defaults.headers.post = {'Content-Type': 'application/x-www-form-urlencoded'};
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
			service: function(param, callback){
				return $http({
					url: baseUrl,
					method: "POST",
					data: param,
					timeout: 30000
				}).success(function(resp){
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
							toastr.info(resp.msg, isNull(resp.title) ? '操作提醒！' : resp.title);
							break;
					}
					if(typeof(callback) == 'function') callback(resp);
				});
			}
		}
	});
});