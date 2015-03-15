module Api
  class FlightsController < Api::BaseController

    def index
      if params[:campaign_id]
        campaign = Campaign.find(params[:campaign_id])
        render json: {r3act: campaign.flights}
      else
        render json: {r3act: Flight.all}
      end        
    end

    private

      def flight_params
        params.require(:flight).permit(
          :name, :adserver_cost, :start_date, :end_date,
          :ad_tag_count, :campaign_id
        )
      end

      def query_params
        params.permit()
      end
  end
end