class Prefecture < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  @hashes = CsvHasher.get_hashes
  self.data = @hashes[3]
  has_many :items
  has_many :addresses
end