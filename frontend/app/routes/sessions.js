/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var access_token = Cookies.get('user_session');

    if (access_token) {
      this.transitionTo('home');
    } 
  },
  setupController: function(controller) {
    controller.clearAll();
  }
});