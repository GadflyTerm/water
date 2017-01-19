/**
 * Created by gadfly on 2016/12/14.
 */
define(function(require) {
  var app = require('../../app');
  // require('material_datetimepicker');
  // app.useModule('ngMaterialDatePicker');
  // require('datepicker');
  // require('datepicker_zh');
  ;
  app.controller('ReportCtrl', function($scope, xhr) {
    /*xhr.service('post', {action: 'ac'}, function(resp){
      $scope.myData = resp.data;
    });*/
    $scope.nav = {
      home: {
        title: '监测成果统计',
        url: 'Home'
      },
      library: {
        title: '灌区报表管理',
        url: ''
      },
    }
    $scope.$emit('nav', $scope.nav);
    $scope.Tcate = [{
      id: '1',
      text: '年'
    }, {
      id: '2',
      text: '月',
    }, {
      id: '3',
      text: '日',
    }]
    $scope.currentPage = 1; // 初始当前页
    $scope.allitem = []; // 存放所有页
    $scope.promise = xhr.getList({
      model: 'Monitor',
      module: 'get_skavg_list',
      data: {
        STTDRCD: '1'
      }
    }, {}, function(resp) {
      $scope.totalItems = resp.pagination.totalItems;
      $scope.allItem = resp.pagination.allItem;
      $scope.currentPage = resp.pagination.currentPage;
      $scope.itemsPerPage = resp.pagination.itemsPerPage;
      $scope.numPages = resp.pagination.numPages;
      $scope.maxSize = resp.pagination.maxSize;
    });

    function ctr($scope) {
      $scope.isActive = true;
    }
    $scope.showTab = {
      year: false,
      month: false,
      day: true
    }
    $scope.popupDay = {
      opened: false
    };
    $scope.openDay = function() {
      $scope.popupDay.opened = true;
    };
    $scope.today = function() {
      $scope.dt = new Date();
    };
    $scope.today();
    $scope.radioReport = 'day';
    $scope.changeReport = function() {
      switch ($scope.radioReport) {
        case 'day':
          $scope.showTab = {
            year: false,
            mouth: false,
            day: true
          };
          $scope.promise = xhr.getList({
            model: 'Monitor',
            module: 'get_skavg_list',
            data: {
              STTDRCD: '1'
            }
          }, {}, function(resp) {
            $scope.totalItems = resp.pagination.totalItems;
            $scope.allItem = resp.pagination.allItem;
            $scope.currentPage = resp.pagination.currentPage;
            $scope.itemsPerPage = resp.pagination.itemsPerPage;
            $scope.numPages = resp.pagination.numPages;
            $scope.maxSize = resp.pagination.maxSize;
          });
          break;
        case 'month':
          $scope.showTab = {
            year: false,
            month: true,
            day: false
          }
          $scope.promise = xhr.getList({
            model: 'Monitor',
            module: 'get_skavg_list',
            data: {
              STTDRCD: '5'
            }
          }, {}, function(resp) {
            $scope.totalItems = resp.pagination.totalItems;
            $scope.allItem = resp.pagination.allItem;
            $scope.currentPage = resp.pagination.currentPage;
            $scope.itemsPerPage = resp.pagination.itemsPerPage;
            $scope.numPages = resp.pagination.numPages;
            $scope.maxSize = resp.pagination.maxSize;
          });
          break;
        case 'year':
          $scope.showTab = {
            year: true,
            month: false,
            day: false
          }
          $scope.promise = xhr.getList({
            model: 'Monitor',
            module: 'get_skavg_list',
            data: {
              STTDRCD: '6'
            }
          }, {}, function(resp) {
            $scope.totalItems = resp.pagination.totalItems;
            $scope.allItem = resp.pagination.allItem;
            $scope.currentPage = resp.pagination.currentPage;
            $scope.itemsPerPage = resp.pagination.itemsPerPage;
            $scope.numPages = resp.pagination.numPages;
            $scope.maxSize = resp.pagination.maxSize;
          });
          break;
      }
    }
  });
});