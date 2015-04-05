export default Ember.ArrayController.extend({
  actions: {
    toggleSidebar: function() {
      $('.sidebar').toggleClass('show-sidebar');
      $('.page-content-wrap').toggleClass('sidebar-push-content');
    }
  }
});