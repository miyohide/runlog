class AddReferencesToRunlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :runlogs, :shoe, foreign_key: true
  end
end
