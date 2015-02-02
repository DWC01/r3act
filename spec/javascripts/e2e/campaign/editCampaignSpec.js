var EditCampaignPage = require('../pages/editCampaignPage');
var path = require('path');
  
  describe('Updates Campaign', function() {
    beforeEach(function() {
      EditCampaignPage.get();
    });
    it('should edit and cancel changes', function() {
      
      EditCampaignPage.firstRowCell.click();
      EditCampaignPage.firstInput.sendKeys("300x600");
      EditCampaignPage.cancelButton.click();

      browser.refresh();

      expect(EditCampaignPage.firstRowCell.getText()).toEqual("-");
    });
    it('should edit and save media plan data', function() {
      
      EditCampaignPage.firstRowCell.click();
      EditCampaignPage.firstInput.sendKeys("300x600");
      EditCampaignPage.saveButton.click();

      browser.refresh();

      expect(EditCampaignPage.firstRowCell.getText()).toEqual("300x600");
    });
  });
