module Api
  class SessionsController < Api::BaseController

    def create
      render json: session_params
      # render json: {errors: get_resource.errors.to_h}, status: 422
      
    end

    private
      def session_params
        params.permit(:email, :password)
      end
  end
end