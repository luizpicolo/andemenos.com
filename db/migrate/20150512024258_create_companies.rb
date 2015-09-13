# Migration Company
class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.references :city, index: true, foreign_key: true
      t.references :line_of_business, index: true, foreign_key: true
      t.string :logo
      t.text :description
      t.float :lat
      t.float :log
      t.string :facebook
      t.string :website

      t.timestamps null: false
    end
  end
end
