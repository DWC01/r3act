import Ember from 'ember';

export default Ember.ArrayController.extend({
  needs: ['application', 'sessions'],

  isLoggedIn: function(){
    return this.get('controllers.sessions.isLoggedIn');
  }.property('controllers.sessions.isLoggedIn'),

  currentUser: function() {
    return this.get('controllers.sessions.currentUser');
  }.property('controllers.sessions.currentUser'),

  actions: {
    toggleSidebar: function() {
      if (this.get('controllers.application').get('isSidebarDisplaying')) {
        Ember.$('.sidebar').removeClass('show-sidebar');
        Ember.$('.page-content-wrap').removeClass('sidebar-push-content');
        this.get('controllers.application').set('isSidebarDisplaying', false);
      } else {
        Ember.$('.sidebar').addClass('show-sidebar');
        Ember.$('.page-content-wrap').addClass('sidebar-push-content');
        this.get('controllers.application').set('isSidebarDisplaying', true);
      }
    }
  }
});