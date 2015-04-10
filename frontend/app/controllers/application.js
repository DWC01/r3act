import Ember from 'ember';

export default Ember.Controller.extend({
    needs: ['flash'],
    flashMessages: Ember.computed.alias("controllers.flash.model"),
    actions: {
      createFlashMessage: function(type, message ) {
        this.get('controllers.flash').createFlash({
          type: type,
          message: message
        });
      }
    }
});
