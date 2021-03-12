class Condition < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  self.data = CsvHasher.get_hashes('condition')
  has_many :items
end