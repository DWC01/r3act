//= require spec_helper

describe('Controller: CampaignController', function () {

  var CamapignController,
      scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    $controller('CampaignController', {$scope: scope});
  }))

  it('should attach a list of nums to the scope', function () {
    expect(scope.nums.length).toBe(3);
  });
});