import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['flash', 'sessions'],

  s3_data: undefined,

  // --- Set Dependencies -----------------

  _setAvatarProperties: function() {
    this.get('avatar').set('s3_data', this.s3_data);
  }.observes('s3_data'),

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

  _setFlashMessage: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  // --- Set Clean Up Methods -----------------

  clearAll: function() {
    this._clearUserProperties();
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

  actions: {
    saveChanges: function() {
      // Update Image
      if (this.get('avatar.isDirty')) {        
        this.get('avatar').save().then(
          function(avatar) {
            console.log(avatar);
            this._setFlashMessage('success', 
              'Profile successfully updated');
          }.bind(this), 
          function(reason) {
            console.log(reason);
            this._setFlashMessage('error',
              'There was an error updating your profile Image');
          }.bind(this)
        );
      }

      // Update User
      if (this.get('user.isDirty')) {        
        this.get('user').save().then(
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
      this.get('user').destroyRecord().then(function() {
        this.transitionToRoute('users');
      }.bind(this));
    }
  }
});