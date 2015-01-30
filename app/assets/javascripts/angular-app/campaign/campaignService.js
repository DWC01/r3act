angular
  .module('r3act')

  .factory('Campaign', ['Restangular', function(Restangular) {
    
    return {
      all: Restangular.all('campaigns').getList(),
      find: function(id){
        return Restangular.one('campaigns',id).get()
      },
      ad_tags: function(id){
        return Restangular.one('campaigns',id).getList('ad_tags').$object;
      } 
    }

  }]);