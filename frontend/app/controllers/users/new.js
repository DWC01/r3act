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
      password_confirmation: undefined
    }); 
  },

  _setSessionProperties: function(user) {
    this.get('controllers.sessions').setProperties({
      currentUser: {
        first_name: user.get('first_name'),
        last_name: user.get('last_name'),
        email: user.get('email'),
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

  _destroyUserModel: function(user) {
    this._clearUserProperties();
    user.deleteRecord();
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
    return 'What up ' + name + '!';
  },

  _saveUserModel: function(user) {
    var self = this;
    user.save().then(
      function() {
        if (user.get('id')) {
          self._setSessionProperties(user);
          self._setSessionCookie(user.get('auth_token'));
          self._clearUserProperties();
          self.transitionToRoute('users.show', user);
        } 
      },
      function(reason) {
        self.set('user_errors', reason.errors);
      }
    );
  },

  actions: {
    createUser: function() {
      var user = this._createUserModel();
      this._saveUserModel(user);
    }
  }
});