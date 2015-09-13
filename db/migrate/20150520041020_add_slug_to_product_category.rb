class AddSlugToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :slug, :string, index: true, unique: true
  end
end
