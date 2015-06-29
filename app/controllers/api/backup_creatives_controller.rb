module Api
  class BackupCreativesController < Api::BaseController

    def index
      backup_creatives = BackupCreative.where(query_params)
      if backup_creatives
        render json: {backup_creative: backup_creatives}, status: 200
      else
        render json: {message: 'No backup_creatives found'}, status: 422
      end
    end

    def create
      backup_creative = BackupCreative.new(backup_creative_params)
      if backup_creative.save
        render json: {backup_creative: backup_creative}, status: 200
      else
        render json: {errors: backup_creative.errors.to_h}, status: 422
      end
    end

    def show
      backup_creative = BackupCreative.find(params[:id])
      if backup_creative
        render json: {backup_creative: backup_creative}, status: 200
      else
        render json: {message: 'backup_creative Not Found'}, status: 401
      end
    end

    def update
      backup_creative = BackupCreative.find(params[:id])
      if backup_creative.update_attributes(backup_creative_params)
        render json: {backup_creative: backup_creative}
      else
        render json: {errors: backup_creative.errors.to_h}, status: 422
      end
    end

    def destroy
      backup_creative = BackupCreative.find(params[:id])
      backup_creative.destroy
      head :no_content
    end

    private
      def backup_creative_params
        params.require(:backup_creative).permit(
          :name, :meta_data, :extension, :resource_url,
          :landing_page, :width, :height, :dimensions, :size, 
          :mime_type, :etag, :campaign_id, :flight_id, :creative_id
        )
      end

      def query_params
        params.permit(:flight_id)
      end
  end
end