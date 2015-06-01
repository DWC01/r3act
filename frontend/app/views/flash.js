import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'flash',
  didInsertElement: function() {
    this._set_flash_format();
    this._flash_intro();
    this._flash_outro();
  },

  _flash_intro: function() {
    this.$().hide().fadeIn(500);
  },

  _flash_outro: function() {
    Ember.run.later(this, function() {
        this.$().fadeOut(500);      
    }, 5000);
  },

  _set_flash_format: function() {
    if (!this._isSidebarDisplaying()) {
      this._remove_push_content_class();
    }
  },

  _remove_push_content_class: function() {
    return Ember.$('.page-content-wrap').removeClass('sidebar-push-content');
  },

  _isSidebarDisplaying: function() {
    if(Ember.$('.sidebar-toggle').first().attr('sidebar-visible') === "true"){
      return true;
    } else {
      return false;
    }
  },

  actions: {
    click: function() {
      this.get('controller').get(
        'controllers.flash').removeObject(
        this.get('content'));
      this.destroy();
    }
  }
});
