import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['flash'],
  actions: {
    saveChanges: function() {
      if (this.get('model.isDirty')) this.get('model').save();
    },
    delete: function() {
      var self = this;
      this.get('model').destroyRecord().then(function() {
        self.transitionToRoute('users');
      });
    }
  }
});