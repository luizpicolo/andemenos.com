class AddHightLightToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :hightlight, :boolean, default: false
  end
end
