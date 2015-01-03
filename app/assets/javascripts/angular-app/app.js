angular
  .module('r3act', [
    'templates',
    'restangular'
  ])

  .config(function(RestangularProvider) {

    RestangularProvider.setBaseUrl('/api/');

    // add a response intereceptor
    RestangularProvider.addResponseInterceptor(function(data, operation, what, url, response, deferred) {
      var extractedData;
      // .. to look for getList operations
      if (operation === "getList") {
        // .. and handle the data and meta data
        extractedData = data.campaigns;
      } else {
        extractedData = data;
      }
      return extractedData;
    });

  });