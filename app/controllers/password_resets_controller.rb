class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user 
      user.send_password_reset
      flash[:success] = "Email sent with password reset instructions."
      redirect_to root_url
    else
      flash[:error] = "Email address not found in database."
      render :new
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:error] = "Password reset has expired."
      redirect_to new_password_reset_path
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset!"
      redirect_to sign_in_path
    else
      render :edit
    end
  end


  private

  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end