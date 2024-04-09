class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.date :date
      t.decimal :open
      t.decimal :close
      t.decimal :high
      t.decimal :low
      t.bigint :volume

      t.timestamps
    end
  end
end
