class Item < ApplicationRecord
  
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prepare
  belongs_to             :user
  has_one_attached       :image

  validates :image,         presence: true
  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :condition_id,  presence: true 
  validates :postage_id,    presence: true 
  validates :prefecture_id, presence: true
  validates :prepare_id,    presence: true
  validates :price ,        presence: true

end
