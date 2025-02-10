class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.string :company
      t.string :title
      t.string :status
      t.date :applied_date
      t.text :notes

      t.timestamps
    end
  end
end
