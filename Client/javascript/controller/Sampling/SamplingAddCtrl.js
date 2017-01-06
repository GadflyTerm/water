/**
 * Created by gadfly on 2017/1/5.
 */
define(function (require){
	var app = require('../../app');
	app.controller('SamplingAddCtrl', function($scope, $state, xhr){
		$scope.nav = {
			home: {title: '测站报送数据', url: 'Home'},
			library: {title: '测站报送数据列表', url: 'SamplingList'},
			sublib: {title: '添加测站报送数据列表', url: ''},
		};
		$scope.$emit('nav', $scope.nav);
		$scope.promise = xhr.getList({model: 'Station', module: 'stationList'}, {}, function(resp){
			$scope.STBPRP =resp.data;
			$scope.show = {
				PP: false,
				MM: false,
				ZQ: false,
				ZZ: false,
				RR: false,
				DD: false,
				SS: false
			};
			$scope.datetime = {
				today: function(){
					$scope.dt = new Date();
				},
				clear: function(){
					$scope.dt = null;
				},
				popup: {
					opened: false
				},
				openDatepicker: function() {
					$scope.datetime.popup.opened = true;
				},
				options: {
					showWeeks: false,
					maxDate: new Date(),
				},
				date: new Date(),
				time: new Date(),
				hstep: 1,
				mstep: 5,
				ismeridian: true,
			}
			var getNewDatetime = function(){
				var date = new Date($scope.datetime.date);
				var time = new Date($scope.datetime.time);
				return new Date(date.getFullYear(), date.getMonth(), date.getDate(), time.getHours(), time.getMinutes(), '00');
			}
			$scope.sampling = {
				TM: getNewDatetime()
			};
			$scope.mySTTP = function(){
				$scope.sampling.STCD = $scope.STCD.STCD;
				$scope.sampling.STTP = $scope.STCD.STTP;
				switch($scope.STCD.STTP){
					case 'MM':
						$scope.show = {
							PP: false,
							MM: true,
							ZQ: false,
							ZZ: false,
							RR: false,
							DD: false,
							SS: false
						}
						break;
					case 'PP':
						$scope.show = {
							PP: true,
							MM: false,
							ZQ: false,
							ZZ: false,
							RR: false,
							DD: false,
							SS: false
						}
						break;
					case 'ZQ':
					case 'ZZ':
						$scope.show = {
							PP: false,
							MM: false,
							ZQ: true,
							ZZ: false,
							RR: false,
							DD: false,
							SS: false
						}
						break;
					case 'RR':
						$scope.show = {
							PP: false,
							MM: false,
							ZQ: false,
							ZZ: false,
							RR: true,
							DD: false,
							SS: false
						}
						break;
					case 'DD':
						$scope.show = {
							PP: false,
							MM: false,
							ZQ: false,
							ZZ: false,
							RR: false,
							DD: true,
							SS: false
						}
						break;
					case 'SS':
						$scope.show = {
							PP: false,
							MM: false,
							ZQ: false,
							ZZ: false,
							RR: false,
							DD: false,
							SS: true
						}
						break;
				}
			}
			$scope.submit = function(){
				$scope.sampling.TM = getNewDatetime($scope.datetime.date, $scope.datetime.time);
				xhr.service('post', {model: 'Sampling', module: 'samplingAdd', data: $scope.sampling}, function(resp){
					swal({
							title: (resp.type.toLowerCase()=='success')?"数据操作成功！":"数据操作失败！",
							text: resp.msg,
							type: resp.type.toLowerCase(),
							showCancelButton: false,
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "确定",
							closeOnConfirm: true
						},
						function(){
							$state.go('SamplingList');
						});
				})
			}
		});
		
	});
});