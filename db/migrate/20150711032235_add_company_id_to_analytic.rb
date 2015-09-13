class AddCompanyIdToAnalytic < ActiveRecord::Migration
  def change
    add_column :analytics, :company_id, :string
  end
end
