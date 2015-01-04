angular
  .module('r3act')

  .controller('AdTagsController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {

    // Set Base (Route Object)
    var baseAdTags = Restangular.all('ad_tags');
    
    // Get All Ad Tags
    baseAdTags.getList().then(function(adTags) {
      $scope.adTags = adTags;
    });

    // Get One Ad Tag
    Restangular.one('ad_tags', $routeParams.id).get().then(function(adTag){
      $scope.adTag = adTag;
    });

    // Save/Update ad tags attributes
    var saveAdTag = function(data) {
      console.log($scope.adTags);
      $scope.adTag.save();
    }
    $scope.saveAdTag = saveAdTag;

  });