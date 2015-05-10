module Api
  class CompaniesController < Api::BaseController
    
    def index
      companies = Company.where(query_params)
      if companies
        render json: companies
      else
        render json: {message: 'No companies found'}, status: 422
      end
    end

    def show
      company = Company.find(params[:id])
      if company
        render json: {company: company}, status: 200
      else
        render json: {message: 'Company not found'}, status: 422
      end
    end

    def create
      company = Company.new(company_params)
      if company.save
        render json: {company: company}, status: 201
      else
        render json: {errors: company.errors.to_h}, status: 422
      end
    end

    def destroy
      companies = Company.find(params[:id])
      companies.destroy
      head :no_content
    end

    private
      def company_params
        params.require(:company).permit(
          :name, :placements_trafficked,
          :placement_rate)
      end

      def query_params
        params.permit()
      end
  end
end