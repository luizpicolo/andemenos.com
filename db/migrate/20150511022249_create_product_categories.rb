class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name, unique: true
      t.integer :order_of_importance, default: 0

      t.timestamps null: false
    end
  end
end
