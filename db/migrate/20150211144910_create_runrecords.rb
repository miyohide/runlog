class CreateRunrecords < ActiveRecord::Migration
  def change
    create_table :runrecords do |t|
      t.datetime :runned_at
      t.float :distance
      t.string :run_time

      t.timestamps
    end
  end
end
