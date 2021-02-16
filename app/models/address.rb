class Address < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :post_code
    validates :city
    validates :home_number
    validates :phone_number
  end
  
  validates :building_name
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }

end
