import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash'],
      
  _setUserProperties: function() {
    return this.getProperties(
      'first_name', 'last_name','email', 
      'password', 'password_confirmation'
    );
  },

  _clearUserProperties: function() {
    this.setProperties({
      first_name: null, last_name: null, email: null,
      password: null, password_confirmation: null
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
    var _this = this;
    user.save().then(
      function() {
        if (user.get('id')) {
          _this._setFlashMessage(user.get('first_name'));
          _this._destroyUserModel(user);
          _this.transitionToRoute('users.show', user);
        } 
      },
      function(reason) {
        _this.set('user_errors', reason.errors);
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