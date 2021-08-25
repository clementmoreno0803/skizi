class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job

      t.timestamps
    end
  end
end
