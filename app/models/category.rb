class Category < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  @hashes = CsvHasher.get_hashes
  self.data = @hashes[0]
  has_many :items
  has_many :brand_tags
end