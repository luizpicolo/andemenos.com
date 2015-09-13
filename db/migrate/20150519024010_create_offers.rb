# Class migrate offer
class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :product, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.decimal :regular_price
      t.decimal :offer_price
      t.date :start_date_offer
      t.date :end_date_offer

      t.timestamps null: false
    end
  end
end
