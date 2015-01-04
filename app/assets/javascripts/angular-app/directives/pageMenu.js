angular
  .module('r3act')

  .directive('pageMenu', function(){
    // linking function
    return function($scope) {
      controller: 'PageMenu as pageMenu',
      templateUrl: 'directives/pageMenu.html'
    }
  })

  .controller('PageMenu', function PageMenu(){

  });