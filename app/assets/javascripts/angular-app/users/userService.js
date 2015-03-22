angular
  .module('r3act')

  .factory('User', ['Restangular', function(Restangular) {
    
    return {
      all: function(){
       return Restangular.all('users').getList();
      },
      find: function(id){
        return Restangular.one('users',id).get();
      }
    }

  }]);