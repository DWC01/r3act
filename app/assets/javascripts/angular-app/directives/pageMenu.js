angular
  .module('r3act')

  .directive('pageMenu', function pageMenu() {
    // linking function
    return {
      controller: 'PageMenu as pageMenu',
      templateUrl: 'directives/page_menu.html'
    }
  })

  .controller('PageMenu', 
    function PageMenu($scope) {
      var pageMenu = this;
      
      pageMenu.flights = [
        {name: "iNC"},
        {name: "Yahoo!7"},
        {name: "Google"}
      ];

      pageMenu.datas = [
        {name: "Pacing"},
        {name: "Discrepancies"}
      ];

  });