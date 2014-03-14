class CreateSupplierImages < ActiveRecord::Migration
  def change
    create_table :supplier_images do |t|
      t.text :path
      t.references :supplier, index: true

      t.timestamps
    end
  end
end
