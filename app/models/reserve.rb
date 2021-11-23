class Reserve < ApplicationRecord

  belongs_to :customer, optional: true

  #enum設定
  enum plan_name: { bridal: 0, seizinshiki: 1, maternity: 2,
  child: 3, trip: 4, couple: 5, shichigosan: 6, friend: 7
  }

end