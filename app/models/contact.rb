class Contact < ApplicationRecord

  belongs_to :customers, optional: true

  #バリデーション
  validates :title, presence: true
  validates :detail, presence: true
  validates :title_reply, presence: true
  validates :detail_reply, presence: true

end
