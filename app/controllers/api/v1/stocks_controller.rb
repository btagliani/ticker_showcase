# frozen_string_literal: true

class Api::V1::StocksController < ApplicationController
  def index
    ticker = params[:ticker].upcase
    year = params[:year] || '2023'

    existing_data = Stock.find_by(ticker:, year:)

    if existing_data.present?
      render json: existing_data
    else
      fetch_and_process_data(ticker, year)
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def fetch_and_process_data(ticker, year)
    api_service = PolygonApiService.new(ticker:, year:)
    response = api_service.fetch_stock_data

    if response.success?
      stock_service = StockDataService.new(ticker:, year:, data: response['results'])
      processed_data = stock_service.process_data

      render json: processed_data
    else
      render json: { error: 'Failed to fetch data from Polygon API' }, status: :bad_request
    end
  end
end
