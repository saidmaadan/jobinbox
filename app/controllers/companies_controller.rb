class CompaniesController < ApplicationController
  before_action :require_admin, except: [:index, :show, :search, :job]
  before_action :set_company, only: [:show, :edit, :update, :destroy, :review, :interview, :addreview, :job, :addinterview, :about]

  def search
    if params[:search].present?
      @companies = Company.search(params[:search])
    else
      @companies = Company.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    end
    @reviews = Review.all.order("created_at DESC").limit(5)
  end

  def index
    @review = Review.new
    @job = Job.new
    @review.company_id = @company_id
    @job.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @companies = Company.all.order("created_at DESC").limit(6)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
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
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    
    # @jobs = @jobs.where(title: params["title"]) if params["title"].present?
    # @jobs = @jobs.where(city: params["city"]) if params["city"].present?
  end

  def job
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.order("created_at DESC")
    #@jobs = Job.all.paginate(:page => params[:page], :per_page => 5)
    #@jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  def about
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  def addinterview
    
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end


  def interview
    
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  def addreview
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end
  def review
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @companies = Company.all.order("created_at DESC").limit(8)
    @jobs = Job.all.paginate(:page => params[:page], :per_page => 3)
    @jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)

    @interview = Interview.new
    @interview.company_id = @company_id
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
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
    params.require(:company).permit(:name,:about, :founded, :size,:industry,:location,:website,:subsidiaries, :facebook, :twitter, :linkedin, :youtube, :video, :instagram, :googleplus, :pinterest, :github, :slug, :employer_id,:logo,:avatar, :twitter_widget)
  end
end
