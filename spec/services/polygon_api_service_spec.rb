# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolygonApiService do
  describe '#fetch_stock_data' do
    let(:service) { PolygonApiService.new(ticker: 'AAPL', year: '2023') }

    context 'when the API call is successful' do
      before do
        stub_request(:get, /api.polygon.io/).with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        ).to_return(status: 200, body: '', headers: {})
      end

      it 'fetches stock data' do
        response = service.fetch_stock_data
        expect(response).to be_a(HTTParty::Response)
      end
    end

    context 'when the API call fails' do
      before do
        stub_request(:get, /api.polygon.io/).to_raise(HTTParty::Error)
      end

      it 'raises an error' do
        expect { service.fetch_stock_data }.to raise_error(PolygonApiService::ApiError)
      end
    end
  end
end
