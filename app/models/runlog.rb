class Runlog < ApplicationRecord
  validates :run_date, presence: true
  validates :distance, presence: true, numericality: { greater_than: 0.0 }
end
