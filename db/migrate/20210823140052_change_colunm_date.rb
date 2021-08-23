class ChangeColunmDate < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :started_at, :datetime, precision: 6, null: false
    change_column :shifts, :ended_at, :datetime, precision: 6, null: false
  end
end
