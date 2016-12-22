/**
 * Created by gadfly on 2016/12/22.
 */
define(function (require){
	var app = require('../app');
	require('angular_xeditable');
	app.useModule('xeditable');
	/*app.run(function(editableOptions) {
		editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
		//$window.sessionStorage.setItem("theme", 'bs3');
	});*/
	app.controller('WaterStandardCtrl', function($scope){
		$scope.Standard = [];
		$scope.addRiverwayCurve = function(){
			$scope.inserted = {
				LNNM: '',
				BGTM: '',
				PTNO: '',
				Z: '',
				Q: '',
				COMMENTS: ''
			};
			$scope.Standard.push($scope.inserted);
			$scope.$emit('Standard', $scope.Standard);
		}
	});
});