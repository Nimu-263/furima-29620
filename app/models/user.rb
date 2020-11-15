class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  letters = /\A[ぁ-んァ-ン一-龥]+\z/
  kana = /\A[ァ-ン]+\z/
  letters_numbers = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :nickname,          presence: true
  validates :password,          presence: true, format: { with: letters_numbers, message: "Include both letters and numbers"}
  validates :first_name,        presence: true, format: { with: letters, message: "Full-width characters"}
  validates :family_name,       presence: true, format: { with: letters, message: "Full-width characters"}
  validates :first_name_kana,   presence: true, format: { with: kana, message: "Full-width katakana characters"}
  validates :family_name_kana,  presence: true, format: { with: kana, message: "Full-width katakana characters"}
  validates :birth_day,         presence: true
end
