angular
  .module('r3act', [
    'templates', 'restangular',
    'ui.router', 'ngRoute',
    'ngResource', 'xeditable'
  ])

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
    // configure the routing rules here
    $routeProvider.when('/campaigns/:id', {
        controller: 'CampaignsController'
    });
    $locationProvider.html5Mode(true);
  })

  .run(function(editableOptions) {
    editableOptions.theme = 'bs3';
  });