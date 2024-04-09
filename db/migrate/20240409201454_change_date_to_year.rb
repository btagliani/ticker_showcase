class ChangeDateToYear < ActiveRecord::Migration[7.1]
  def change
    rename_column :stocks, :date, :year
  end
end
