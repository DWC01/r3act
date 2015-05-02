/* global Cookies */
import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash', 'sessions'],
      
  _setUserProperties: function() {
    return this.getProperties(
      'first_name', 'last_name','email', 
      'password', 'password_confirmation'
    );
  },

  _clearUserProperties: function() {
    this.setProperties({
      first_name: undefined, last_name: undefined, 
      email: undefined, password: undefined, 
      password_confirmation: undefined,
      posistion: undefined, title: undefined, 
      company: undefined
    }); 
  },

  clearAll: function() {
    this._clearUserProperties();
  },

  _setSessionProperties: function(user) {
    this.get('controllers.sessions').setProperties({
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

  _setSessionCookie: function(auth_token) {
    Cookies.set('user_session', auth_token, {path: '/' });
  },

  _clearSessionProperties: function() {
    this.get('controllers.sessions').setProperties({
      currentUser: undefined,
      isLoggedIn: undefined
    });
  },

  _createUserModel: function() {
    var properties = this._setUserProperties();
    return this.store.createRecord('user', properties);
  },

  _setFlashMessage: function(name) {
    this._flash('success',this._flashMsg(name));
  },

  _flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  _flashMsg: function(name) {
    return 'Welcome ' + name + '!';
  },

  _saveUserModel: function(user) {
    user.save().then(
      function() {
        if (user.get('id')) {
          this._setFlashMessage(user.get('first_name'));
          this._setSessionProperties(user);
          this._setSessionCookie(user.get('auth_token'));
          this._clearUserProperties();
          this.transitionToRoute('users.show', user);
        } 
      }.bind(this),
      function(reason) {
        this.set('user_errors', reason.errors);
      }.bind(this)
    );
  },

  actions: {
    createUser: function() {
      var user = this._createUserModel();
      this._saveUserModel(user);
    }
  }
});