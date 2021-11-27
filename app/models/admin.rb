class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :post_cord, presence: true, format: { with: /\A\d{7}\z/, message: "半角数字、ハイフンなしで入力して下さい" }
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: {only_integer: true}
  validates :email, presence: true, uniqueness: true

end
