/* global Cookies */
import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['application'],

  _getFormProperties: function() {
    return this.getProperties('email','password');
  },

  _clearFormProperties: function() {
    this.setProperties({
      email: undefined,
      password: undefined,
      userErrors: undefined
    });
  },

  _clearSessionProperties: function() {
    this.setProperties({
      email: undefined, password: undefined,
      auth_token: undefined, currentUser: undefined,
      isLoggedIn: undefined
    });
  },

  _clearUserErrors: function() {
    this.set('userErrors', undefined);
  },

  clearAll: function() {
    this._clearSessionProperties();
    this._clearUserErrors();
  },

  _accessTokenChanged: function() {
    var auth_token = this.get('auth_token');
    if (auth_token) {
      Cookies.set('user_session',  this.get('auth_token'), {path: '/' });
    } else {
      Cookies.remove('user_session', { path: '/' });
    }
  }.observes('auth_token'),

  _flashMsg: function(name) {
    return 'Welcome back ' + name + '!';
  },

  _setFlashMessage: function(name) {
    this.get('controllers.application').flash('success', this._flashMsg(name));
  },

  _redirectAfterLogin: function(attemptedTransition, user) {
    if (attemptedTransition) {
      attemptedTransition.retry();
      this.set('attemptedTransition', null);
    } else {
      this.transitionToRoute('users.show', user.id );
    }
  },

  _setCurrentUserProperties: function(user) {
    this.setProperties({
      auth_token: user.get('auth_token'),
      isLoggedIn: true,
      currentUser: user.getProperties(
        'id', 'first_name', 'last_name', 'email'
      )
    });
  },

  _signInSucess: function(response, attemptedTransition) {
    var self = this;
    if(response.success) {      
      this.store.find('user', response.user.id).then(function(user) {
        self._setCurrentUserProperties(user);
        self._clearFormProperties();
        self._redirectAfterLogin(attemptedTransition, user);
      });
    }
  },

  _signInFailure: function(response) {
    if (response.status === 422) {
      var errorObject = JSON.parse(response.responseText);
      this.set('userErrors', errorObject.errors);
    }
  },

  _createNewSession: function(data, attemptedTransition) {
    var self = this;
    Ember.$.post('api/sessions', data).then(
      function(response){
        self._signInSucess(response, attemptedTransition);
      },
      function(response) {
        self._signInFailure(response);
      }
    ); 
  },

  actions: {
    signIn: function() {
      var data = this._getFormProperties();
      var attemptedTransition = this.get('attemptedTransition');

      this._createNewSession(data, attemptedTransition);
    }

  }// End Actions

});