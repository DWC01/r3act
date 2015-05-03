import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function (controller, model) {
    controller.clearAll();

    var avatar = this.store.find('avatar', model.id);
    controller.set('avatar', avatar);
    controller.set('user', model);
  }
});