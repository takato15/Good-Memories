class Calender < ApplicationRecord
  validates :start_time, presence: true
end
