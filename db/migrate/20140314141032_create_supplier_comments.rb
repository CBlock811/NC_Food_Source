class CreateSupplierComments < ActiveRecord::Migration
  def change
    create_table :supplier_comments do |t|
      t.text :body
      t.references :supplier, index: true

      t.timestamps
    end
  end
end
