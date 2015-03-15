class FlightsController < ApplicationController

  def index
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(campaign_params)
    if @flight.save
      redirect_to @flight
    else
      render :new
    end
  end

  def show
    @flights = Flight.find(params[:id])
  end

  def destroy
    Flight.find(params[:id]).destroy
    flash[:success] = "Flight Successfully Deleted!"
    redirect_to flights_path
  end

  private
    def ad_tag_params
      params.require(:flight).permit(
        :name, :adserver_cost, :start_date, :end_date,
        :ad_tag_count, :campaign_id
      )
    end

end
