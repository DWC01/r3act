angular
  .module('r3act')

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
    .state('root', {
      url: "/",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns_menu.html',
          controller: 'SidebarController'
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
          templateUrl: 'sidebars/campaigns_menu.html',
          controller: 'SidebarController'
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
          templateUrl: 'sidebars/campaigns_menu.html',
          controller: 'SidebarController'
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
          templateUrl: 'sidebars/campaign_menu.html',
          controller: 'SidebarController'
        },
        'content-top': {
          templateUrl: 'campaigns/media_plan.html',
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
    .state('campaign.analytics', {
      url: "/analytics",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/analytics.html',
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
    .state('adTag', {
      url: "/ad_tags/:id",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaign_menu.html',
          controller: 'SidebarController'
        },
        'content-top': {
          templateUrl: "ad_tags/show.html",
          controller: 'AdTagsController'
        }
      }
    })
  });