class Category < ActiveHash::Base
  self.data = []
  
  include ActiveHash::Associations
  has_many :items
  has_many :brand_tags
end