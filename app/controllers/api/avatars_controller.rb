module Api
  class AvatarsController < Api::BaseController

    def index
      render json: Avatar.all
    end

    def create
      avatar = Avatar.new(avatar_params)
      if avatar.save
        render json: {avatar: avatar}, status: 200
      else
        render json: {errors: avatar.errors.to_h}, status: 422
      end
    end

    def show
      avatar = Avatar.find_by_user_id(params[:id])
      if avatar
        render json: {avatar: avatar}, status: 200
      else
        render json: {message: 'avatar Not Found'}, status: 401
      end
    end

    def update
      avatar = Avatar.find(params[:id])
      if avatar.update_attributes(avatar_params)
        render json: {avatar: avatar}
      else
        render json: {errors: avatar.errors.to_h}, status: 422
      end
    end

    private
      def avatar_params
        params.require(:avatar).permit(
          :id, :s3_data
        )
      end
  end
end