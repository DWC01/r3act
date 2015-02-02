var EditCampaignPage;

EditCampaignPage = function() {
  this.get = function() {
    browser.get('http://localhost:3000/campaigns/1');
  }
  this.firstRowCell = $('.row-cells');
  this.firstInput   = $('.editable-input');
  this.saveButton   = $('.btn-save-ad-tag');
  this.cancelButton = $('.btn-cancel-ad-tag');
}
module.exports = new EditCampaignPage();