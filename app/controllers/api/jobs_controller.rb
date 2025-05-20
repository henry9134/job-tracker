class Api::JobsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    # 🔐 Extract token from body
    token = params[:api_token]
    puts "🔐 Token from params: #{token}"

    # 👤 Find user by token
    @current_user = User.find_by(api_token: token)
    puts "👤 Found user? #{@current_user.present?}"

    if @current_user.nil?
      puts "⛔ No user found"
      render json: { error: 'Unauthorized (from Api::JobsController)' }, status: :unauthorized and return
    end

    # 📄 Create the job associated with the user
    job = @current_user.jobs.new(job_params)

    if job.save
      puts "✅ Job saved"
      render json: { status: 'ok', job: job }, status: :created
    else
      puts "❌ Job failed to save: #{job.errors.full_messages}"
      render json: { status: 'error', errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.permit(:title, :company, :url, :location, :notes)
  end
end
