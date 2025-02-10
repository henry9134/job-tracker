class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
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

  private

  def job_application_params
    params.require(:job_application).permit(:company, :title, :status, :applied_date, :notes)
  end
end
