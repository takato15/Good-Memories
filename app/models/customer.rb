class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reserves
  has_many :contacts
  has_many :reviews

  # バリデーション
  with_options presence: true do
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :post_cord, presence: true
    validates :address, presence: true
  end

  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true

end
