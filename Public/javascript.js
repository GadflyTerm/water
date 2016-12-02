/**
 * Created by gadfly on 2016/11/17.
 */
var jq = $.noConflict();
function isNull(param){
	return (typeof(param) != 'undefined' && param && param !=0)?false:true;
}
function isUndefined(param){
	return (typeof(param) != 'undefined')?false:true;
}
(function(){
	var app = angular.module('starter', ['ui.bootstrap', 'xeditable']);
	app.run(function(editableOptions) {
		editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
	});
    app.controller('StationAddCtrl', function($scope){
        "添加新的监测站控制器";
        $scope.station = {
            STBPRP: {
                USFL: 0
            },
			STSMTASK: {
				OFFICER: '',
				MPHONE: ''
			},
            RVFCCH: {},
            RSVRFCCH: {}
        };
        $scope.tab = {
            RR_tab: false,
            ZQ_tab: false,
			DD_tab: false,
			SS_tab: false,
            step: false,
            STBPRP_title: '监测站基础信息'
        };
        $scope.jumpToUrl = function () {
            //$location.replace('http://water.cn/setting.php?s=/station/lists.html');
            window.location.replace('/setting.php?s=/station/lists.html')
        };
        $scope.mySTTP = function(){
            switch($scope.station.STBPRP.STTP){
                case 'RR':
                    $scope.tab = {
                        RR_tab: true,
                        ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
                        step: true,
                        active: 2,
                        STBPRP_title: '第一步 水库水文站基础信息'
                    };
                    break;
                case 'ZZ':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: true,
						DD_tab: false,
						SS_tab: false,
						step: true,
						active: 2,
						STBPRP_title: '第一步 河道水文站基础信息'
					};
					break;
                case 'ZQ':
                    $scope.tab = {
                        RR_tab: false,
                        ZQ_tab: true,
						DD_tab: false,
						SS_tab: false,
                        step: true,
                        active: 2,
                        STBPRP_title: '第一步 河道水位站基础信息'
                    };
                    break;
				case 'DD':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: true,
						SS_tab: false,
						step: false,
						active: 1,
						STBPRP_title: '堰闸水文站基础信息'
					}
					break;
				case 'PP':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
						step: false,
						STBPRP_title: '雨量站基础信息'
					};
					break;
				case 'SS':
					$scope.tab = {
						RR_tab: false,
						ZQ_tab: false,
						DD_tab: false,
						SS_tab: true,
						step: true,
						active: 2,
						STBPRP_title: '第一步 墒情站基础信息'
					};
					break;
                default:
                    $scope.tab = {
                        RR_tab: false,
                        ZQ_tab: false,
						DD_tab: false,
						SS_tab: false,
                        step: false,
                        STBPRP_title: '监测站基础信息'
                    };
            }
        };
        $scope.nextStep = function(){
			console.log($scope.station);
            $scope.activeJustified = $scope.tab.active;
        };
        
        $scope.ZVARL = []
        $scope.addReservoirCurve = function(){
			$scope.inserted = {
				MSTM: '',
				PTNO: '',
				RZ: '',
				W: '',
				WSFA: ''
			};
			$scope.ZVARL.push($scope.inserted);
		}
    });
}());