class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.date :started_at
      t.date :ended_at
      t.string :job
      t.string :status
      t.references :user
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
