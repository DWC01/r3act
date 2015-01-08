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
    .state('app', {
      url: "/",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns-menu.html',
          controller: 'PageMenuController'
        },
        'content-top': {
          templateUrl: 'campaigns/index.html',
          controller: 'CampaignsController'
        }
      }
    })
    .state('campaigns', {
      url: "/campaigns",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns-menu.html',
          controller: 'PageMenuController'
        },
        'content-top': {
          templateUrl: 'campaigns/index.html',
          controller: 'CampaignsController'
        }
      }
    })
    .state('campaigns/', {
      url: "/campaigns/",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns-menu.html',
          controller: 'PageMenuController'
        },
        'content-top': {
          templateUrl: 'campaigns/index.html',
          controller: 'CampaignsController'
        }
      }
    })
    .state('campaign', {
      url: "/campaigns/:id",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaign-menu.html',
          controller: 'PageMenuController'
        },
        'content-top': {
          templateUrl: 'campaigns/show.html',
          controller: 'CampaignsController'
        }
      }
    })
    .state('campaign.discrepancies', {
      url: "/Discrepancies",
      views: {
        'content-top@': {
          templateUrl: 'dashboards/discrepancies.html',
          controller: 'DashboardsController'
        }
      }
    })
    .state('campaign.pacing', {
      url: "/Pacing",
      views: {
        'content-top@': {
          templateUrl: 'dashboards/pacing.html',
          controller: 'DashboardsController'
        }
      }
    })
    .state('campaign.performance', {
      url: "/Performance",
      views: {
        'content-top@': {
          templateUrl: 'dashboards/performance.html',
          controller: 'DashboardsController'
        }
      }
    })
    .state('adtag', {
      url: "/ad_tags/:id",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaign-menu.html',
          controller: 'PageMenuController'
        },
        'content-top': {
          templateUrl: "ad_tags/show.html",
          controller: 'AdTagsController'
        }
      }
    })
  })// <!-- end states

  // configs xeditable
  .run(function(editableOptions) {
    editableOptions.theme = 'bs3';
  });