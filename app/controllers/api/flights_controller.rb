module Api
  class FlightsController < Api::BaseController

    def index
      flights = Flight.where(query_params)
      if flights
        render json: flights
      else
        render json: {message: 'No flights found'}, status: 422
      end
    end

    def show
      flight = Flight.find(params[:id])
      if flight
        render json: {flight: flight}, status: 200
      else
        render json: {message: 'Flight not found'}, status: 422
      end
    end

    def create
      flight = Flight.new(flight_params)
      if flight.save
        render json: {flight: flight}, status: 201
      else
        render json: {errors: flight.errors.to_h}, status: 422
      end
    end

    def destroy
      flights = Flight.find(params[:id])
      flights.destroy
      head :no_content
    end

    private

      def flight_params
        params.require(:flight).permit(
          :id, :name, :adserver_cost, :start_date, 
          :end_date, :ad_tag_count, :campaign_id, 
          :created_at,:updated_at  
        )
      end

      def query_params
        params.permit(:campaign_id)
      end
  end
end