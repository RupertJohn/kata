require 'rspec'
require_relative '../chop'

RSpec.shared_examples 'a chopper' do
    let(:chopper) { described_class.new(target, sorted_array) }
    let(:target) { (rand*10).floor }
    let(:sorted_array) { [] }

    context 'when array is empty' do
        it 'returns -1' do
            expect(chopper.chop).to eq -1
        end
    end

    context 'when element not in array' do
        let(:sorted_array) { [target + 1] }

        it 'returns -1' do
            expect(chopper.chop).to eq(-1)
        end
    end

    context 'when element is in array' do
        let(:sorted_array) { [target] }

        it 'returns the elements index in the array' do
            expect(chopper.chop).to eq(0)
        end
    end

    context 'when array length is even' do
        let(:sorted_array) { [1, 3, 5, 7] }

        context 'with element missing' do
            # [0, 2, 4, 6, 8].each do |x|
            [4].each do |x|
                it 'returns -1' do
                    chopper.target = x
                    expect(chopper.chop).to eq(-1)
                end
            end
        end

        context 'with element present' do
            [1, 3, 5, 7].each.with_index do |x, i|
                it 'returns the index of the element' do
                    chopper.target = x
                    expect(chopper.chop).to eq(i)
                end
            end
        end
    end

    context 'when array length is odd' do
        let(:sorted_array) { [1, 3, 5] }

        context 'with element missing' do
            [0, 2, 4, 6].each do |x|
                it 'returns -1' do
                    chopper.target = x
                    expect(chopper.chop).to eq(-1)
                end
            end
        end

        context 'with element present' do
            [1, 3, 5].each.with_index do |x, i|
                it 'returns the index of the element' do
                    chopper.target = x
                    expect(chopper.chop).to eq(i)
                end
            end
        end
    end
end

module Chop
    describe V1 do
        it_behaves_like 'a chopper'
    end

    describe V2 do
        it_behaves_like 'a chopper'
    end
end
