class AddSlugToProductSubcategory < ActiveRecord::Migration
  def change
    add_column :product_subcategories, :slug, :string, index: true, unique: true
  end
end
