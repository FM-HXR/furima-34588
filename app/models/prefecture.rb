class Prefecture < ActiveHash::Base
  self.data = []
  
  include ActiveHash::Associations
  has_many :items
  has_many :addresses
end