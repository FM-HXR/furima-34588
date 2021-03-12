class DaysTilPost < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  self.data = CsvHasher.get_hashes('days')
  has_many :items
end