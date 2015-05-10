import Ember from 'ember';

export default Ember.Component.extend({

  classNames: ['page-menu-toggle'],

  attributeBindings: ['label:sidebar-visible'],

  sidebarDisplaying: true,

  label: function() {
    if(this.sidebarDisplaying) {
      return "true";
    } else {
      return "false";
    }
  }.property('sidebarDisplaying'),

  click: function() {
    if (this.get('sidebarDisplaying')) {
      Ember.$('.sidebar').removeClass('show-sidebar');
      Ember.$('.page-content-wrap').removeClass('sidebar-push-content');
      this.set('sidebarDisplaying', false);
    } else {
      Ember.$('.sidebar').addClass('show-sidebar');
      Ember.$('.page-content-wrap').addClass('sidebar-push-content');
      this.set('sidebarDisplaying', true);
    }
  }

});
