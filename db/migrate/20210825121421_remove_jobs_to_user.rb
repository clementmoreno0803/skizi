class RemoveJobsToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :jobs
  end
end
