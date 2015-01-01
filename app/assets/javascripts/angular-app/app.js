angular
  
  .module('r3act', [
    'templates',
    'ui.router',
    'ngRoute', 
    'ngResource'
  ])

  .config(['$routeProvider', function($routeProvider){ 
    $routeProvider.when('/',{
      controller: 'CampaignsController'
    }).when('/campaigns/:id',{
      controller: 'CampaignsController',
    }).otherwise({
      redirectTo: '/'
    });  
  }]);
  


  // .config(function($stateProvider) {

    // $stateProvider
    //   .state('campaignHeader', {
    //     url: '',
    //     templateUrl: 'campaigns/campaignHeader.html',
    //     controller: 'CampaignsController'
    //   })
    //   .state('placements', {
    //     url: '',
    //     templateUrl: 'placements.html',
    //     controller: 'CampaignsController'
    //   })
    //   .state('audience', {
    //     url: '',
    //     templateUrl: 'audienceTargeting.html',
    //     controller: 'CampaignsController'
    //   })
    // ;  
  // })


