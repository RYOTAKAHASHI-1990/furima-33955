class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  JAPANESE_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  FULL_WIDTH_REGEX = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: JAPANESE_REGEX }
    validates :first_name, format: { with: JAPANESE_REGEX }
    validates :family_name_kana, format: { with: FULL_WIDTH_REGEX }
    validates :first_name_kana, format: { with: FULL_WIDTH_REGEX }
    validates :birthday_date
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end

  has_many :products
  has_many :purchase_records

end
