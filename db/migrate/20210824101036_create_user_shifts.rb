class CreateUserShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_shifts do |t|
      t.references :employee, null: false, foreign_key: { to_table: :users }
      t.references :shift, null: false, foreign_key: true
      t.string :job
      t.integer :hours_worked

      t.timestamps
    end
  end
end
