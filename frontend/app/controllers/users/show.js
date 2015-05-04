import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['flash', 'sessions'],

  s3_data: undefined,

  // --- Set Clear -------------

  clearAll: function() {
    this.setProperties({
      first_name: undefined, last_name: undefined, 
      email: undefined, password: undefined, 
      password_confirmation: undefined,
      posistion: undefined, title: undefined,
      company: undefined
    });
  },
  
  // --- Bind Observers -------------

  _setAvatarProperties: function() {
    this.get('avatar').set('s3_data', this.s3_data);
  }.observes('s3_data'),

  // --- Update Models -------------

  _updateAvatar: function() {
    if (this.get('avatar.isDirty')) {
      this.get('avatar').save().then(
        function(avatar) {
          this._updateCurrentAvatar(avatar);
          this._setSuccessFlash();
        }.bind(this), 
        function(reason) {
          this._setErrorFlash();
        }.bind(this)
      );
    }
  },

  _updateCurrentAvatar: function(avatar) {
    this.get('controllers.sessions').setProperties({
      currentAvatar: avatar,
    });
  },

  _updateUser: function() {
    if (this.get('user.isDirty')) {        
      this.get('user').save().then(
        function(user) {
          this._updateCurrentUser(user);
          this._setSuccessFlash();
        }.bind(this), 
        function() {
          this._setErrorFlash();
        }.bind(this)
      );
    }
  },

  _updateCurrentUser: function(user) {
    this.get('controllers.sessions').setProperties({
      currentUser: user,
    });
  },

   // --- Set Flash -------------

  _setSuccessFlash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: 'success', 
      message: 'Profile successfully updated'
    });
  },

  _setErrorFlash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: 'error', 
      message: 'There was an error updating your profile.'
    });
  },

  // --- Set View Actions -------------

  actions: {
    saveChanges: function() {
      this._updateAvatar();
      this._updateUser();
    },
    delete: function() {
      this.get('user').destroyRecord().then(function() {
        this.transitionToRoute('users');
      }.bind(this));
    }
  }
});