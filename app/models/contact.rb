class Contact < ApplicationRecord

  belongs_to :customers, optional: true

  #バリデーション
  validates :title, presence: true
  validates :detail, presence: true

end
