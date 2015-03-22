angular
  .module('r3act')

  .config(function ($routeProvider, $locationProvider) {
    $routeProvider.when('/campaigns/:id', {
      controller: 'CampaignController'
    });
    $routeProvider.when('/ad_tags/:id', {
      controller: 'AdTagsController'
    });

    $locationProvider.html5Mode(true);
  })

  .config(function($stateProvider, $urlRouterProvider) {
  // For any unmatched url, redirect to /
  $urlRouterProvider.otherwise("/");

  // Remove trailing slashes  
  $urlRouterProvider.rule(function($injector, $location) {
    var path = $location.path();
    var hasTrailingSlash = path[path.length-1] === '/';
    if(hasTrailingSlash) {      
      var newPath = path.substr(0, path.length - 1); 
      return newPath; 
    } 
  });

  // Set states
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
          controller: 'CampaignController'
        }
      }
    })
    .state('users', {
      url: "/users",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns_menu.html',
          controller: 'SidebarController'
        },
        'content-top': {
          templateUrl: 'users/index.html',
          controller: 'UsersController'
        }
      }
    })
    .state('user', {
      url: "/users/:id",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns_menu.html',
          controller: 'SidebarController'
        },
        'content-top': {
          templateUrl: 'users/show.html',
          controller: 'UsersController'
        }
      }
    })
    .state('users/new', {
      url: "/sign_up",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns_menu.html',
          controller: 'SidebarController'
        },
        'content-top': {
          templateUrl: 'users/new.html',
          controller: 'UsersController'
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
          controller: 'CampaignController'
        }
      }
    })
    .state('campaigns/new', {
      url: "/campaigns/new",
      views: {
        'sidebar': {
          templateUrl: 'sidebars/campaigns_new_menu.html',
          controller: 'SidebarController'
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
          templateUrl: 'campaigns/components/media_plan.html',
          controller: 'CampaignController'
        }
      }
    })
    .state('campaign.trafficking', {
      url: "/trafficking",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/components/trafficking.html',
          controller: 'CampaignController'
        }
      }
    })
    .state('campaign.analytics', {
      url: "/analytics",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/components/analytics.html',
          controller: 'CampaignController'
        }
      }
    })
    .state('campaign.wrap_up', {
      url: "/wrap_up",
      views: {
        'content-top@': {
          templateUrl: 'campaigns/components/wrap_up.html',
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