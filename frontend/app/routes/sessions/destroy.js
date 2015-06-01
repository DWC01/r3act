import NonCampaignPageRoute from  '../non-campaign-page';

export default NonCampaignPageRoute.extend({
  beforeModel: function() {
    this.controllerFor('sessions').clearCurrentSession();
    this._clearAllModelStore();
    this.transitionTo('home');
  },
  _clearAllModelStore: function() {
    this.store.unloadAll('user');
    this.store.unloadAll('campaign');
    this.store.unloadAll('ad_tag');
    this.store.unloadAll('flight');
    this.store.unloadAll('flash');
    this.store.unloadAll('avatar');
    this.store.unloadAll('company');
  }
});