angular
  .module('r3act')

  .factory('Campaign', ['Restangular', function(Restangular) {
    
    return {
      all: function(){
       return Restangular.all('campaigns').getList();
      },
      find: function(id){
        return Restangular.one('campaigns',id).get();
      },
      flights: function(id){
        return Restangular.one('campaigns',id).getList('flights');
      } 
    }

  }]);