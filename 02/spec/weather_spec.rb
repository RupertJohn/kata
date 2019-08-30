require 'rspec'
require_relative '../weather'

RSpec.describe Weather do
    subject { described_class.new(max_temps, min_temps, avg_temps) }
    let(:max_temps) { [50, 60, 70, 80, 90, 100] }
    let(:min_temps) { [0, 15, 30, 45, 60, 75] }
    let(:avg_temps) { [15, 30, 45, 60, 75, 90] }

    describe '#temperature_spreads' do
        it 'returns the temperature differences' do
            expect(subject.temperature_spreads).to eq [50, 45, 40, 35, 30, 25]
        end
    end

    describe '#max_spread_day' do
        it 'returns the day with the maximum temp spread' do
            expect(subject.max_spread_day).to eq 1
        end
    end

    describe '#min_spread_day' do
        it 'returns the day with the minimum temp spread' do
            expect(subject.min_spread_day).to eq 6
        end
    end
end
