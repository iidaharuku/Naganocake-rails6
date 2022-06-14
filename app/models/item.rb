class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :stock_status, presence: true
end
