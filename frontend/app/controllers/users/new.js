import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash', 'sessions'],

  // --- Set Clear -------------

  clearAll: function() {
    this.setProperties({
      first_name: undefined, last_name: undefined, 
      email: undefined, password: undefined, 
      password_confirmation: undefined, 
      user_errors: undefined
    }); 
  },

  // --- Save User Model -------------

  _saveUserModel: function(model) {
    model.save().then(
      function(user) {
        if (user.get('id')) {
          this._setAuthToken(user.get('auth_token'));
          this._setFlashMessage(user.get('first_name'));
          this.transitionToRoute('users.show', user.get('id'));
        } 
      }.bind(this),
      function(reason) {
        this.set('user_errors', reason.errors);
      }.bind(this)
    );
  },
  
  // -- Set Auth Token, triggers new session
  _setAuthToken: function(auth_token) {
    this.get('controllers.sessions').set('auth_token',auth_token);
  },

  _setFlashMessage: function(name) {
    this.get('controllers.flash').createFlash({
      type: 'success', 
      message: 'Welcome '+name+'!'
    });
  },

  // --- Set View Actions -------------

  actions: {
    createUser: function() {
      var user = this.get('user');
      this._saveUserModel(user);
    }
  }
});