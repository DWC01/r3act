module Api
  class ApiKeysController < Api::BaseController

    def index
      access_token = params[:access_token]

      if access_token
        render json: {api_key: ApiKey.where(access_token: access_token)}
      else
        render json: {api_key: ApiKey.all}
      end

    end

    private

      def ad_tag_params
        params.require(:api_key).permit(
          :id, :access_token, :user_id,
          :created_at, :updated_at
        )
      end

      def query_params
        params.permit()
      end
  end
end