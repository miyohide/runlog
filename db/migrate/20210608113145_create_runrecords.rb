class CreateRunrecords < ActiveRecord::Migration[6.1]
  def change
    create_table :runrecords do |t|
      t.timestamp :starttime
      t.float :distance
      t.integer :runtime

      t.timestamps
    end
  end
end
