module Api
  class UsersController < Api::BaseController

    def show
      render json: User.find(params[:id])
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
        render json: user
      else
        render json: {errors: get_resource.errors.to_h}, status: 422
      end
    end

    private
      def user_params
        params.require(:user).permit(
          :first_name, :last_name, :email, :avatar,
          :position, :title, :admin, :company_id,
          :password, :password_confirmation
        )
      end

      def sanitized_user_params
        user_params.compact
      end

      def query_params
        params.permit()
      end
  end
end