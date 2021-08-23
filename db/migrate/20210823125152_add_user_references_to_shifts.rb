class AddUserReferencesToShifts < ActiveRecord::Migration[6.1]
  def change
    add_reference :shifts, :user, null: false, foreign_key: true
  end
end
