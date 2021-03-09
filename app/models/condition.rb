class Condition < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  @hashes = CsvHasher.get_hashes
  self.data = @hashes[1]
  has_many :items
end