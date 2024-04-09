class AddCalculationsToStockData < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :average_price, :decimal
    add_column :stocks, :max_volume, :bigint
    add_column :stocks, :min_volume, :bigint
    add_column :stocks, :max_price, :decimal
    add_column :stocks, :min_price, :decimal
  end
end
