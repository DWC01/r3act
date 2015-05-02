module Api
  class UsersController < Api::BaseController

    def current_user
      auth_token = params[:auth_token]
      user = User.find_by_auth_token(auth_token)
      if user
      render json: User.current_user(user), status: 200
      else
        render json: {message: 'Bad credentials'}, status: 401
      end
    end

    def show
      user = User.find(params[:id])
      if user
        render json: User.serialized(user), status: 200
      else
        render json: {message: 'User Not Found'}, status: 401
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
  end
end