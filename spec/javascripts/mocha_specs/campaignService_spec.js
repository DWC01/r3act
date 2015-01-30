//= require spec_helper

describe("Campaign Service", function () {
  
  beforeEach(module("restangular"));
  var Restangular, Campaign;

  beforeEach(inject(function (_Restangular_, _Campaign_) {
      Campaign = _Campaign_;
      RestAngular = _Restangular_;
  }));

  describe("Campaign.all", function () {
    it("should exist", function () {
      expect(Campaign.all).to.exist;
    });
  });

  describe("Campaign.find", function () {
    it("Campaign.find should exist", function () {
      expect(Campaign.find).to.exist;
    });
  });

  describe("Campaign.ad_tags", function () {
    it("Campaign.ad_tags should exist", function () {
      expect(Campaign.ad_tags).to.exist;
    });
  });

  it("Campaign.iDontExist should not exist", function () {
    expect(Campaign.iDontExist).to.not.exist;
  });

  // it("retrieveQuotes should return array of quotes", function () {

  //     $httpBackend.whenGET("internalapi/quotes").respond({ hello: 'World' });
  //     ms.retrieveQuotes();
  //     $httpBackend.flush();
  // });

});