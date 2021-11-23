class Review < ApplicationRecord

  belongs_to :customers, optional: true

  validates :title, presence: true
  validates :evaluation, presence: true
  validates :contents, presence: true

end
