//= require spec_helper

describe('States', function() {

  describe('root', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        // We need add the template entry into the templateCache if we ever
        // specify a templateUrl
        $templateCache.put('sidebars/campaigns_menu.html', 'campaigns/index.html');
    }));

    it('responds to URL', function() {
      expect($state.href('root')).to.equal('/');
    });

  });

  describe('campaigns', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaigns_menu.html', 'campaigns/index.html');
    }));

    it('responds to URL', function() {
      expect($state.href('campaigns')).to.equal('/campaigns');
    });

  });

  describe('campaigns/', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaigns_menu.html', 'campaigns/index.html');
    }));

    it('responds to URL', function() {
      expect($state.href('campaigns/')).to.equal('/campaigns/');
    });

  });

  describe('campaign', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaign_menu.html', 'campaigns/media_plan.html');
    }));

    it('responds to URL', function() {
      expect($state.href('campaign', { id: 1 } )).to.equal('/campaigns/1');
    });

  });

  describe('campaign.trafficking', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaign_menu.html', 'campaigns/trafficking.html');
    }));

    it('responds to URL', function() {
      expect($state.href('campaign.trafficking', { id: 1 } )).to.equal('/campaigns/1/trafficking');
    });

  });

  describe('campaign.analytics', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaign_menu.html', 'campaigns/analytics.html');
    }));

    it('responds to URL', function() {
      expect($state.href('campaign.analytics', { id: 1 } )).to.equal('/campaigns/1/analytics');
    });

  });

  describe('campaign.wrap_up', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaign_menu.html', 'campaigns/wrap_up.html');
    }));

    it('responds to URL', function() {
      expect($state.href('campaign.wrap_up', { id: 1 } )).to.equal('/campaigns/1/wrap_up');
    });

  });

  describe('adTag', function() {

    var $rootScope, $state, $injector, myServiceMock, state = 'root';

    beforeEach(inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('sidebars/campaign_menu.html', 'ad_tags/show.html');
    }));

    it('responds to URL', function() {
      expect($state.href('adTag', { id: 1 } )).to.equal('/ad_tags/1');
    });

  });

});