class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    if @job_application.save
      redirect_to job_applications_path, notice: "Job application added!"
    else
      render :new
    end
  end

  def edit
    @job_application = JobApplication.find(params[:id])
  end

  def update
    @job_application = JobApplication.find(params[:id])
    if @job_application.update(job_application_params)
      redirect_to job_applications_path, notice: "Job application updated!"
    else
      render :edit
    end
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to job_applications_path, notice: "Job application deleted!"
  end

  def calendar
    @job_applications = JobApplication.where.not(interview_date: nil)
  end

  private

  def job_application_params
    params.require(:job_application).permit(:company, :title, :status, :applied_date, :interview_date, :notes)
  end
end
