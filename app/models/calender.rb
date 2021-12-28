class Calender < ApplicationRecord

  # バリデーション
  validates :start_time, presence: true

end
