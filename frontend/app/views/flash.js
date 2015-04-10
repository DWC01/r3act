import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'flash',
  didInsertElement: function() {
    this.$().hide().fadeIn(300);
    Ember.run.later(this, function() {
        this.$().fadeOut(300);      
    }, 4000);
  },
  actions: {
    click: function(alert) {
      this.get('controller').get(
        'controllers.flash').removeObject(
        this.get('content'));
      this.destroy();
    }
  }
});
