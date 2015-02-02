//= require spec_helper
  
  // Load required modules
  beforeEach(angular.mock.module("restangular"));


describe("Campaign Service", function () {

  var Restangular, Campaign, campaignsModel;

  beforeEach(inject(function (_$rootScope_, _$q_, _$httpBackend_, _Restangular_, _Campaign_) {
    $q             = _$q_;
    $scope         = _$rootScope_.$new();
    $rootScope     = _$rootScope_;
    $httpBackend   = _$httpBackend_;

    Restangular    = _Restangular_;
    Campaign       = _Campaign_;

    campaignsModel = [{name: "Campaign 1"},{name: "Campaign 2"}];
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  describe("Campaign.all", function () {
    it("should exist and be callable", function() {
      $httpBackend.expectGET('/api/campaigns').respond(campaignsModel);

      sinon.spy(Campaign, 'all');
      Campaign.all();

      expect(Campaign.all).to.exist;
      expect(Campaign.all.calledOnce).to.be.true;

      Campaign.all.restore();
      $httpBackend.flush();
    });
  });

  describe("Campaign.find", function () {
    it("should exist and be callable", function() {
      $httpBackend.expectGET('/api/campaigns/1').respond(campaignsModel);

      sinon.spy(Campaign, 'find');
      Campaign.find(1);

      expect(Campaign.find).to.exist;
      expect(Campaign.find.calledOnce).to.be.true;

      Campaign.find.restore();
      $httpBackend.flush();
    });
  });

  describe("Campaign.ad_tags", function () {
    it("should exist and be callable", function() {
      $httpBackend.expectGET('/api/campaigns/1/ad_tags').respond(campaignsModel);

      sinon.spy(Campaign, 'ad_tags');
      Campaign.ad_tags(1);

      expect(Campaign.ad_tags).to.exist;
      expect(Campaign.ad_tags.calledOnce).to.be.true;

      Campaign.ad_tags.restore();
      $httpBackend.flush();
    });
  });

});