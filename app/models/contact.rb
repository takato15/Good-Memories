class Contact < ApplicationRecord
  
  belongs_to :customers, optional: true

  # バリデーション
  with_options presence: true do
    validates :title
    validates :detail
    validates :title_reply
    validates :detail_reply
  end

end
