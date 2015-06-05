class AddUserIdToRunrecord < ActiveRecord::Migration
  def change
    add_column :runrecords, :user_id, :integer
  end
end
