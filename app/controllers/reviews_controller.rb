class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_company
  before_action :require_signin, except: [:search, :index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # respond_to :html

  def new
    @review = Review.new
  end

  def edit
  end
  

  def create
    @review = Review.new(review_params)
    #@review.candidate_id = current_candidate.id
    @review.employer_id = current_employer.id
    @review.company_id = @company.id
    respond_to do |format|
      if @review.save
        ReviewMailer.review_created((current_employer || current_candidate), @company.employer, @review.pros, @review.cons, @review.advice, @review.company_name).deliver
        format.html { redirect_to @company, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to company_path(@company), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@company), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_company
      @company = Company.friendly.find(params[:company_id])
    end

    def check_user
      unless (@review.candidate == current_candidate) || (@review.employer == current_employer) || (current_employer.admin?) || (current_candidate.admin?)
        redirect_to root_url, alert: "Sorry, this review belongs to someone else"
      end
    end


    def review_params
      params.require(:review).permit(:company_name, :title, :rating, :cons, :pros, :advice)
    end
end
