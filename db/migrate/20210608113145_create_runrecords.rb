class CreateRunrecords < ActiveRecord::Migration[6.1]
  def change
    create_table :runrecords do |t|
      t.timestamp :starttime, null: false
      t.float :distance, null: false
      t.integer :runtime, null: false

      t.timestamps
    end
  end
end
