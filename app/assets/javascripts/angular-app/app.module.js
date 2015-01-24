angular
  .module('r3act', [
    'templates', 'restangular',
    'ui.router', 'ngRoute',
    'ngResource', 'xeditable',
    'ngMaterial', 'ngAnimate',
    'ngAria', 'smart-table'])
  
  .config(function(RestangularProvider) {
    // Set base url
    RestangularProvider.setBaseUrl('/api/');
    // Set data response object 
    RestangularProvider.addResponseInterceptor(function(data, operation, what, url, response, deferred) {
      var extractedData = data.r3act;
      return extractedData;
    });
  })

  // configs xeditable
  .run(function(editableOptions) {
    editableOptions.theme = 'bs3';
  });