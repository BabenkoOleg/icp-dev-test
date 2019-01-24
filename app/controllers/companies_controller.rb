class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    companies = Company.all
    render json: CompanySerializer.new(companies)
  end

  # GET /companies/:id
  def show
    render json: CompanySerializer.new(@company)
  end

  # POST /companies
  def create
    company = Company.new(company_params)

    if company.save
      render json: CompanySerializer.new(company)
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  # PUT /companies/:id
  def update
    if @company.update(company_params)
      render json: CompanySerializer.new(@company)
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    head :ok
  end

  # GET /companies/csv
  def csv
    attributes = %w{name email phone address web_site contact_person_id}
    data = Company.to_csv(attributes)
    send_data data, filename: "companies-#{Date.today}.csv"
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company)
          .permit(:name, :email, :phone, :address, :web_site, :contact_person_id)
  end
end
