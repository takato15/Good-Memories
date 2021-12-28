class Tag < ApplicationRecord

  has_many :homes

  # バリデーション
  validates :name, presence: true

end
