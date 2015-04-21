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
      Ember.$('.sidebar').toggleClass('show-sidebar');
      Ember.$('.page-content-wrap').toggleClass('sidebar-push-content');
    }
  }
});