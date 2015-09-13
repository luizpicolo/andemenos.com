# Migration
class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :iso
      t.references :country, index: true, foreign_key: true

      t.timestamps null: true
    end
  end
end
