class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :school_name
      t.date :start_date
      t.date :graduation_date
      t.string :major
      t.text :details

      t.timestamps
    end
  end
end
