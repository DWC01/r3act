class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = 'Company Successfully Created'
      redirect_to @company
    else
      render 'new' 
    end
  end

  def show
    @companys = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(
      :name, :logo, :placements_trafficked,
      :placement_rate
     )
  end 

end
