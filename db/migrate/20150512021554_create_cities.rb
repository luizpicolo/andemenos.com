class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.references :state, index: true

      t.timestamps null: true
    end
  end
end
