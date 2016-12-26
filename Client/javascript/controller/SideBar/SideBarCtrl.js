/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	app.controller('SideBarCtrl', function($scope){
		
		$scope.template = {
			quick_sidebar: 'templates/Monitor/quick-sidebar.html',
		}
		$scope.Wlists = {
			id:1,
			rsvname:'江川水库',
			date:'2016-12-08',
			Ept:'20',
			Rfall:'33',
		};
		$scope.Rlists = {
			id:1,
			rsvname:'红河水库',
			date:'2016-12-08',
			Ept:'20',
			Rfall:'33',
		};
		$scope.Zlists = {
			id:1,
			rsvname:'开合闸',
			date:'2016-12-08',
			Ept:'20',
			Rfall:'33',
		};
		$scope.Llists = {
			id:1,
			rsvname:'成功站',
			date:'2016-12-08',
			Ept:'20',
			Rfall:'33',
		};
		$scope.Slists = {
			id:1,
			rsvname:'基地站',
			date:'2016-12-08',
			Ept:'20',
			Rfall:'33',
		};
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