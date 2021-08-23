class AddEntityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :entity, null: false, foreign_key: true
  end
end
