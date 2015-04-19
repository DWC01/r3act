import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    delete: function() {
      var self = this;
      this.get('model').destroyRecord().then(function() {
        self.transitionToRoute('users');
      });
    }
  }

});