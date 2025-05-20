class Api::JobsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user! 

  def create
    job = Job.new(job_params)
    if job.save
      render json: { status: 'ok', job: job }, status: :created
    else
      render json: { status: 'error', errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.permit(:title, :company, :url, :location, :notes)
  end
end
