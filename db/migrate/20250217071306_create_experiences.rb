class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :company_name
      t.date :start_date
      t.date :end_date
      t.string :position
      t.string :location
      t.text :details

      t.timestamps
    end
  end
end
