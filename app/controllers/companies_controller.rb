class CompaniesController < ApplicationController
  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
