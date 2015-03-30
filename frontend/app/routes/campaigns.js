import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    console.log("Loaded Route campaigns");
    return this.store.find('campaign');
  }
});
