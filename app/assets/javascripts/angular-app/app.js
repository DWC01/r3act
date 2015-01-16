angular
  .module('r3act', [
    'templates', 'restangular',
    'ui.router', 'ngRoute',
    'ngResource', 'xeditable',
    'ngMaterial', 'ngAnimate',
    'ngAria'])
  
  // Params to pass state to router
  // $scope to pass attributes to directives
  .service("SmithService", function() {
    this.getName = function (name) {
      return name +  " Smith";
    }
  })
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
          templateUrl: 'campaigns/media_plan.html',
          controller: 'CampaignController'
        }
      }
    })
    .state('campaign.analytics', {
      url: "/analytics",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/analytics.html',
          controller: 'CampaignController'
        }
      }
    })
    .state('campaign.trafficking', {
      url: "/trafficking",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/trafficking.html',
          controller: 'CampaignController'
        }
      }
    })
    .state('campaign.wrap_up', {
      url: "/wrap_up",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/wrap_up.html',
          controller: 'CampaignController'
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