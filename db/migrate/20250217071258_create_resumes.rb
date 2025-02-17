class CreateResumes < ActiveRecord::Migration[7.1]
  def change
    create_table :resumes do |t|
      t.string :name
      t.date :date_of_birth
      t.string :phone_number
      t.string :email
      t.text :summary
      t.string :github_link
      t.string :linkedin_link

      t.timestamps
    end
  end
end
