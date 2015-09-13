class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :ip
      t.references :product, index: true, foreign_key: true
      t.references :product_category, index: true, foreign_key: true
      t.references :product_subcategory, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
