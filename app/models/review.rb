class Review < ApplicationRecord
  belongs_to :customers, optional: true

  validates :title, presence: true
  validates :evaluation, presence: true
  validates :contents, presence: true

  # enum設定
  enum title: {
    bridal: 0, seizinshiki: 1, maternity: 2,
    child: 3, trip: 4, couple: 5, shichigosan: 6, friend: 7,
  }
end
