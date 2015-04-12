import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    toggleSidebar: function() {
      Ember.$('.sidebar').toggleClass('show-sidebar');
      Ember.$('.page-content-wrap').toggleClass('sidebar-push-content');
    }
  }
});