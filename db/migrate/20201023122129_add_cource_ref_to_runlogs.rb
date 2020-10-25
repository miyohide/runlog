class AddCourceRefToRunlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :runlogs, :course, null: false, foreign_key: true
  end
end
