class JobsController < ApplicationController
	before_action :require_signin_employer, except: [:search, :index, :show]

	def search
    if params[:search].present?
      @jobs = Job.search(params[:search])
    else
      @jobs = Job.all.page params[:page]
    end
  end

	def index
		@jobs = Job.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
		@companies = Company.all
	end

	def show
		@apply = Apply.new
		@apply.job_id = @job_id
		@job = Job.friendly.find(params[:id])
		#@company = Company.friendly.find(params[:id])
	end

	def edit
		@job = Job.friendly.find(params[:id])
	end

	def update
		@job = Job.friendly.find(params[:id])
		if @job.update(job_params)
			flash[:notice]='Job updated successfully'
			redirect_to @job
		else
			render :edit
		end
	end

	def new
		@job = Job.new
	end

	def create
		@job = current_employer.jobs.build(job_params)
		if @job.save
			redirect_to @job, notice: "Job successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job = Job.friendly.find(params[:id])
		@job.destroy
		redirect_to @jobs_url, alert: "Job has been deleted"
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :email, :url, :city, :state, :zip_code, :country, :position_type, :pay_rate, :job_length, :travel_required, :employer_id, :candidate_id, :company_id, :company_name, :industry, :logo, :company_size, :website_url, :company_description, :responsibility, :experience)
	end

	def correct_employer
		unless @job = current_employer.jobs.find_by(id: params[:id])
			redirect_to @jobs_url, alert: "Unauthorized access! Sign in or sign up to get in..."
		end
	end
end
