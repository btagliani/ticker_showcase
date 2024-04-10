# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StockDataService do
  describe '#process_data' do
    context 'when valid data is provided' do
      let(:stock_data) do
        {
          ticker: 'AAPL',
          year: '2023',
          data: [
            { 'c' => 100.0, 'v' => 0 },
            { 'c' => 200.0, 'v' => 100_000 },
            { 'c' => 300.0, 'v' => 50_000 }
          ]
        }
      end
      let(:service) do
        StockDataService.new(ticker: stock_data[:ticker],
                             year: stock_data[:year],
                             data: stock_data[:data])
      end

      subject { service.process_data }

      it 'calculates the average stock price' do
        expect(subject.average_price).to eq(200.0)
      end

      it 'finds the maximum volume' do
        expect(subject.max_volume).to eq(100_000)
      end

      it 'calculates the average volume' do
        expect(subject.average_volume).to eq(50_000)
      end

      it 'finds the minimum volume' do
        expect(subject.min_volume).to eq(0)
      end

      it 'saves the processed data' do
        expect { subject }.to change { Stock.count }.by(1)
      end
    end
  end
end
