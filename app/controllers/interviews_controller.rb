class InterviewsController < ApplicationController
  before_action :set_interview, only: [:edit, :update, :destroy]
  before_action :set_company
  before_action :require_signin, except: [:search, :index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # respond_to :html
  def new
    @interview = Interview.new
  end

  def edit
  end

  def create
    @interview = Interview.new(interview_params)
    #@interview.candidate_id = current_candidate.id
    @interview.employer_id = current_employer.id
    @interview.company_id = @company.id
    respond_to do |format|
      if @interview.save
        InterviewMailer.interview_created((current_employer || current_candidate), @company.employer, @interview.pros, @interview.cons, @interview.advice, @interview.company_name).deliver
        format.html { redirect_to @company, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to company_path(@company), notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@company), notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_interview
      @interview = Interview.find(params[:id])
    end

    def set_company
      @company = Company.friendly.find(params[:company_id])
    end

    def check_user
      unless (@interview.candidate == current_candidate) || (@interview.employer == current_employer) || (current_employer.admin?) || (current_candidate.admin?)
        redirect_to root_url, alert: "Sorry, this interview belongs to someone else"
      end
    end

    def interview_params
      params.require(:interview).permit(:job_title, :process, :questions, :answers, :interview_difficulty, :hired, :how_heard,:duration,:when, :where, :how_helpful, :candidate_id, :employer_id, :company_id)
    end
end
