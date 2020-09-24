class AddColumnToRunlog < ActiveRecord::Migration[6.0]
  def change
    add_column :runlogs, :total_time, :integer, null: false
  end
end
