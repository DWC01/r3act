/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var auth_token = Cookies.get('user_session');

    if (auth_token) { 
      Ember.$.get('/api/current_user', {auth_token: auth_token}).then(
        function(data) {
          this._setSessionProperties(data);
        }.bind(this),
        function() {
          this._clearSessionProperties();
      }.bind(this));
    }
  },
  _setSessionProperties: function(data) {
    this.controllerFor('sessions').setProperties({
      currentUser: data.user,
      currentAvatar: data.avatar.objectAt(0),
      isLoggedIn: true
    });
  },
  _clearSessionProperties: function() {
    this.controllerFor('sessions').setProperties({
      currentUser: undefined,
      currentAvatar: undefined,
      isLoggedIn: undefined
    });
  }
});