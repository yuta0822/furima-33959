class OrderAddress
  include ActiveModel::Model
  attr_accessor :phone_number, :city, :home_number, :building_name, :post_code, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :home_number
    validates :phone_number,   format: {with: /\A\d{11}\z/, message: "Input only number"}
    validates :user_id
    validates :item_id
  end
  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(city: city, home_number: home_number, phone_number: phone_number, post_code: post_code, building_name: building_name, prefecture_id: prefecture_id, order_id: order.id)
  end
end