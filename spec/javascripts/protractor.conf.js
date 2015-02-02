// Run with 'rake protractor:spec_and_cleanup nolog=y # all quiet'

// An example configuration file.
  exports.config = {
    // The address of a running selenium server.
    seleniumAddress: 'http://localhost:4444/wd/hub',

    // Capabilities to be passed to the webdriver instance.
    capabilities: {
        'browserName': 'chrome'
    },

    // Spec patterns are relative to the current working directly when protractor is called
    specs: ['e2e/**/*Spec.js '],

    // // Option to replace specs with Suites..
    // suites: {
    //     login: 'protractor_specs/login/*.js',
    //     user: 'protractor_specs/user/*.js'
    // },

    baseUrl: 'http://localhost:4000',

    // Options to be passed to Jasmine-node.
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 30000
    },
};
