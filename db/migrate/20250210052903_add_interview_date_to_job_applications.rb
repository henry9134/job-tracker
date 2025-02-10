class AddInterviewDateToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :interview_date, :date
  end
end
