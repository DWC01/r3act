module Api
  class AdTagsController < Api::BaseController

    def index
      if params[:flight_id]
        flight = Flight.find(params[:flight_id])
        render json: flight.ad_tags
      else  
        render json: AdTag.all
      end
    end
  
    def show
      render json: AdTag.find(params[:ad_tag_id])
    end

    private

      def ad_tag_params
        params.require(:ad_tag).permit(
        :ad_type, :advertiser, :audience,
        :cost_basis, :cost_method, :days, :details, :device,
        :end_date, :flight, :format, :height, :impressions,
        :javascript_tag, :publisher, :media_plan_name, :placement,
        :primary_target_audience, :product, :properties, :size,
        :site, :start_action, :start_date, :unit_cost, :width,
        :flight_id
        )
      end

      def query_params
        params.permit()
      end
  end
end