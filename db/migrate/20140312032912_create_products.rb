class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :supplier, index: true

      t.timestamps
    end
  end
end
