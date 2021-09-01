class AddWorkTimeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :work_time, :integer
  end
end
