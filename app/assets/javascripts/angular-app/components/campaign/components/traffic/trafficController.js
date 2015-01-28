angular
  .module('r3act')

  .controller('TrafficController', 
    function($rootScope, $scope, $route, $routeParams, 
             $stateParams, Restangular, $http) {

    // // Simple GET request example :
    $http.get('http://www.displayadtech.com/api/companies?name=DoubleClick for Publishers').
      success(function(data, status, headers, config) {
        $scope.company = data[0];
        $scope.company.listLogoUrl = data[0].logo.company_list_logo.url
      }).
      error(function(data, status, headers, config) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
      });

    var traffic = function(dfp){
      $scope.trafficking  = 'trafficking';
      $scope.dfp = {};
      $scope.dfp.campaign_id = $scope.campaign.id;
      $scope.dfp.advertiser_id = dfp.advertiser_id;  

      var responsePromise = $http.post("/traffic_ad_tags", $scope.dfp, {});

      responsePromise.success(function(serverData, status, headers, config) {
        console.log(serverData);
        $scope.trafficking  = 'trafficked';

        $scope.creatives = serverData;
       });
      
      responsePromise.error(function(serverData, status, headers, config) {
        $scope.trafficking  = 'trafficked';
        console.log(serverData);
        $scope.trafficError = 'An Error Occurred'
       });
    }
    $scope.traffic = traffic;
 });