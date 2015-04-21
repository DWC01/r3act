/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var self = this, auth_token = Cookies.get('user_session');

    if (auth_token) { 
      Ember.$.get('/api/current_user', {auth_token: auth_token}).then(
        function(user) {
          self._setSessionProperties(user);
        },
        function() {
          self._clearSessionProperties();
      });
    }
  },
  _setSessionProperties: function(user) {
    this.controllerFor('sessions').setProperties({
      currentUser: user,
      isLoggedIn: true
    });
  },
  _clearSessionProperties: function() {
    this.controllerFor('sessions').setProperties({
      currentUser: undefined,
      isLoggedIn: undefined
    });
  }
});