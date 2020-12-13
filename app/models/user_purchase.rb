class UserPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :prefecture, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: "Input only number" }
  end

  def save
    purchase = Purchase.create(user_id: user.id, item_id: item.id)
    DeliveryDestination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end