::SecureHeaders::Configuration.configure do |config|
  config.csp = {
  	default_src: 'https: inline eval self',
	  img_src:     '*',
	  frame_src:   '*',
	  connect_src: '*',
	  font_src:    '*',
	  media_src:   '*',
	  object_src:  '*',
	  enforce:     true
  }
end