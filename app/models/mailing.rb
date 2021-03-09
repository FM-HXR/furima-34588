class Mailing < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  @hashes = CsvHasher.get_hashes
  self.data = @hashes[2]
  has_many :items
end