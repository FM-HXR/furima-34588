class BrandTag < ApplicationRecord
  has_many :item_tag_relations
  has_many :items, through: :item_tag_relations
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
