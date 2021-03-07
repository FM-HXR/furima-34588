class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true

  belongs_to :user
  has_one :order
  has_many :comments, dependent: :destroy
  has_many :item_tag_relations
  has_many :brand_tags, through: :item_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :mailing
  belongs_to :prefecture
  belongs_to :day
  belongs_to :category
end
