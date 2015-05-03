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
    // controller.clearAll();
    // model.reload();
    
    // var avatar = this._avatar(model).objectAt(0);
    // controller.set('avatar', avatar);
    // controller.set('user', model);
  },
  _avatar: function(model) {
    return this.store.all('avatar').filter(function(avatar) {      
      return String(avatar.get('user_id')) === model.get('id'); 
    });
  }

});