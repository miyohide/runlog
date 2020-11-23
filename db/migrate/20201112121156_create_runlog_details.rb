class CreateRunlogDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :runlog_details do |t|
      t.references :runlog, null: false, foreign_key: true
      t.decimal :distance, null: false
      t.integer :elapsedtime, null: false

      t.timestamps
    end
  end
end
