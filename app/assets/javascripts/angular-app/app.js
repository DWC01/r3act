angular
  .module('r3act', [
    'templates', 'restangular',
    'ui.router', 'ngRoute',
    'ngResource', 'xeditable',
    'ui.bootstrap'])
  
  // Params to pass state to router
  // $scope to pass attributes to directives
  
  .config(function(RestangularProvider) {
    // Set base url
    RestangularProvider.setBaseUrl('/api/');
    // Set data response object 
    RestangularProvider.addResponseInterceptor(function(data, operation, what, url, response, deferred) {
      var extractedData = data.r3act;
      return extractedData;
    });

  })

  .config(function ($routeProvider, $locationProvider) {
    
    $routeProvider.when('/campaigns/:id', {
      controller: 'CampaignsController'
    });

    $routeProvider.when('/ad_tags/:id', {
      controller: 'AdTagsController'
    });

    $locationProvider.html5Mode(true);
  })

  .config(function($stateProvider, $urlRouterProvider) {
  // For any unmatched url, redirect to /
  $urlRouterProvider.otherwise("/");
  // Now set up the states
  $stateProvider
    .state('/', {
      url: "/",
      templateUrl: 'campaigns/campaigns.html',
      controller: 'CampaignsController'
    })
    .state('campaigns', {
      url: "/campaigns",
      templateUrl: 'campaigns/campaigns.html',
      controller: 'CampaignsController'
    })
    .state('campaigns/', {
      url: "/campaigns/",
      templateUrl: 'campaigns/campaigns.html',
      controller: 'CampaignsController'
    })
    .state('campaign', {
      url: "/campaigns/:id",
      templateUrl: "campaigns/campaign.html",
      controller: 'CampaignsController'
    })
    .state('adTag', {
      url: "/ad_tags/:id",
      templateUrl: "ad_tags/ad_tag.html",
      controller: 'AdTagsController'
    })
  })

  // configs xeditable
  .run(function(editableOptions) {
    editableOptions.theme = 'bs3';
  });



