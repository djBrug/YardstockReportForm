class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])

    @report = Report.as_json(include: accommodations)
    render json: final_hash
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(article_params)

    if @report.save
      redirect_to @report
    else
      render 'new'
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(article_params)
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to reports_path
  end

  private
    def report_params
      params.require(:report).permit(:title, :text)
    end
  end
end
