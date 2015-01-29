var NewCampaignPage = require('./pages/new-campaign-page');
var MediaPlanPage = require('./pages/media-plan-page');
var path = require('path');

  describe('creating new-campaign', function() {
    
    beforeEach(function() {
      NewCampaignPage.get();
    });

    it('should create a new campaign, then  the media plan', function() {
      var fileToUpload, absolutePath, mediaPlanPage;

      fileToUpload = './files/schedule_1.xls';
      absolutePath = path.resolve(__dirname, fileToUpload);
      
      NewCampaignPage.uploadMediaPlan(absolutePath);
      NewCampaignPage.clickSubmit();

      expect(MediaPlanPage.header.getText()).toEqual('Coca Cola - People 25 - 54 years');
    });

  });