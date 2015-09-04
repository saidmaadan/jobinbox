class CompaniesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Company added successfully"
    else
      render :new
    end
  end

  def show
    @company = Company.friendly.find(params[:id])
  end

  def edit
    @company = Company.friendly.find(params[:id])
  end

  def update
    @company = Company.friendly.find(params[:id])
    if @company.update(company_params)
      redirect_to @company, notice: "Company Updated"
    else
      render :edit
    end
  end

  private
  def company_params
    params.require(:companies).permit(:name, :body,:founded,:size,:industry,:location,:website,:subsidiaries, :slug, :employer_id, :logo,:avatar)
  end
end
