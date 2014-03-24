class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :product_images
  validates :name, uniqueness: true
end
