class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.references :manager, null: false, foreign_key: { to_table: :users }
      t.integer :runner_needed
      t.integer :padder_needed
      t.integer :barman_needed

      t.timestamps
    end
  end
end
