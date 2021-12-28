class Review < ApplicationRecord
  
  belongs_to :customers, optional: true

  # enum設定
  enum title: {
    bridal: 0, seizinshiki: 1, maternity: 2,
    child: 3, trip: 4, couple: 5, shichigosan: 6, friend: 7,
  }

  # バリデーション
  with_options presence: true do
    validates :title
    validates :evaluation
    validates :contents
  end

end
