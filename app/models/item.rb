class Item < ApplicationRecord
  
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prepare
  belongs_to             :user
  has_one_attached       :image

end
