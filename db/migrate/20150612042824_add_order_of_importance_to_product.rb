class AddOrderOfImportanceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :order_of_importance, :integer, default: 0, index: true
  end
end
