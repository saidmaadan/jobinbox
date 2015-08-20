class EducationsController < ApplicationController
	before_action :set_candidate

	def index
		@educations = @candidate.educations
	end

	def new
		@education = @candidate.educations.new
	end

	def create
		@education = @candidate.educations.new(education_params)
		@education.candidate = current_candidate
		if @education.save
			redirect_to candidate_path(@candidate), notice: "School Added"
		else
			render :new
		end
	end

	def edit
		# @candidate = Candidate.friendly.find(params[:id])
		@education = Education.find(params[:id])
	end

	def update
		@education = Education.find(params[:id])
		if @education.update(education_params)
			redirect_to candidate_path(@candidate), notice: "Education Status Updated"
		else
			render :edit
		end
	end

	def destroy
		@education = @candidate.educations.find(params[:id])
		@education.destroy
		redirect_to candidate_path(@candidate), notice: "School Removed"
	end

	private

	def education_params
		params.require(:education).permit(:school, :degree, :year)
	end

	def set_candidate
		@candidate = Candidate.friendly.find(params[:candidate_id])
	end
end
