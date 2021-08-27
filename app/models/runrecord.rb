class Runrecord < ApplicationRecord
  # Validationの設定
  # see. https://railsguides.jp/active_record_validations.html
  validates :distance, numericality: { greater_than: 0.0}
  validates :runtime, numericality: { only_integer: true, greater_than: 0 }
end
