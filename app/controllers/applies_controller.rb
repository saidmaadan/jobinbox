class AppliesController < ApplicationController
  before_action :set_apply, only: [:edit, :update, :destroy]
  before_action :set_job
  #before_action :authenticate_candidate!
  before_action :check_candidate, only: [:edit, :update, :destroy]

  # respond_to :html
  def new
    @apply = Apply.new
  end

  def edit
  end

  def create
    @apply = Apply.new(apply_params)
    @apply.candidate_id = current_candidate.id
    @apply.job_id = @job.id
    respond_to do |format|
      if @apply.save
        name = params[:apply][:name]
        email = params[:apply][:email]
        message = params[:apply][:message]
        resume = params[:apply][:resume]
        ApplyMailer.apply_created(current_candidate, @job.employer, @apply.message, @apply.resume).deliver
        format.html { redirect_to @job, notice: 'You have successfully applied for this job.' }
        format.json { render :show, status: :created, location: @apply }
      else
        format.html { render :new }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @apply.update(apply_params)
        format.html { redirect_to job_path(@job), notice: 'Appllication was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply }
      else
        format.html { render :edit }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to job_path(@job), notice: 'Apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_apply
      @apply = Apply.find(params[:id])
    end

    def set_job
      @job = Job.friendly.find(params[:job_id])
    end

    def check_candidate
      unless (@apply.candidate == current_candidate) || (current_candidate.admin?)
        redirect_to root_url, alert: "Sorry, this apply belongs to someone else"
      end
    end


    def apply_params
      params.require(:apply).permit(:message)
    end
end

