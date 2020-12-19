class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliveryFeeBurden
  belongs_to :deliverySource
  belongs_to :deliveryDay

  numbers = /\A[0-9]+\z/
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation

    validates :price, format: { with: numbers, message: "Half-width number"},
                      numericality: {
                        only_interger: true,
                        greater_than_or_equal_to: 300,
                        less_than_or_equal_to: 9999999,
                        message: 'Out of setting range' 
                      }

    with_options numericality: { other_than: 1, message: "Select" }  do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_burden_id
      validates :delivery_source_id
      validates :delivery_day_id
    end

  end
end
