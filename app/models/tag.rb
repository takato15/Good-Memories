class Tag < ApplicationRecord

  has_many :homes

  validates :name, presence: true

end
