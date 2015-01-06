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
      
      pageMenu.plans = [
        {name: "Media Partners"},
        {name: "Placements"},
        {name: "Budgets / Pacing"}
      ];

      pageMenu.traffics = [
        {name: "Traffic Tags"}
      ];

      pageMenu.analytics = [
        {name: "Pacing"},
        {name: "Discrepancies"},
        {name: "Reports"}
      ];

  });