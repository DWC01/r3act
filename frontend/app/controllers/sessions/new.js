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
    signIn: function() {
      var data;

      data = this.getProperties('email', 'password');

        // send a POST request to the /sessions api with the form data
        Ember.$.post('/session', data).then(function(response) {  
            // set the ajax header with the returned access_token object
            Ember.$.ajaxSetup({
              headers: {
                'Authorization': 'Bearer ' + response.api_key.access_token
              }
            });

          }, function(error) {
          if (error.status === 401) {
            // if there is a authentication error the user is informed of it to try again
            alert("wrong user or password, please try again");
          }
        });
    }
  }
});