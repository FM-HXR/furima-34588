class DaysTilPost < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  @hashes = CsvHasher.get_hashes
  self.data = @hashes[4]
  has_many :items
end