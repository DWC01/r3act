var NewCampaignPage = require('../pages/newCampaignPage');
var MediaPlanPage = require('../pages/mediaPlanPage');
var path = require('path');
  
  describe('creates new campaign', function() {
    beforeEach(function() {
      NewCampaignPage.get();
    });
    it('should create a new campaign, then display media plan', function() {
      var fileToUpload, absolutePath, mediaPlanPage;

      fileToUpload = '../files/schedule_1.xls';
      absolutePath = path.resolve(__dirname, fileToUpload);
      
      NewCampaignPage.uploadMediaPlan(absolutePath);
      NewCampaignPage.clickSubmit();

      expect(MediaPlanPage.mediaPartners.count()).toEqual(6);
      expect(MediaPlanPage.adTags.count()).toEqual(10);

      expect(MediaPlanPage.header.getText()).toEqual('Coca Cola - People 25 - 54 years');
      
      expect(MediaPlanPage.mediaPartners.first().getText()).toContain("iNC");
      expect(MediaPlanPage.mediaPartners.first().getText()).toContain("Cost Per Read");
      
      expect(MediaPlanPage.mediaPartners.last().getText()).toContain("AdRoll");
      expect(MediaPlanPage.mediaPartners.last().getText()).toContain("Liquid Ads");
    });
  });
