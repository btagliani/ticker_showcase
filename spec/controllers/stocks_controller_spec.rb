# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::StocksController, type: :controller do
  describe 'GET #index' do
    context 'when the ticker symbol is valid' do
      before do
        fake_response = double('HTTParty::Response', success?: true)
        allow(fake_response).to receive(:[]).with('results').and_return([
                                                                          { 'c' => 100.0, 'v' => 0 },
                                                                          { 'c' => 200.0, 'v' => 100_000 },
                                                                          { 'c' => 300.0, 'v' => 50_000 }
                                                                        ])

        expect_any_instance_of(PolygonApiService).to receive(:fetch_stock_data)
          .and_return(fake_response)
      end

      it 'returns a successful response' do
        get :index, params: { ticker: 'AAPL' }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
