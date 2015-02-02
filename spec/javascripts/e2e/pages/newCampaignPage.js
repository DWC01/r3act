var NewCampaignPage;

NewCampaignPage = function() {
  this.get = function() {
    browser.get('http://localhost:3000/campaigns/new');
  }
  this.uploadMediaPlan = function(filePath) {
    $('input[type="file"]').sendKeys(filePath);
  }
  this.clickSubmit = function() {
    $('#btn-upload-meida-plan').click();
  } 
};
module.exports = new NewCampaignPage();