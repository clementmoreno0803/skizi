class RemoveNeededColunmFormShift < ActiveRecord::Migration[6.1]
  def change
    remove_column :shifts, :barman_needed
    remove_column :shifts, :runner_needed
    remove_column :shifts, :padder_needed
  end
end
