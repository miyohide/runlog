class CreateRunlogDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :runlog_details do |t|
      t.references :runlog, null: false, foreign_key: true
      t.decimal :distance
      t.integer :elapsedtime

      t.timestamps
    end
  end
end
