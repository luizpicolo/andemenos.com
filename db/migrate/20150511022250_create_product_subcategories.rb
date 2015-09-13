class CreateProductSubcategories < ActiveRecord::Migration
  def change
    create_table :product_subcategories do |t|
      t.string :name
      t.references :product_category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
