class ItemTagRelation < ApplicationRecord
  belongs_to :item
  belongs_to :brand_tag
end
