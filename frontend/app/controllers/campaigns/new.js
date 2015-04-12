import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash'],
      
  _setCampaignProperties: function() {
    return this.getProperties('name');
  },

  _clearCampaignProperties: function() {
    this.setProperties({name: null});
  },

  _createCampaignModel: function() {
    var properties = this._setCampaignProperties();
    return this.store.createRecord('campaign', properties);
  },

  _destroyCampaignModel: function(campaign) {
    this._clearCampaignProperties();
    campaign.deleteRecord();
  },

  _setFlashMessage: function(name) {
    this._flash('success',this._flashMsg(name));
  },

  _flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  _flashMsg: function(name) {
    return name + ' successfully created!';
  },

  _saveCampaignModel: function(campaign) {
    var _this = this;
    campaign.save().then(
      function() {
        if (campaign.get('id')) {
          _this._setFlashMessage(campaign.get('name'));
          _this._destroyCampaignModel(campaign);
          _this.transitionToRoute('campaigns.show', campaign);
        } 
      },
      function(reason) {
        _this.set('campaign_errors', reason.errors);
      }
    );
  },

  actions: {
    createCampaign: function() {
      var campaign = this._createCampaignModel();
      this._saveCampaignModel(campaign);
    }
  }
});