class ReportsController < ApplicationController
  def index
    @reports = Report.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  def show
    @report = Report.find(params[:id])

    render json: @report

  end

  def new
    @report = Report.new

    dateString = params[:month] + "\/" + params[:day] + "\/" + params[:year]

    @report.date = Date.strptime(dateString, "%m/%d/%Y")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  def edit
    @report = Report.find(report_params[:id])
  end

  def create
    @report = Report.create(report_params)

    if @report.save
      redirect_to @report
    else
      render 'new'
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
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
      params.require(:report).permit(:title, :stockyard, :auction,
      :receipts, :weekOldReceipts, :yearOldReceipts, :summary, :livestock,
      :source, :id)
    end
  end
