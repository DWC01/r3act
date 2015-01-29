var NewCampaignPage;

NewCampaignPage = function() {
  this.get = function() {
    browser.get('http://localhost:3000/campaigns/new');
  }
  this.campaignRepeater = by.repeater('campaign in campaigns');
  this.firstCampaign = element(this.campaignRepeater.row(0));
}
module.exports = NewCampaignPage;