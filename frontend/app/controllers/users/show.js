import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['flash', 'sessions'],

  s3_key: undefined,

  _setAvatar: function() {
    this.get('model').set('avatar_original', this.s3_key);
  }.observes('s3_key'),

  _setFlashMessage: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  _clearUserProperties: function() {
    this.setProperties({
      first_name: undefined, last_name: undefined, 
      email: undefined, password: undefined, 
      password_confirmation: undefined, avatar_original: undefined,
      posistion: undefined, title: undefined, company: undefined
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

  actions: {
    saveChanges: function() {
      if (this.get('model.isDirty')) {
        this.get('model').save().then(
          function(user) {
            this._setSessionProperties(user);
            this._setFlashMessage('success', 
              'Profile successfully updated');
          }.bind(this), 
          function() {
            this._setFlashMessage('error',
              'There was an error updating your profile');
          }.bind(this)
        );
      } 
      
    },
    delete: function() {
      this.get('model').destroyRecord().then(function() {
        this.transitionToRoute('users');
      }.bind(this));
    }
  }
});