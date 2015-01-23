//= require spec_helper

describe('Controller: CampaignController', function () {

  var CamapignController, scope, stateParams, listingID;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($rootScope, $controller, _$location_) {
    $location = _$location_;
    scope = $rootScope.$new();
    $controller('CampaignController', {$scope: scope});
  }));
  
  it('isActive() shows correct path aactive', function() {

    $location.path('/campaigns/1/analytics');
    expect($location.path()).toBe('/campaigns/1/analytics');
    expect(scope.isActive('/campaigns/1/analytics')).toBe(true);
    expect(scope.isActive('/campaigns/1/trafficking')).toBe(false);
  });

  it('is set as "untrafficked" ', function () {
    expect(scope.trafficking).toBe('untrafficked');
  });

  it('$rootscpe.id has corect value', function(){
    $location.path('/campaigns/1/analytics');
    expect(scope.id).toBe(1);
  });

});