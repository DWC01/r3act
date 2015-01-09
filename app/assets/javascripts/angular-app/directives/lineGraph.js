angular
  .module('r3act')

  .controller('LineGraphsController', function($scope) {
    $scope.chart = null;
     
    $scope.showGraph = function() {
      $scope.chart = c3.generate({
        bindto: '#chart',
          data: {
              columns: [
              ['Google',   30, 200, 100, 400, 150, 250],
              ['Yahoo!7', 130, 300, 200, 500, 250, 350],
              ['iNC',     230, 400, 300, 600, 350, 450],
              ['Amnet',   330, 500, 400, 700, 450, 550],
              ['Amnet1',  430, 600, 500, 800, 550, 650]
              // ['Amnet2',  480, 650, 550, 850, 600, 700],
              // ['Amnet3',  520, 700, 600, 900, 650, 750],
              // ['Amnet4',  570, 750, 700, 950, 700, 800],
              // ['Amnet5',  630, 800, 800, 1000, 750, 850],
              // ['Amnet6',  700, 850, 900, 1050, 800, 900],
            ]
          },
          color: {
           /*WealthFront*/  pattern: ['#0099ff', '#00ccff', '#27ae60', '#30d94c', '#6bff84']
           // /* r3act */ pattern: ['#f005f8', '#a93bda', '#8a67f9', '#6086eb', '#21b8ff', '#0099ff', '#00ccff', '#27ae60', '#30d94c', '#6bff84']

          },
          axis: {
            x: {
              tick: {
                values: ['1/1/2015', '1/30/2015']
              },
              label: {
                text: 'Date'
              }
            },
            y: {
              tick: {
              values: [100, 300, 500, 700]
              },
              label: {
                text: 'Discrepancy %'
              }
            },
          },
          tooltip: {
            format: {
              title: function (x) { return 'Date: ' + x; },
              name: function (name, ratio, id, index) { return name; },
              value: function (value, ratio, id, index) { return value + '%'; }
            }
          }
        });     
    }
  })

  .directive('lineGraph', function(){
    return function(scope) {
      
    }
  })