Konacha.configure do |config|
  config.spec_dir     = "spec/javascripts/mocha_specs"
  config.spec_matcher = /_spec\.|_test\./
  config.stylesheets  = %w(application)
  config.driver       = :selenium
end if defined?(Konacha)