class CreateUserJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
