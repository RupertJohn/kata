require 'rspec'
require_relative '../chop'
require 'pry'

RSpec.shared_examples 'a chopper' do
    let(:chopper) { described_class.new }

    context 'when element not in array' do
        it 'returns -1' do
            expect(chopper.chop(3, [])).to eq(-1)
            expect(chopper.chop(3, [1])).to eq(-1)
        end
    end

    context 'when element is in array' do
        it 'returns the elements index in athe array' do
            expect(chopper.chop(3, [3])).to eq(0)
        end
    end

    context 'when array length is even' do
        context 'with element missing' do
            it 'returns -1' do
                expect(chopper.chop(0, [1, 3, 5, 7])).to eq(-1)
                expect(chopper.chop(2, [1, 3, 5, 7])).to eq(-1)
                expect(chopper.chop(4, [1, 3, 5, 7])).to eq(-1)
                expect(chopper.chop(6, [1, 3, 5, 7])).to eq(-1)
            end
        end

        context 'with element present' do
            it 'returns the index of the element' do
                expect(chopper.chop(1, [1, 3, 5, 7])).to eq(0)
                expect(chopper.chop(3, [1, 3, 5, 7])).to eq(1)
                expect(chopper.chop(5, [1, 3, 5, 7])).to eq(2)
                expect(chopper.chop(7, [1, 3, 5, 7])).to eq(3)
            end
        end
    end

    context 'when array length is odd' do
        context 'with element missing' do
            it 'returns -1' do
                expect(chopper.chop(0, [1, 3, 5])).to eq(-1)
                expect(chopper.chop(2, [1, 3, 5])).to eq(-1)
                expect(chopper.chop(4, [1, 3, 5])).to eq(-1)
            end
        end

        context 'with element present' do
            it 'returns the index of the element' do
                expect(chopper.chop(1, [1, 3, 5])).to eq(0)
                expect(chopper.chop(3, [1, 3, 5])).to eq(1)
                expect(chopper.chop(5, [1, 3, 5])).to eq(2)
            end
        end
    end
end

module Chop
    describe V1 do
        it_behaves_like 'a chopper' 
    end
end
