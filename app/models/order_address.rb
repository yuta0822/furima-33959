class OrderAddress
  include ActiveModel::Model
  attr_accessor :phone_number, :prefecture, :city, :house_number, :building_name, :post_code, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :home_number
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :building_name
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }


end