class Home < ApplicationRecord

  attachment :image

  belongs_to :tag

  # バリデーション
  with_options presence: true do
    validates :tag_id
    validates :image
  end

end
