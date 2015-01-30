//= require spec_helper

describe('Controller: CampaignController', function () {

  var CamapignController, scope, stateParams, listingID;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($rootScope, $controller, _$location_) {
    $location = _$location_;
    scope = $rootScope.$new();
    $controller('CampaignController', {$scope: scope});
  }));
  
  it('isActive() shows correct path active', function() {

    $location.path('/campaigns/1/analytics');
    expect($location.path()).to.equal('/campaigns/1/analytics');
    expect(scope.isActive('/campaigns/1/analytics')).to.equal(true);
    expect(scope.isActive('/campaigns/1/trafficking')).to.equal(false);
  });

  it('is set as "untrafficked" ', function () {
    expect(scope.trafficking).to.equal('untrafficked');
  });

  it('is set as "untrafficked" ', function () {
    expect(scope.trafficking).to.equal('untrafficked');
  });


});