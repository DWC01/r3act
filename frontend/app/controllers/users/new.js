import Ember from 'ember';

export default Ember.ArrayController.extend({
  needs: ['flash'],
  actions: {
    flash: function(type, message) {
      this.get('controllers.flash').createFlash({
        type: type,
        message: message
      });
    },
    createUser: function() {

      var self = this;
      var first_name  = this.get('first_name');
      var last_name   = this.get('last_name');
      var email       = this.get('email');
      var password    = this.get('password');
      var password_confirmation  = this.get('password_confirmation');

      var user = this.store.createRecord('user', {
        first_name: first_name,
        last_name:  last_name,
        email:      email,
        password:   password,
        password_confirmation: password_confirmation
      });

      user.save().then(
      // Success
      function(value) {
         if (user.get('id')) {
         self.send('flash', 'success', 'What up ' + user.get('first_name') + '!');
          
          self.set('first_name',  '');
          self.set('last_name',   '');
          self.set('email',       '');
          self.set('password',    '');
          self.set('password_confirmation',    '');

          user.deleteRecord();
          self.transitionToRoute('users.show', user);
          } 
      },
      // Fail
      function(reason){
        self.set('user_errors', reason.errors);
      });
    
    }
  }
});