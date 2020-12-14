class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  letters = /\A[ぁ-んァ-ン一-龥]+\z/
  kana = /\A[ァ-ン]+\z/
  letters_numbers = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  with_options presence: true do
    validates :nickname
    validates :birth_day

    validates :password, format: { with: letters_numbers, message: "Include both letters and numbers"}

    with_options format: { with: letters, message: "Full-width characters"} do
      validates :first_name
      validates :family_name
    end

    with_options format: { with: kana, message: "Full-width katakana characters"} do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
end
