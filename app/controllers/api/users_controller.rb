module Api
  class UsersController < Api::BaseController
    before_action :aws_s3, only: [:update]

    def current_user
      auth_token = params[:auth_token]
      user = User.find_by_auth_token(auth_token)
      if user
      render json: {
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        id: user.id,
        avatar_original: user.avatar_original,
        avatar_profile: user.avatar_profile,
        avatar_nav: user.avatar_nav,
        auth_token: user.auth_token}, status: 200
      else
        render json: {message: 'Bad credentials'}, status: 401
      end
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: {user: user}
      else
        render json: {errors: user.errors.to_h}, status: 422
      end
    end

    def update
      user = User.find(params[:id])
      if user.update_attributes(sanitized_user_params)
        proccess_avatar_file(user)
        render json: {user: user}
      else
        render json: {errors: user.errors.to_h}, status: 422
      end
    end

    private
      def user_params
        params.require(:user).permit(
          :id, :first_name, :last_name, :email, :avatar_original,
          :position, :title, :admin, :company_id,
          :password, :password_confirmation
        )
      end

      def sanitized_user_params
        user_params.compact
      end

      def proccess_avatar_file(user)
        avatar = Avatar.new(user.id,user.avatar_original)
        avatar.proccess_img
        save_additional_avatar_urls(avatar, user)
      end

      def save_additional_avatar_urls(avatar, user)
        user.avatar_original = avatar.original_url
        user.avatar_profile = avatar.profile_url
        user.avatar_nav = avatar.nav_url
        user.save!
      end
  end
end