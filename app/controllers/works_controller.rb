class WorksController < ApplicationController
	before_action :set_candidate

	def index
		@works = @candidate.works
	end

	def new
		@work = @candidate.works.new
	end

	def create
		@work = @candidate.works.new(work_params)
		@work.candidate = current_candidate
		if @work.save
			redirect_to candidate_path(@candidate), notice: "WorK Experience Added"
		else
			render :new
		end
	end

	def edit
		# @candidate = Candidate.friendly.find(params[:id])
		@work = Work.find(params[:id])
	end

	def update
		@work = Work.find(params[:id])
		if @work.update(work_params)
			redirect_to candidate_path(@candidate), notice: "WorK Experience Updated"
		else
			render :edit
		end
	end

	def destroy
		@work = @candidate.works.find(params[:id])
		@work.destroy
		redirect_to candidate_path(@candidate), notice: "Work Removed"
	end

	private

	def work_params
		params.require(:work).permit(:company, :position, :start_month, :start_year, :end_month, :end_year, :description, :status)
	end

	def set_candidate
		@candidate = Candidate.friendly.find(params[:candidate_id])
	end
end
