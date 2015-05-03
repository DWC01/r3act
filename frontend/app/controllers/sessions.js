/* global Cookies */
import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['application', 'flash'],

  _getFormProperties: function() {
    return this.getProperties('email','password');
  },

  clearAll: function() {
    this.setProperties({
      email: undefined, userErrors: undefined, 
      password: undefined, auth_token: undefined, 
      currentUser: undefined, isLoggedIn: undefined, 
      currentAvatar: undefined
    });
  },

  _accessTokenChanged: function() {
    var auth_token = this.get('auth_token');
    if (auth_token) {
      Cookies.set('user_session',  this.get('auth_token'), {path: '/' });
    } else {
      Cookies.remove('user_session', { path: '/' });
    }
  }.observes('auth_token'),


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

  _signInSucess: function(response, attemptedTransition) {
    if(response.success) {   
      this._setCurrentUser(response);
      this._setCurrentAvatar(response);
      this._redirectAfterLogin(attemptedTransition, response.user);
      this._setFlashMessage(response.user.first_name);
    }
  },

  _setCurrentUser: function(response) {
    this.store.find('user', response.user.id).then(function(user) {
      this._setCurrentUserProperties(user);
    }.bind(this));
  },

  _setCurrentUserProperties: function(user) {
    this.setProperties({
      currentUser: {
        first_name: user.get('first_name'),
        last_name: user.get('last_name'),
        email: user.get('email'),
        avatar_original: user.get('avatar_original'),
        avatar_profile: user.get('avatar_profile'),
        avatar_nav: user.get('avatar_nav'),
        id: user.get('id')
      },
      isLoggedIn: true,
      auth_token: user.get('auth_token')
    });
  },

  _setCurrentAvatar: function(response) {
    this.store.find('avatar', response.user.id).then(function(avatar) {
      this._setCurrentAvatarProperties(avatar);
    }.bind(this));
  },

  _setCurrentAvatarProperties: function(avatar) {
    this.set('currentAvatar', avatar);
  },

  _redirectAfterLogin: function(attemptedTransition, user) {
    if (attemptedTransition) {
      attemptedTransition.retry();
      this.set('attemptedTransition', null);
    } else {
      this.transitionToRoute('users.show', user.id );
    }
  },

  _setFlashMessage: function(name) {
    this.get('controllers.flash').createFlash({
      type: 'success', 
      message: 'Welcome back ' + name + '!'
    });
  },

  _signInFailure: function(response) {
    if (response.status === 422) {
      var errorObject = JSON.parse(response.responseText);
      this.set('userErrors', errorObject.errors);
    }
  },

  actions: {
    signIn: function() {
      var data = this._getFormProperties();
      var attemptedTransition = this.get('attemptedTransition');

      this._createNewSession(data, attemptedTransition);
    }

  }// End Actions

});