//= require spec_helper
  var NewCampaignPage, path;
  
  path = require('path');
  NewCampaignPage = require('./pages/new-campaign-page');

  describe('creating new-campaign', function() {
    beforeEach(function() {
      this.page = new CampaignsPage();
      this.page.get();
    });

    it('should upload file', function() {
      var fileToUpload = './files/',
      var absolutePath = path.resolve(__dirname, fileToUpload);
      $('input[type="file"]').sendKeys(absolutePath);

      $('#uploadButton').click();
    });

    it('should show new campaign', function() {
      expect(this.page.firstCampaign).to.be.defined;
    });

  });