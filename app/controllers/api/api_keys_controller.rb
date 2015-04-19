module Api
  class ApiKeysController < Api::BaseController

    def show
      render json: ApiKey.where(user_id: params[:id])
    end

    private

      def ad_tag_params
        params.require(:api_key).permit(
        :id,  :access_token, :user_id,
        :created_at, :updated_at
        )
      end

      def query_params
        params.permit()
      end
  end
end