import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['flash'],
  
  isSidebarDisplaying: true,

  flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  }

});
