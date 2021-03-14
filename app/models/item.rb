class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :comments, dependent: :destroy
  has_many :item_tag_relations
  has_many :brand_tags, through: :item_tag_relations
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :mailing_cost
  belongs_to :prefecture
  belongs_to :days_til_post
  belongs_to :category

  validates :title, presence: true
  validates :price, presence: true, numericality: { :greater_than => 299, :less_than => 10000000 }
  validates :description, presence: true

  validates :condition_id, numericality: { other_than: 1 }
  validates :mailing_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_til_post_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
end
