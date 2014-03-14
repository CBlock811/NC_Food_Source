class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.text :path
      t.references :product, index: true

      t.timestamps
    end
  end
end
