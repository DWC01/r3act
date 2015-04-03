module Api
  class FlightsController < Api::BaseController

    def index
      if params[:campaign_id]
        campaign = Campaign.find(params[:campaign_id])
        render json: campaign.flights
      else  
        render json: Flight.all
      end
    end
  
    def show
      render json: Flight.find(params[:id])
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