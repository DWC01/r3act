EmberCLI.configure do |c|
  c.app :frontend, exclude_ember_deps: "jquery"
  c.app :frontend, path: Rails.root.join('frontend').to_s
end
