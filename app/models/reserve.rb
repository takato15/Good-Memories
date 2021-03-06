class Reserve < ApplicationRecord

  belongs_to :customer, optional: true

  # enum設定
  enum plan_name: {
    bridal: 0, seizinshiki: 1, maternity: 2,
    child: 3, trip: 4, couple: 5, shichigosan: 6, friend: 7,
  }

  # バリデーション
  with_options presence: true do
    validates :plan_name
    validates :count
    validates :reserve_day
  end

end
