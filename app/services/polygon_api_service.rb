# frozen_string_literal: true

class PolygonApiService
  include HTTParty
  base_uri 'https://api.polygon.io'

  def initialize(ticker:, year:)
    @ticker = ticker
    @year = year
    @api_key = Rails.application.credentials.polygon[:api_key]
    @options = { query: { apiKey: @api_key, ticker:, range: '1/day', from: "#{year}-01-01", to: "#{year}-12-31" } }
  end

  def fetch_stock_data
    self.class.get(
      "/v2/aggs/ticker/#{@options[:query][:ticker]}/range/#{@options[:query][:range]}/#{@options[:query][:from]}/#{@options[:query][:to]}", @options
    )
  end
end
