class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to             :user
  has_one_attached       :image

  validates :image,         presence: true
  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :category_id,   numericality: { other_than: 1 } 
  validates :condition_id,  presence: true 
  validates :postage_id,    presence: true 
  validates :prefecture_id, presence: true
  validates :prepare_id,    presence: true
  validates :price ,        presence: true

end
