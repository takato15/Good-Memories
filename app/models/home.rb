class Home < ApplicationRecord
  attachment :image

  belongs_to :tag

  validates :tag_id, presence: true
  validates :image, presence: true

end
