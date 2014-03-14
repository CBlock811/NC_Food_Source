class Supplier < ActiveRecord::Base
  has_many :products
  has_many :supplier_images
  has_many :supplier_comments
end
