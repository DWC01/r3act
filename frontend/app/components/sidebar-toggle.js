import Ember from 'ember';

export default Ember.Component.extend({

  classNames: ['page-menu-toggle'],

  isSidebarDisplaying: true,

  click: function() {
    if (this.isSidebarDisplaying) {
      Ember.$('.sidebar').removeClass('show-sidebar');
      Ember.$('.page-content-wrap').removeClass('sidebar-push-content');
      this.isSidebarDisplaying = false;
    } else {
      Ember.$('.sidebar').addClass('show-sidebar');
      Ember.$('.page-content-wrap').addClass('sidebar-push-content');
      this.isSidebarDisplaying = true;
    }
  }

});
