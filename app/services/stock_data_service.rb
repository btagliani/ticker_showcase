# frozen_string_literal: true

class StockDataService
  def initialize(ticker: '', year: '', data: [])
    @ticker = ticker
    @year = year
    @data = data
  end

  def process_data
    processed_data = {
      ticker: @ticker,
      year: @year,
      max_volume: calculate_max_volume,
      min_volume: calculate_min_volume,
      max_price: calculate_max_price,
      min_price: calculate_min_price,
      average_price: calculate_average_price,
      average_volume: calculate_average_volume
    }

    save_data(processed_data)
  end

  private

  def calculate_average_volume
    total_volume = @data.sum { |day| day['v'] }
    (total_volume / @data.size).round(2)
  end

  def calculate_average_price
    total_price = @data.sum { |day| day['c'].to_f }
    (total_price / @data.size).round(2)
  end

  def calculate_max_volume
    @data.max_by { |day| day['v'] }['v']
  end

  def calculate_min_volume
    @data.min_by { |day| day['v'] }['v']
  end

  def calculate_max_price
    @data.max_by { |day| day['h'] }['h']
  end

  def calculate_min_price
    @data.min_by { |day| day['l'] }['l']
  end

  def save_data(processed_data)
    Stock.create!(processed_data)
  end
end
