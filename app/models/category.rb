class Category < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  self.data = CsvHasher.get_hashes('category')
  has_many :items
  has_many :brand_tags
end