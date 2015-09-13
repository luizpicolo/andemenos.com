# Migration Line of Business
class CreateLineOfBusinesses < ActiveRecord::Migration
  def change
    create_table :line_of_businesses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
