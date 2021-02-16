class Address < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :city
    validates :home_number
    validates :phone_number
  end

  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :building_name
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }

end
