import Ember from 'ember';

export default Ember.Component.extend({
  _intro: function() {
    this.$().css({
      height: "70px"
    });
  },
  _keypressHandler: function() {
    this.$().keypress(function(e) {
      if (e.keyCode === 13 && e.shiftKey !== true) {
        event.preventDefault();
        this._saveChanges();
      }
    }.bind(this));
  },
  _saveChanges: function() {
    this.get('model').set('isEditing', false);
    if (this.get('model.isDirty')) {
      this.get('model').save();
    }
  },
  didInsertElement: function() {
    // this._intro();
    this._keypressHandler();
    // this.$().focus();
  }
});
