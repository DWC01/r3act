class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:user_session] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:success] = "What up #{user.first_name}!"
      redirect_to user
    else
      flash[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:success] = "Logged Out!"
    redirect_to root_url
  end

end