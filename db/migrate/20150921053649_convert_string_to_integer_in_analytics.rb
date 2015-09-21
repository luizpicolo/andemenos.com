class ConvertStringToIntegerInAnalytics < ActiveRecord::Migration
  def change
    change_column :analytics, :company_id,
    'integer USING CAST(company_id AS integer)'
  end
end
