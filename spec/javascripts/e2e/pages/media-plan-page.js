var MediaPlanPage;

MediaPlanPage = function() {
  this.get = function() {
    browser.get('http://localhost:3000/campaigns/new');
  }
  this.header = $('.media-plan-header');
}
module.exports = new MediaPlanPage();