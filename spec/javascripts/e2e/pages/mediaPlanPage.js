var MediaPlanPage;

MediaPlanPage = function() {
  this.get = function() {
    browser.get('http://localhost:3000/campaigns/new');
  }
  this.header = $('.media-plan-header');
  this.mediaPartners = element.all(by.repeater('partner in mediaPartners'));
  this.adTags = element.all(by.repeater('adTag in adTags'));
}
module.exports = new MediaPlanPage();