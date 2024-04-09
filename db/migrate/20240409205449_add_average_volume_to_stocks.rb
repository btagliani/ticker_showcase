class AddAverageVolumeToStocks < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :average_volume, :integer
  end
end
