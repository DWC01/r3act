module Api
  class UsersController < Api::BaseController

    private
      def user_params
        params.require(:user).permit(
        :first_name, :last_name, :email, :avatar,
        :position, :title, :admin, :company_id,
        :password, :password_confirmation
        )
      end

      def query_params
        params.permit()
      end
  end
end