/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  
  beforeModel: function() {
    var auth_token = Cookies.get('user_session');
    this._isLoggedIn(auth_token);
  },
  
  _isLoggedIn: function(auth_token) {
    if (auth_token) {
      this.transitionTo('home');
    }
  },

  setupController: function(controller) {
    controller.clearAll();
  }

});