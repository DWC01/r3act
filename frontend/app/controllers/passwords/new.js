import Ember from 'ember';

export default Ember.ArrayController.extend({
  _getFormProperties: function() {
    return this.getProperties('email');
  },

  _clearFormProperties: function() {
    this.setProperties({
      email: undefined,
      password_status: undefined
    });
  },

  actions: {
    emailInstructions: function() {
      var self = this, data = this._getFormProperties();
      self.set('password_status', 'Validating email');

      Ember.$.post('/api/password_resets', data).then(
        function(response) {
          self.set('password_status', response.status);
        },
        function(response) {
         self.set('password_status', response.responseJSON.error);
        }
      );
    }
  }
});      