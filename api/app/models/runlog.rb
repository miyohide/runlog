class Runlog < ApplicationRecord
  validates :running_date, uniqueness: { scope: :start_time }
end
