class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_subcategory, index: true
      t.string :image
      t.timestamps null: false
    end
  end
end
