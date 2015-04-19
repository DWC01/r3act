import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['flash'],
  actions: {
    saveChanges: function() {
      if (this.get('model.isDirty')) {
        this.get('model').save();
      }
    },
    delete: function() {
      var _this = this;
      this.get('model').destroyRecord().then(function() {
        _this.transitionToRoute('users');
      });
    }
  }
});