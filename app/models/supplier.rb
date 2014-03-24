class Supplier < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :supplier_images, dependent: :destroy
  has_many :supplier_comments, dependent: :destroy

  validates_presence_of :name
end
