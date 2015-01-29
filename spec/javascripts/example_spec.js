describe('First Dummy Test', function() {
  it('Should load all campaigns', function() {
    browser.get('http://localhost:3000/campaigns');

    element(by.model('yourName')).sendKeys('Julie');
    var greeting = element(by.binding('yourName'));

    expect(greeting.getText()).toEqual('Hello Julie!');
  });
});
