import Ember from 'ember';

export default Ember.Controller.extend({  
  
  needs: ['flash', 'sessions', 'campaigns', 
    'campaigns/media_plan', 'campaigns/analytics',
    'campaigns/trafficking', 'campaigns/wrap_up'],

  isLoggedIn: function(){
    return this.get('controllers.sessions.isLoggedIn');
  }.property('controllers.sessions.isLoggedIn'),

  currentUser: function() {
    return this.get('controllers.sessions.currentUser');
  }.property('controllers.sessions.currentUser'),

  currentAvatar: function() {
    return this.get('controllers.sessions.currentAvatar');
  }.property('controllers.sessions.currentAvatar'),

  campaign: function() {
    return this.get('controllers.campaigns/media_plan.campaign')||
      this.get('controllers.campaigns/analytics.campaign')||
      this.get('controllers.campaigns/trafficking.campaign')||
      this.get('controllers.campaigns/wrap_up.campaign');
           
  }.property('controllers.campaigns/media_plan.campaign',
    'controllers.campaigns/analytics.campaign',
    'controllers.campaigns/trafficking.campaign',
    'controllers.campaigns/wrap_up.campaign'),

  flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  // -- Setting Up Sidebar -----------

  currentResource: function() {
    var resource = this.get('currentPath').split('.').shift();
    var route = this.get('currentPath').split('.').pop();

    if (resource === 'campaigns') {
      return this._setCampaignResource(route);
    }
    return 'main';
  }.property('currentPath'),

  _setCampaignResource: function(route) {
    if (route === 'index'){
      return 'campaigns';
    } else if (route === 'new') {
      return 'newCampaign';
    } else {
      return 'campaign';
    }
  },

  newCampaign: function() {
    return this.get('currentResource') === 'newCampaign';
  }.property('currentResource'),

  panel: function() {
    if (this.get('currentResource') === 'newCampaign') {
      return {one: this._newCampaignPanel(), two: this._settingsPanel()};
    } else if (this.get('currentResource') === 'campaign') {
      return {one: this._campaignPanel(), two: this._settingsPanel()};
    } else if (this.get('currentResource') === 'campaigns') {
      return {one: this._menuPanel()};
    } else {
      return {one: this._menuPanel()};
    } 
  }.property('currentResource'),

  _menuPanel: function() {
    return {
      title:'Menu',
      icon: 'fa fa-file-o media-plan page-menu-i',
      links: [{
        title: 'Profile',
        path: 'users.show',
        id: this.get('currentUser')
      },{
        title: 'Campaigns',
        path: 'campaigns.index'
      },{
        title: '+ New Campaign',
        path: 'campaigns.new'
      }]
    };
  },

  _campaignsPanel: function() {
    return {
      title:'Campaigns',
      icon: 'fa fa-bookmark-o page-menu-i',
      links: [{
        title: 'Campaigns',
        path: 'campaigns.index'
      },{
        title: 'Sign In',
        path: 'sessions'
      },{
        title: 'Users',
        path: 'users.index'
      },{
        title: 'Companies',
        path: 'companies.index'
      }]
    };
  },

  _newCampaignPanel: function() {
    return {
      title: 'Media Plan',
      icon: 'fa fa-file-excel-o media-plan page-menu-i'
    };
  },

  _settingsPanel: function() {
    return {
      title:'Menu',
      icon: 'fa fa-file-o media-plan page-menu-i',
      links: [{
        title: 'My Profile',
        path: 'users.show',
        id: this.get('currentUser')
      },{
        title: 'My Campaigns',
        path: 'campaigns.index'
      },{
        title: '+ New Campaign',
        path: 'campaigns.new'
      }]
    };
  },

  _campaignPanel: function() {
    return {
      title:'Campaign',
      icon: 'fa fa-bookmark-o page-menu-i',
      links: [{
        title: 'Media Plan',
        path: 'campaigns.media_plan',
        id: this.get('campaign')
      },{
        title: 'Analytics',
        path: 'campaigns.analytics',
        id: this.get('campaign')
      },{
        title: 'Trafficking',
        path: 'campaigns.trafficking',
        id: this.get('campaign')
      },{
        title: 'Wrap-Up',
        path: 'campaigns.wrap_up',
        id: this.get('campaign')
      }]
    };
  }

});