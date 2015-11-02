class PagesController < ApplicationController
  def home
    @companies = Company.all
    @jobs = Job.all.order("created_at DESC")
  end

  def about
    @companies = Company.all
    @jobs = Job.all.order("created_at DESC")
    #@jobs = @company.jobs.paginate(:page => params[:page], :per_page => 3)
  end

  def terms
  end

  def privacy
  end

  def faq
  end
end
