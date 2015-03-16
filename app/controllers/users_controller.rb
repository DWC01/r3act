class UsersController < ApplicationController
  
  def show
    auth_token = current_user.auth_token
    @user = User.find_by_auth_token(auth_token)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to @user, notice: "Thank you for signing up!"
    else
      render :new
    end
  end

  def edit
     auth_token = current_user.auth_token
     @user = User.find_by_auth_token(auth_token)
  end

  def update
    auth_token = current_user.auth_token
    @user = User.find_by_auth_token(auth_token)
    if @user.update_attributes(user_params)
      flash[:notice] = 'Profile Updated!'
      redirect_to settings_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Profile Deleted!"
  end

  private
    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :email, :avatar,
        :position, :title, :admin, :company_id,
        :password, :password_confirmation
      )
    end
end