class AddUserIdToJobs < ActiveRecord::Migration[7.1]
  def change
     add_reference :jobs, :user, null: true, foreign_key: true
  end
end
