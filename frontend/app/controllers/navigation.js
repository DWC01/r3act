var NavigationController = Ember.ArrayController.extend({
  actions: {
    toggleSidebar: function() {
      console.log(this);
      $('.sidebar').toggleClass('show-sidebar');
      $('.page-content-wrap').toggleClass('sidebar-push-content');
    }
  }
});
 
export default NavigationController;