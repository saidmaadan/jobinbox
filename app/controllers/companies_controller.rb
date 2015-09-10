class CompaniesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def search
    if params[:search].present?
      @companies = Company.search(params[:search])
    else
      @companies = Company.all.order("created_at DESC")
    end
    @reviews = Review.all.order("created_at DESC").limit(5)
  end

  def index
    @companies = Company.all.order("created_at DESC").limit(6)
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
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC")
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all
    @jobs = @company.jobs.order("created_at DESC")
    @jobs = @jobs.where(title: params["title"]) if params["title"].present?
    @jobs = @jobs.where(city: params["city"]) if params["city"].present?
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

  def set_company
    @company = Company.friendly.find(params[:id])
  end
  def company_params
    params.require(:company).permit(:name,:about, :founded, :size,:industry,:location,:website,:subsidiaries, :slug, :employer_id,:logo,:avatar)
  end
end
