angular
  .module('app')
  .factory('Dashboard', function($resource) {

    var Dashboard = $resource('http://localhost:3000/api/v1/dashboards/:id.json', {id: '@id'}, {
      update: {
        method: 'PUT'
      }
    });

    return Dashboard;
  });