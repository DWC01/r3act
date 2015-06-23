module Api
  class SwfCreativesController < Api::BaseController

    def index
      swf_swf_creatives = SwfCreative.where(query_params)
      if swf_swf_creatives
        render json: {swf_creative: swf_swf_creatives}, status: 200
      else
        render json: {message: 'No flash swf_creatives found'}, status: 422
      end
    end

    def create
      swf_creative = SwfCreative.new(swf_creative_params)
      if swf_creative.save
        render json: {swf_creative: swf_creative}, status: 200
      else
        render json: {errors: swf_creative.errors.to_h}, status: 422
      end
    end

    def show
      swf_creative = SwfCreative.find(params[:id])
      if swf_creative
        render json: {swf_creative: swf_creative}, status: 200
      else
        render json: {message: 'Flash creative Not Found'}, status: 401
      end
    end

    def update
      swf_creative = SwfCreative.find(params[:id])
      if swf_creative.update_attributes(swf_creative_params)
        render json: {swf_creative: swf_creative}
      else
        render json: {errors: swf_creative.errors.to_h}, status: 422
      end
    end

    def destroy
      swf_creative = SwfCreative.find(params[:id])
      swf_creative.destroy
      head :no_content
    end

    private
      def swf_creative_params
        params.require(:swf_creative).permit(
          :name, :swf_creative_landing_page, :meta_data,
          :extension, :width, :height, :size, :mime_type,
          :swf_creative_type, :compressed?, :version, :bit_count, 
          :xmax, :ymax, :url, :frame_rate, :frame_count, :duration, 
          :avm_version, :signature, :etag, :swf_creative_id
        )
      end

      def query_params
        params.permit(:flight_id)
      end
  end
end




