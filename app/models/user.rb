class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname  
    validates :birthdate 
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }  do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }do
   validates :family_name_kana
   validates :first_name_kana
  end 
  
  with_options presence: true, length:{ minimum:6 }, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: "is invalid. Input full-width katakana characters." }do
   validates :encrypted_password
   validates :password
   validates :password_confirmation
  end
end