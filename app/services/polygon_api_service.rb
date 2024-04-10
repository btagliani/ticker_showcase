# frozen_string_literal: true

class PolygonApiService
  include HTTParty
  base_uri 'https://api.polygon.io'

  class ApiError < StandardError; end

  def initialize(ticker:, year:)
    @ticker = ticker
    @year = year
    @api_key = Rails.application.credentials.polygon[:api_key]
    @options = { query: { apiKey: @api_key, ticker:, range: '1/day', from: "#{year}-01-01", to: "#{year}-12-31" } }
  end

  def fetch_stock_data
    begin
      response = self.class.get(
        "/v2/aggs/ticker/#{@ticker}/range/1/day/#{@year}-01-01/#{@year}-12-31",
        @options
      )
    rescue StandardError => e
      raise ApiError, e.message
    end

    response
  end
end
