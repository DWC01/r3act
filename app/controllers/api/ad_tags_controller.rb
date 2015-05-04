module Api
  class AdTagsController < Api::BaseController

    def index
      ad_tags = AdTag.where(query_params)
      if ad_tags
        render json: {ad_tag: ad_tags}, status: 200
      else
        render json: {message: 'No ad tags found'}, status: 422
      end
    end

    def show
      ad_tag = AdTag.find(params[:id])
      if ad_tag
        render json: {ad_tag: ad_tag}, status: 200
      else
        render json: {message: 'Ad tag not found'}, status: 422
      end
    end

    def create
      ad_tag = AdTag.new(ad_tag_params)
      if ad_tag.save
        render json: {ad_tag: ad_tag}, status: 201
      else
        render json: {errors: ad_tag.errors.to_h}, status: 422
      end
    end
  
    def update
      ad_tag = AdTag.find(params[:id])
      if ad_tag.update_attributes(ad_tag_params)
        render json: {ad_tag: ad_tag}, status: 200
      else
        render json: {errors: ad_tag.errors.to_h}, status: 422
      end
    end

    def destroy
      ad_tags = AdTag.find(params[:id])
      ad_tags.destroy
      head :no_content
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
        params.permit(:flight_id)
      end
  end
end