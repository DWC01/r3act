/* global Cookies */
import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['application', 'flash'],

  // --- Set Clear -------------
  
  clearAll: function() {
    this.setProperties({
      email: undefined, userErrors: undefined, 
      password: undefined, auth_token: undefined, 
      currentUser: undefined, isLoggedIn: undefined, 
      currentAvatar: undefined
    });
  },

  // --- Set Properties -------------

  _getFormProperties: function() {
    return this.getProperties('email','password');
  },

  // --- Bind Observers -------------

  _authTokenChanged: function() {
    var auth_token = this.get('auth_token');

    if (auth_token) {
      this.setCurrentSession(auth_token);
    } else {
      this.clearCurrentSession();
    }

  }.observes('auth_token'),

  // --- Set Session -------------

  setCurrentSession: function(auth_token) {
    this._setSessionCookie(auth_token);
    this._setCurrentUser(auth_token);
  },

  _setSessionCookie: function(auth_token) {
    Cookies.set('user_session', auth_token, {path: '/' });
  },

  _setCurrentUser: function(auth_token) {
    this.store.find('user', {auth_token: auth_token}).then(function(user) {
      this._setCurrentUserProperties(user.objectAt(0));
      this._setCurrentAvatar(user.objectAt(0));
    }.bind(this));
  },

  _setCurrentUserProperties: function(user) {
    this.setProperties({
      currentUser: user,
      isLoggedIn: true
    });
  },

  _setCurrentAvatar: function(user) {
    this.store.find('avatar', {user_id: user.id}).then(function(avatar) {
      this._setCurrentAvatarProperties(avatar.objectAt(0));
    }.bind(this));
  },

  _setCurrentAvatarProperties: function(avatar) {
    this.set('currentAvatar', avatar);
  },

  // --- Clear Session -------------
  
  clearCurrentSession: function() {
    this.clearAll();
    this._clearSessionCookie();
  },

  _clearSessionCookie: function() {
    Cookies.remove('user_session', { path: '/' });
  },

  // --- Create New Session -------------

  _createNewSession: function(data, attemptedTransition) {
    Ember.$.post('api/sessions', data).then(
      function(response){
        this._signInSucess(response, attemptedTransition);
      }.bind(this),
      function(response) {
        this._signInFailure(response);
      }.bind(this)
    ); 
  },

  // --- Sign In Success -------------

  _signInSucess: function(response, attemptedTransition) {
    if(response.success) {
      this._setAuthToken(response);
      this._setFlashMessage(response.user.first_name);
      this._redirectAfterLogin(attemptedTransition, response.user);
    }
  },

  _setAuthToken: function(response) {
    this.set('auth_token', response.user.auth_token);
  },

  _setFlashMessage: function(name) {
    this.get('controllers.flash').createFlash({
      type: 'success', 
      message: 'Welcome back ' + name + '!'
    });
  },

  _redirectAfterLogin: function(attemptedTransition, user) {
    if (attemptedTransition) {
      attemptedTransition.retry();
      this.set('attemptedTransition', null);
    } else {
      this.transitionToRoute('users.show', user.id );
    }
  },

  // --- Sign In Fail -------------

  _signInFailure: function(response) {
    if (response.status === 422) {
      var errorObject = JSON.parse(response.responseText);
      this.set('userErrors', errorObject.errors);
    }
  },

  // --- Set View Actions -------------

  actions: {
    signIn: function() {
      var data = this._getFormProperties();
      var attemptedTransition = this.get('attemptedTransition');

      this._createNewSession(data, attemptedTransition);
    }

  }

});