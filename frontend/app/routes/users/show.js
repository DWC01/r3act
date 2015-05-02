import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function (controller, model) {
    var avatar = this.store.all('avatar').get('content')[0];

    controller.clearAll();
    controller.set('user', model);
    controller.set('avatar', avatar);
  }

});