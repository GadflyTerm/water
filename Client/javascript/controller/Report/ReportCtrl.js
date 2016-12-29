/**
 * Created by gadfly on 2016/12/14.
 */
define(function (require){
	var app = require('../../app');
	// require('material_datetimepicker');
	// app.useModule('ngMaterialDatePicker');
	require('datepicker');
	require('datepicker_zh');
	app.controller('ReportCtrl', function($scope,xhr){
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

		function ctr($scope){
			$scope.isActive = true;
		}

		$scope.showTab = {
			year:false,
			mouth:false,
			day:true
		}

		$scope.dayClick = function(){
			xhr.service('get',{ac:'ac'},function(resp){
				$scope.showTab = {
					year:false,
					mouth:false,
					day:true
				}
				$scope.lists = resp.date;
			})
		}
		$scope.monthClick = function(){
			xhr.service('get',{ac:'ac'},function(resp){
				$scope.showTab = {
					year:false,
					mouth:true,
					day:false
				}
				$scope.lists = resp.date;
			})
		}
		$scope.yearClick = function(){
			xhr.service('get',{ac:'ac'},function(resp){
				$scope.showTab = {
					year:true,
					mouth:false,
					day:false
				}
				$scope.lists = resp.date;
			})
		}


		$scope.today = function() {
			$scope.dt = new Date();
		};
		$scope.today();
		
		// Disable weekend selection
		$scope.disabled = function(date, mode) {
			return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
		};

		$scope.toggleMin = function() {
			$scope.minDate = $scope.minDate ? null : new Date();
		};
		$scope.toggleMin();

		$scope.open = function($event) {
			$event.preventDefault();
			$event.stopPropagation();

			$scope.opened = true;
		};

		// $scope.dateOptions = {
		// 	formatYear: 'yy',
		// 	startingDay: 1
		// };

		// $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
		// $scope.format = $scope.formats[3];

		// $scope.zh = datepicker.

				$scope.myText = '没有选择';  
		    $scope.currentDate = '';  
		    $scope.updateMyText = function(date) {  
		        $scope.myText = '选择';  
		    };  


		    var liveDate;
  
  $scope.$watch('myDate', function (value) {
    try {
     liveDate = new Date(value);
    } catch(e) {}
    
    if (!liveDate) {
    
      $scope.error = "This is not a valid date";
    } else {
      $scope.error = false;
    }
  });
  

	 });

	   
        app.directive('datepicker', function() {  
            return {  
                //强制AngularJS把指令限定为只支持属性  
                restrict: 'A',  
                //总是和ng-model配合使用  
                require:'?ngModel',  
                scope: {  
                    //此方法需要与预先定义好，然后传递给视图控制器中的指令  
                    select: '&' //把我们所引用的select函数绑定到右边的作用域中  
                },  
                link: function(scope, element, attrs, ngModel) {  
                    if(!ngModel) return;  
                      
                    var optionsObj = {};  
                      
                    optionsObj.dataFormat = 'mm/dd/yy';  
                    var updateModel = function(dateTxt) {  
                        scope.$apply(function() {  
                            //调用AngularJS内部的工具更新双向绑定关系  
                            ngModel.$setViewValue(dateTxt);  
                        });  
                    };  
                      
                    optionsObj.onSelect = function(dateTxt, picker) {  
                        updateModel(dateTxt);  
                        if(scope.select) {  
                            scope.$apply(function() {  
                                scope.select({date: dateTxt});  
                            });  
                        }  
                    };  
                      
                    ngModel.$render = function() {  
                        //使用AngularJS内部的'binding-specific'变量  
                        element.datepicker('setDate', ngModel.$viewValue || '');  
                    };  
                    element.datepicker(optionsObj);  
                }  
            };  
        });  

});