class AddLocalToAnalytic < ActiveRecord::Migration
  def change
    add_column :analytics, :local, :string
  end
end
