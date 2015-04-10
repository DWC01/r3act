import Ember from 'ember';

export default Ember.ArrayController.extend({
  // Puts Flash Message Into Store
  createFlash: function(options) {
    if (options.type !== null && options.message !== null) {
      this.pushObject(this.get('store').createRecord(
        "flash", {
          type: options.type,
          message: options.message
        }
      ));
    }
  }

});
