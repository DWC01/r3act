::SecureHeaders::Configuration.configure do |config|
  config.csp = {
  	enforce:     true,
  	default_src: '* inline eval',
	  img_src:     '* inline eval',
	  frame_src:   '* inline eval',
	  connect_src: '* inline eval',
	  font_src:    '* inline eval',
	  media_src:   '* inline eval',
	  object_src:  '* inline eval',
	  style_src:   '* inline eval',
	  script_src:  '* inline eval'
  }
end