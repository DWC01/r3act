import Ember from 'ember';

export default Ember.ArrayController.extend({
  queryParams: ['password_reset_token'],

  _getResetProperties: function() {
    return this.getProperties(
      'password', 'password_confirmation',
      'password_reset_token'
    );
  },

  _clearResetProperties: function() {
    this.setProperties({
      password: undefined,
      password_confirmation: undefined,
      password_status: undefined,
      password_reset_token: undefined
    });
  },

  _clearErrors: function() {
    this.setProperties({
      password_error: undefined,
      confirmation_error: undefined
    });
  },

  actions: {
    updatePassword: function() {
      var self = this, data = this._getResetProperties();
      Ember.$.post('/api/password_resets/update', {user: data}).then(
        function(response) {
          self._clearErrors();
          self.set('password_status', response.status);

          self.transitionToRoute('sessions');
        },
        function(response) {

          if (response.responseJSON) {
            var custom_error = response.responseJSON.error
            var password_error = response.responseJSON.password_error
          }

          if (response.responseJSON.errors) {
            var confirmation_error = response.responseJSON.errors.password_confirmation;
          }

          self.set('password_error', password_error);
          self.set('confirmation_error', custom_error || confirmation_error );
        }
      );
    }
  }
});