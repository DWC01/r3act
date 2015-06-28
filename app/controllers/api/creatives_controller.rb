module Api
  class CreativesController < Api::BaseController

    def index
      creatives = Creative.where(query_params)
      if creatives
        render json: {creative: creatives}, status: 200
      else
        render json: {message: 'No creatives found'}, status: 422
      end
    end

    def create
      creative = Creative.new(creative_params)
      if creative.save
        render json: {creative: creative}, status: 200
      else
        render json: {errors: creative.errors.to_h}, status: 422
      end
    end

    def show
      creative = Creative.find(params[:id])
      if creative
        render json: {creative: creative}, status: 200
      else
        render json: {message: 'creative Not Found'}, status: 401
      end
    end

    def update
      creative = Creative.find(params[:id])
      if creative.update_attributes(creative_params)
        render json: {creative: creative}
      else
        render json: {errors: creative.errors.to_h}, status: 422
      end
    end

    def destroy
      creative = Creative.find(params[:id])
      creative.destroy
      head :no_content
    end

    private
      def creative_params
        params.require(:creative).permit(
          :name, :meta_data, :extension, :resource_url, :backup_img_url, 
          :creative_landing_page, :width, :height, :dimensions, :size, 
          :mime_type, :creative_type, :compressed, :version, :bit_count, 
          :swf_xmax, :swf_ymax, :frame_rate, :frame_count, :duration, 
          :avm_version, :signature, :etag, :flight_id
        )
      end

      def query_params
        params.permit(:flight_id)
      end
  end
end