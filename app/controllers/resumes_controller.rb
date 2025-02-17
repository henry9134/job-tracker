class ResumesController < ApplicationController
  before_action :set_resume, only: %i[show edit update destroy]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
    2.times { @resume.educations.build }
    2.times { @resume.experiences.build }
    3.times { @resume.skills.build }
    2.times { @resume.certifications.build }
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to @resume, notice: 'Resume created successfully.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to resumes_path, notice: 'Resume deleted successfully.'
  end

  private

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(
      :name, :date_of_birth, :phone_number, :email, :summary, :github_link, :linkedin_link,
      educations_attributes: %i[id school_name start_date graduation_date major details _destroy],
      experiences_attributes: %i[id company_name start_date end_date position location details _destroy],
      skills_attributes: %i[id name _destroy],
      certifications_attributes: %i[id name organization issue_date expiration_date details _destroy]
    )
  end
end
