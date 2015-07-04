class ApplicationController < ActionController::Base
	ensure_security_headers
  protect_from_forgery with: :exception

  def extension(file_path_or_name)
    file_path_or_name.split('.').pop if is_creative
  end

end