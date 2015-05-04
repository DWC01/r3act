import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function (controller, model) {
    controller.clearAll();
    controller.set('user', model);
    this._setAvatar(controller, model);
  },
  _setAvatar: function(controller, user) {
    this.store.find('avatar', {user_id: user.id}).then(function(avatar) {
      controller.set('avatar', avatar.objectAt(0));
    }.bind(this));
  }
});