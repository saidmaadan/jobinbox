class InsightsController < ApplicationController
  before_action :require_author, except: [:index, :show]

  def index
    @insights = Insight.all
  end

  def new
    @insight = Insight.new
  end

  def create
    @insight = Insight.new(insight_params)
    if @insight.save
      redirect_to @insight, notice: "Insight added successfully"
    else
      render :new
    end
  end

  def show
    @insight = Insight.friendly.find(params[:id])
  end

  def edit
    @insight = Insight.friendly.find(params[:id])
  end

  def update
    @insight = Insight.friendly.find(params[:id])
    if @insight.update(insight_params)
      redirect_to @insight, notice: "Insight Updated"
    else
      render :edit
    end
  end

  private
  def insight_params
    params.require(:insight).permit(:title, :content,:source_url, :slug, :employer_id, :logo)
  end
end
