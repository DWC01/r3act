class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def extension(file_path_or_name)
    file_path_or_name.split('.').pop if is_creative
  end

end