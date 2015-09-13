# Migration
class AddForeignKeyProductCategoryProduct < ActiveRecord::Migration
  def change
    add_foreign_key :products, :product_subcategories
  end
end
