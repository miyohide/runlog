class Shoe < ApplicationRecord
  has_many :runlog

  validates :name, presence: true, uniqueness: true
end
