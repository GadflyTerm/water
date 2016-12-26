/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	// require('ui_bootstrap_datetimepicker');
	// app.useModule('ui.bootstrap.datetimepicker');
	// require('material_datetimepicker');
	// app.useModule('ngMaterialDatePicker');
	// require('datepicker');
	app.controller('ReportIndexCtrl', function($scope,xhr){
		/*xhr.service('post', {action: 'ac'}, function(resp){
			$scope.myData = resp.data;
		});*/
		
		$scope.nav = {
			home: {title: '监测成果统计', url: 'Home'},
			library: {title: '灌区报表管理', url: ''},
		}
		$scope.$emit('nav', $scope.nav);

		// $scope.Tcate = [
		// 	{id:'1',text:'年'},
		// 	{id:'2',text:'月',},
		// 	{id:'3',text:'日',}
		// ]
		$scope.lists = [{
			id:1,
			date:'2016-12-08',
			rsvname:'丙间水库',
			Rfall:'33',
			Ept:'20',
			WLevel:'0.72',
			Rsv:'60',
			TCPcity:'90',
			DCPcity:'30',
			AWSupply:'60',
			WIntake:'33',
			WSupply:'40',
			WOutake:'0'
		}, {
			id:2,
			date:'2016-12-09',
			rsvname:'妙丰水库',
			Rfall:'33',
			Ept:'20',
			WLevel:'0.72',
			Rsv:'60',
			TCPcity:'90',
			DCPcity:'30',
			AWSupply:'60',
			WIntake:'33',
			WSupply:'40',
			WOutake:'0'
		},{
			id:3,
			date:'2016-12-10',
			rsvname:'间里水库',
			Rfall:'33',
			Ept:'20',
			WLevel:'0.72',
			Rsv:'60',
			TCPcity:'90',
			DCPcity:'30',
			AWSupply:'60',
			WIntake:'33',
			WSupply:'40',
			WOutake:'0'
		}];

		$scope.myData = {
			type: 'Success',
			msg: '数据获取成功',
			data: [
				{ss: 'ss0', dd: 'dd0'},
				{ss: 'ss1', dd: 'dd1'},
			]
		}
		function ctr($scope){
				$scope.isActive = true;
			}
		$scope.dayClick = function(){
			xhr.service('get',{ac:'ac'},function(resp){
				$scope.showTab = {
					year:false,
					mouth:false,
					day:true
				}
				$scope.list = resp.date;
			})
		}
		$scope.mouthClick = function(){
			xhr.service('get',{ac:'ac'},function(resp){
				$scope.showTab = {
					year:false,
					mouth:true,
					day:false
				}
				$scope.list = resp.date;
			})
		}
		$scope.yearClick = function(){
			xhr.service('get',{ac:'ac'}, function(resp){
				$scope.showTab = {
					year:true,
					mouth:false,
					day:false
				}
				$scope.list = resp.date;
			})
		}
	});
	
});