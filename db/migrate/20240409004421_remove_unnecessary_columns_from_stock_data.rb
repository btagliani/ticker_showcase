class RemoveUnnecessaryColumnsFromStockData < ActiveRecord::Migration[7.1]
  def change
    remove_column :stocks, :open, :decimal
    remove_column :stocks, :close, :decimal
    remove_column :stocks, :high, :decimal
    remove_column :stocks, :low, :decimal
    remove_column :stocks, :volume, :bigint
  end
end
