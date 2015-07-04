import AuthenticatedRoute from  '../authenticated';

export default AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('creative', params.creative_id);
  },
  setupController: function (controller, model) {
    controller.clearAll();
    controller.set('creative', model);
  }, 
});