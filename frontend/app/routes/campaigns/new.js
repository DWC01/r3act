import Ember from 'ember';

export default Ember.Route.extend({
  // beforeModel: function() {
  //   var self = this;
  //   Ember.$.get('/api/campaigns/new').then(
  //     function(response){
  //       var url_id = response.url_id;
  //       self.controllerFor('campaigns.new').set('url_id', url_id);
  //     },
  //     function(response) {
  //       console.log('There was an Error retrieving campaign ID');
  //     }
  //   );
  // }
});
