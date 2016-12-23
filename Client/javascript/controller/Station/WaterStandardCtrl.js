/**
 * Created by gadfly on 2016/12/22.
 */
define(function (require){
	var app = require('../../app');
	require('angular_xeditable');
	app.useModule('xeditable');
	app.controller('WaterStandardCtrl', function($scope, $filter, editableOptions, editableThemes, xhr){
		$scope.nav = {
			home: {title: '首页', url: 'Home'},
			library: {title: '水质异常参照标准数据列表', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		editableThemes.bs3.inputClass = 'input-sm';
		editableThemes.bs3.buttonsClass = 'btn-sm';
		editableOptions.theme = 'bs3';
		$scope.promise = xhr.service('get', {action: 'station', module: 'getLists', op: 'WaterStandard'}, function(resp){
			$scope.Standard = resp.data;
		});
		$scope.statuses = [
			{value: 0, text: '禁用'},
			{value: 1, text: '启用'}
		];
		$scope.submit = function() {
			$scope.promise = xhr.service('POST', {action: 'station', module: 'setXediTable', op: 'WaterStandard', data: JSON.stringify($scope.Standard)}, function(resp){
				$scope.Standard = resp.data;
			});
		}
	});
});