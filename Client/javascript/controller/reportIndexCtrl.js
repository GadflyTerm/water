/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../app');
	app.controller('ReportIndexCtrl', function($scope){
		/*xhr.service('post', {action: 'ac'}, function(resp){
			$scope.myData = resp.data;
		});*/
		
		$scope.nav = {
			home: {title: '监测成果统计', url: 'Home'},
			library: {title: '灌区报表管理', url: ''},
		}
		$scope.$emit('nav', $scope.nav);
		$scope.Tcate = [
			{id:'1',text:'年'},
			{id:'2',text:'月',},
			{id:'3',text:'日',}
		]
		// $scope.date = new Date();
		// $scope.time = new Date();
		// $scope.dateTime = new Date();
		// $scope.minDate = moment().subtract(1, 'month');
		// $scope.maxDate = moment().add(1, 'month');
		
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
	});
	
});