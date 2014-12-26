angular
  .module('r3act', [])
  
  .controller('CampaignController', function($scope){
    $scope.menuHeaders = [
      {"id": 0, "header": "Summary"},
      {"id": 1, "header": "Transactions"},
      {"id": 2, "header": "Data"}
    ];

    $scope.currentHeader = null;

    function setCurrentHeader(header) {
      $scope.currentHeader = header;
    }

    $scope.setCurrentHeader = setCurrentHeader;
  })


