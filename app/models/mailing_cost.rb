class MailingCost < ActiveHash::Base
  include CsvHasher
  include ActiveHash::Associations
  self.data = CsvHasher.get_hashes('mailing')
  has_many :items
end