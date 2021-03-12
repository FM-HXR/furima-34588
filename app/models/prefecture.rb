class Prefecture < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  self.data = CsvHasher.get_hashes('prefecture')
  has_many :items
  has_many :addresses
end