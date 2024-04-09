class ChangeDateToStringInStocks < ActiveRecord::Migration[6.0]
  def change
    change_column :stocks, :date, :string
  end
end
