class Runlog < ApplicationRecord
  attribute :total_time_hours, :integer
  attribute :total_time_minutes, :integer
  attribute :total_time_seconds, :integer

  belongs_to :shoe
  belongs_to :course

  has_many :runlog_details

  validates :run_date, presence: true
  validates :distance, presence: true, numericality: { greater_than: 0.0 }

  before_save do
    self.total_time =
      self.total_time_hours * 60 * 60 +
      self.total_time_minutes * 60 +
      self.total_time_seconds
  end

  def import_lap_data(lap_info)
    self.runlog_details.build(lap_info)
  end
end
