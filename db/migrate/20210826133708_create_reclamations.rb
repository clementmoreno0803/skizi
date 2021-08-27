class CreateReclamations < ActiveRecord::Migration[6.1]
  def change
    create_table :reclamations do |t|
      t.string :content
      t.references :employee, null: false, foreign_key: { to_table: :users }
      t.references :shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
